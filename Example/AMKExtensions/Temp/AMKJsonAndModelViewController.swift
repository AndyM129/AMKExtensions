//
//  AMKJsonAndModelViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/4.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import HandyJSON

/// Json 与 Model 互转
class AMKJsonAndModelViewController: AMKStackViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Json 与 Model 互转"
        test_Codable()
        test_HandyJSON()
    }
    
    // MARK: - Codable
    
    //    {
    //        "results": [{
    //            "location": {
    //                "id": "WX4FBXXFKE4F",
    //                "name": "北京",
    //                "country": "CN",
    //                "path": "北京,北京,中国",
    //                "timezone": "Asia/Shanghai",
    //                "timezone_offset": "+08:00"
    //            },
    //            "now": {
    //                "text": "多云",
    //                "code": "4",
    //                "temperature": "10"
    //            },
    //            "last_update": "2022-05-06T20:30:00+08:00"
    //        }]
    //    }
    
    class Location: NSObject, Codable {
        enum CodingKeys: String, CodingKey {
            case id, name, country, path, timezone, timezoneOffset = "timezone_offset"
        }
        
        var id: String? // "WX4FBXXFKE4F",
        var name: String? // "北京",
        var country: String? // "CN",
        var path: String? // "北京,北京,中国",
        var timezone: String? // "Asia/Shanghai",
        var timezoneOffset: String? // "+08:00"
    }
    
    class Now: NSObject, Codable {
        var text: String? // "多云",
        var code: String? // "4",
        var temperature: String? // "10"
    }
    
    class Result: NSObject, Codable {
        enum CodingKeys: String, CodingKey {
            case location, now, lastUpdate = "last_update"
        }
        
        var location: Location?
        var now: Now?
        var lastUpdate: String? // "2022-05-06T20:30:00+08:00"
    }
    
    func test_Codable() {
        // https://juejin.cn/post/7044871144091942925#heading-1
        stackView.addArrangedSeparator(withTitle: "基于 Codable", color: view.tintColor, size: 13)
        stackView.addArrangedButton("简单 - Json 转 Model", controlEvents: .touchUpInside) { sender in
            let jsonString = "{\"id\":\"WX4FBXXFKE4F\",\"name\":\"北京\",\"country\":\"CN\",\"path\":\"北京,北京,中国\",\"timezone\":\"Asia/Shanghai\",\"timezone_offset\":\"+08:00\"}"
            let jsonData = jsonString.data(using: String.Encoding.utf8)
            let model = try? JSONDecoder().decode(Location.self, from: jsonData ?? Data())
            print("\(jsonString)\n=>\(String(describing: model))\n\n\n")
        }
        stackView.addArrangedButton("简单 - Model 转 Json", controlEvents: .touchUpInside) { sender in
            let model = Location()
            model.id = "aaa"
            model.name = "bbb"
            model.country = "ccc"
            model.path = "ddd"
            model.timezone = "eeee"
            
            let jsonData = try? JSONEncoder().encode(model)
            let jsonString = String(data: jsonData ?? Data(), encoding: .utf8)
            print("\(model)\n=>\(String(describing: jsonString))\n\n\n")
        }
        
        // https://juejin.cn/post/7044871144091942925#heading-3
        stackView.addArrangedButton("多级嵌套 - Json 转 Model", controlEvents: .touchUpInside) { sender in
            let jsonString = "{\"location\":{\"id\":\"WX4FBXXFKE4F\",\"name\":\"北京\",\"country\":\"CN\",\"path\":\"北京,北京,中国\",\"timezone\":\"Asia/Shanghai\",\"timezone_offset\":\"+08:00\"},\"now\":{\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"10\"},\"last_update\":\"2022-05-06T20:30:00+08:00\"}"
            let jsonData = jsonString.data(using: String.Encoding.utf8)
            let model = try? JSONDecoder().decode(Result.self, from: jsonData ?? Data())
            print("\(jsonString)\n=>\(String(describing: model))\n\n\n")
        }
    }
        
    // MARK: - HandyJSON
    
    // 接口：http://apis.juhe.cn/simpleWeather/query?city=%E5%8C%97%E4%BA%AC&key=251518e073ef6c3c9504dd286c3f6a86
    //
    //    {
    //        "reason": "查询成功!",
    //        "result": {
    //            "city": "北京",
    //            "realtime": {
    //                "temperature": "28",
    //                "humidity": "88",
    //                "info": "晴",
    //                "wid": "00",
    //                "direct": "东南风",
    //                "power": "3级",
    //                "aqi": "35"
    //            },
    //            "future": [
    //                {
    //                    "date": "2022-07-07",
    //                    "temperature": "25/33℃",
    //                    "weather": "多云转阴",
    //                    "wid": {
    //                        "day": "01",
    //                        "night": "02"
    //                    },
    //                    "direct": "西南风转北风"
    //                },
    //                {
    //                    "date": "2022-07-08",
    //                    "temperature": "24/32℃",
    //                    "weather": "多云",
    //                    "wid": {
    //                        "day": "01",
    //                        "night": "01"
    //                    },
    //                    "direct": "北风"
    //                }
    //            ]
    //        },
    //        "error_code": 0
    //    }

    
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
    
    class Result2: HandyJSON {
        var city: String?
        var realtime: Realtime?
        var future: [Future]?
        required init() {}
    }
    
    class NetworkingModel: HandyJSON {
        var reason: String?
        var result: Result2?
        var errorCode: Int?
        required init() {}
        
        // 支持自定义解析规则，详见：https://github.com/alibaba/HandyJSON/blob/master/README_cn.md#%E8%87%AA%E5%AE%9A%E4%B9%89%E8%A7%A3%E6%9E%90%E8%A7%84%E5%88%99
        func mapping(mapper: HelpingMapper) {
            mapper <<<
                self.errorCode <-- "error_code"
        }
    }
    
    // https://github.com/alibaba/HandyJSON/blob/master/README_cn.md
    func test_HandyJSON() {
        stackView.addArrangedSeparator(withTitle: "基于 HandyJSON", color: view.tintColor, size: 13)
        stackView.addArrangedButton("简单 - Json String 转 Model", controlEvents: .touchUpInside) { sender in
            let jsonString = "{\"day\":\"01\",\"night\":\"02\"}"
            let model = Wid.deserialize(from: jsonString)
            print("\(jsonString)\n=>\(String(describing: model))\n\n\n")
        }
        stackView.addArrangedButton("简单 - Json Dict 转 Model", controlEvents: .touchUpInside) { sender in
            let jsonDict: [String: Any] = ["day":"01", "night":"02"]
            let model = Wid.deserialize(from: jsonDict)
            print("\(jsonDict)\n=>\(String(describing: model))\n\n\n")
        }
        stackView.addArrangedButton("简单 - Model 转 Json", controlEvents: .touchUpInside) { sender in
            let model = Wid()
            model.day = "ddd"
            model.night = "nnn"
            
            let jsonString = model.toJSONString(prettyPrint: true)
            print("\(model)\n=>\(String(describing: jsonString))\n\n\n")
            
            let jsonDict = model.toJSON()
            print("\(model)\n=>\(String(describing: jsonDict))\n\n\n")
        }
        
        stackView.addArrangedButton("复杂 - Json String 转 Model", controlEvents: .touchUpInside) { sender in
            let jsonString = "{\"reason\":\"查询成功!\",\"result\":{\"city\":\"北京\",\"realtime\":{\"temperature\":\"28\",\"humidity\":\"88\",\"info\":\"晴\",\"wid\":\"00\",\"direct\":\"东南风\",\"power\":\"3级\",\"aqi\":\"35\"},\"future\":[{\"date\":\"2022-07-07\",\"temperature\":\"25/33℃\",\"weather\":\"多云转阴\",\"wid\":{\"day\":\"01\",\"night\":\"02\"},\"direct\":\"西南风转北风\"},{\"date\":\"2022-07-08\",\"temperature\":\"24/32℃\",\"weather\":\"多云\",\"wid\":{\"day\":\"01\",\"night\":\"01\"},\"direct\":\"北风\"}]},\"error_code\":0}"
            let model = NetworkingModel.deserialize(from: jsonString)
            print("\(jsonString)\n=>\(String(describing: model))\n\n\n")
        }
        stackView.addArrangedButton("复杂 - Model 转 Json Dict", controlEvents: .touchUpInside) { sender in
            let jsonString = "{\"reason\":\"查询成功!\",\"result\":{\"city\":\"北京\",\"realtime\":{\"temperature\":\"28\",\"humidity\":\"88\",\"info\":\"晴\",\"wid\":\"00\",\"direct\":\"东南风\",\"power\":\"3级\",\"aqi\":\"35\"},\"future\":[{\"date\":\"2022-07-07\",\"temperature\":\"25/33℃\",\"weather\":\"多云转阴\",\"wid\":{\"day\":\"01\",\"night\":\"02\"},\"direct\":\"西南风转北风\"},{\"date\":\"2022-07-08\",\"temperature\":\"24/32℃\",\"weather\":\"多云\",\"wid\":{\"day\":\"01\",\"night\":\"01\"},\"direct\":\"北风\"}]},\"error_code\":0}"
            let model = NetworkingModel.deserialize(from: jsonString)
            
            let jsonDict = model?.toJSON()
            print("\(model)\n=>\(String(describing: jsonDict))\n\n\n")
        }
    }
}


