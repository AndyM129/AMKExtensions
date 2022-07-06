//
//  AMNetworkingViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/5.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import AMKExtensions
import SwiftyJSON
import HandyJSON
import Alamofire

class AMNetworkingViewController: AMStackViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "网络请求"
        test_URLSession()
        test_Alamofire()
    }
    
    // MARK: -
    
    func test_URLSession() {
        stackView.addArrangedSeparator(withTitle: "URLSession", color: view.tintColor, size: 13)
        stackView.addArrangedButton("dataTask", controlEvents: .touchUpInside) { sender in
            let urlString = "http://apis.juhe.cn/simpleWeather/query?city=%E5%8C%97%E4%BA%AC&key=251518e073ef6c3c9504dd286c3f6a86"
            guard let url = URL(string: urlString) else {
                return AMKELog.error("url 创建失败：\(urlString)")
            }
            
            let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                let json = JSON(data ?? Data())
                AMKELog.info("\n\nresponse => \(String(describing: response))\n\njson from data => \(json)\n\nerror => \(String(describing: error))")
            }
            dataTask.resume()
        }
        
        stackView.addArrangedButton("dataTask - 进阶+Model解析", controlEvents: .touchUpInside) { sender in
            let urlString = "http://apis.juhe.cn/simpleWeather/query?city=%E5%8C%97%E4%BA%AC&key=251518e073ef6c3c9504dd286c3f6a86"
            guard let url = URL(string: urlString) else {
                return AMKELog.error("url 创建失败：\(urlString)")
            }
            guard let request = try? URLRequest(url: url, method: .post, headers: nil) else {
                return AMKELog.error("request 创建失败：\(urlString)")
            }
            
            let session = URLSession(configuration: {
                let configuration = URLSessionConfiguration.default
                configuration.timeoutIntervalForRequest = 5
                return configuration
            }())
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    return AMKELog.error("\(response?.url?.absoluteString ?? "") => \(String(describing: error))")
                }
                guard let data = data else {
                    return AMKELog.error("\(response?.url?.absoluteString ?? "") => \(String(describing: data))")
                }
                guard let jsonString = String(data: data, encoding: .utf8) else {
                    return AMKELog.error("data 解析失败：\(data)")
                }
                let model = NetworkingModel.deserialize(from: jsonString)!
                AMKELog.info("\(response?.url?.absoluteString ?? "") => \(model.reason ?? "") \(model.toJSONString(prettyPrint: true) ?? "")")
                //AMKELog.info(JSON(data ?? Data()))
            }
            dataTask.resume()
        }
        
        stackView.addArrangedButton("dataTask - 封装+Model解析", controlEvents: .touchUpInside) { _ in
            enum AMURLSessionTaskError: Error {
                case invalidUrlString(_ description: String? = nil)
                case invalidResponseData(_ description: String? = nil)
            }
            
            typealias AMURLSessionTaskCompletionHandler = (URLResponse?, JSON?, Error?) -> Void
            
            // 封装一个网络请求的方法
            func request(_ urlString: String?, params: [String: Any?] = [:], method: HTTPMethod? = .get, completionHandler: AMURLSessionTaskCompletionHandler?) -> Void {
                let completionHandler = completionHandler ?? { data, response, error in }
                
                guard let urlString = urlString else {
                    return completionHandler(nil, nil, AMURLSessionTaskError.invalidUrlString("urlString 为空"))
                }
                guard let url = URL(string: urlString) else {
                    return completionHandler(nil, nil, AMURLSessionTaskError.invalidUrlString("url 创建失败"))
                }
                guard let request = try? URLRequest(url: url, method: .post, headers: nil) else {
                    return completionHandler(nil, nil, AMURLSessionTaskError.invalidUrlString("request 创建失败"))
                }
                
                let session = URLSession(configuration: {
                    let configuration = URLSessionConfiguration.default
                    configuration.timeoutIntervalForRequest = 5
                    return configuration
                }())
                
                let dataTask = session.dataTask(with: request) { data, response, error in
                    guard error == nil else {
                        return completionHandler(response, nil, error)
                    }
                    guard let data = data else {
                        return completionHandler(response, nil, AMURLSessionTaskError.invalidResponseData("data 为空"))
                    }
                    guard let jsonString = String(data: data, encoding: .utf8) else {
                        return completionHandler(response, nil, AMURLSessionTaskError.invalidResponseData("data 解析失败"))
                    }
                    return completionHandler(response, JSON(parseJSON: jsonString), nil)
                }
                dataTask.resume()
            }
            
            // 调用
            request("http://apis.juhe.cn/simpleWeather/query?city=%E5%8C%97%E4%BA%AC&key=251518e073ef6c3c9504dd286c3f6a86") { response, json, error in
                guard error == nil else {
                    return AMKELog.error("\(response?.url?.absoluteString ?? "") => \(String(describing: error))")
                }
                guard let model = NetworkingModel.deserialize(from: json!.dictionaryObject) else {
                    return AMKELog.error("model 解析失败：\(json!)")
                }
                AMKELog.info("\(response?.url?.absoluteString ?? "") => \(model.reason ?? "") \(model.toJSONString(prettyPrint: true) ?? "")")
            }
        }
    }
    
    // MARK: - Alamofire
    
    // https://juejin.cn/post/6974791858744459294
    func test_Alamofire() {
        stackView.addArrangedSeparator(withTitle: "Alamofire", color: view.tintColor, size: 13)
        stackView.addArrangedButton("简单请求 - GET", controlEvents: .touchUpInside) { sender in
            let urlString = "https://httpbin.org/get?aa=11&bb=22" //"https://itunes.apple.com/lookup?id=414478124"
            AF.request(urlString).response { response in
                guard let data = response.data else {
                    return AMKELog.info("data 为空")
                }
                guard let jsonString = String(data: data, encoding: .utf8) else {
                    return AMKELog.info("data 解析失败")
                }
                AMKELog.info(JSON(parseJSON: jsonString))
            }
        }
        stackView.addArrangedButton("简单请求 - POST", controlEvents: .touchUpInside) { sender in
            let urlString = "https://httpbin.org/post?xx=88&yy=99"
            let parameters = ["aa":11, "bb":22]
            AF.request(urlString, method: .post, parameters: parameters).response { response in
                guard let data = response.data else {
                    return AMKELog.info("data 为空")
                }
                guard let jsonString = String(data: data, encoding: .utf8) else {
                    return AMKELog.info("data 解析失败")
                }
                AMKELog.info(JSON(parseJSON: jsonString))
            }
        }
    }
    
    // MARK: - 用到的 Model
    
    class Wid: HandyJSON {
        var day: String? // "01",
        var night: String? // "02"
        required init() {}
    }
    
    class Future: HandyJSON {
        var date: String? // "2022-07-07",
        var temperature: String? // "25/33℃",
        var weather: String? // "多云转阴",
        var wid: Wid?
        var direct: String? // "西南风转北风"
        required init() {}
    }
    
    class Realtime: HandyJSON {
        var temperature: String? // "28",
        var humidity: String? // "88",
        var info: String? // "晴",
        var wid: String? // "00",
        var direct: String? // "东南风",
        var power: String? // "3级",
        var aqi: String? // "35"
        required init() {}
    }
    
    class Result: HandyJSON {
        var city: String?
        var realtime: Realtime?
        var future: [Future]?
        required init() {}
    }
    
    class NetworkingModel: HandyJSON {
        var reason: String?
        var result: Result?
        var errorCode: Int?
        required init() {}
        
        // 支持自定义解析规则，详见：https://github.com/alibaba/HandyJSON/blob/master/README_cn.md#%E8%87%AA%E5%AE%9A%E4%B9%89%E8%A7%A3%E6%9E%90%E8%A7%84%E5%88%99
        func mapping(mapper: HelpingMapper) {
            mapper <<<
                self.errorCode <-- "error_code"
        }
    }

}
