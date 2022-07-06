////
////  AMTOpenUrlTabViewModel.swift
////  AMKExtensions
////
////  Created by 孟昕欣 on 2022/7/4.
////  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
////
//
//import UIKit
//import Alamofire
//import HandyJSON
//
//typealias AMTOpenUrlTabViewModelReloadCompletionHandler = (_ error: Error?) -> Void
//
//class AMTOpenUrlTabViewModel: NSObject {
//
//    // MARK: - Deinit Methods
//    
//    deinit {
//        
//    }
//    
//    // MARK: - Init Methods
//    
//    init(sectionViewModels: [AMTOpenUrlSectionViewModel]?) {
//        super.init()
//        self.sectionViewModels = sectionViewModels
//    }
//    
//    // MARK: - Getters & Setters
//    
//    var sectionViewModels: [AMTOpenUrlSectionViewModel]?
//    
//    // MARK: - Data & Networking
//    
//    /// 联网请求 刷新数据
//    func reloadDataFromNetworking(completionHandler: AMTOpenUrlTabViewModelReloadCompletionHandler?) {
//        let urlString = "https://www.fastmock.site/mock/918edb52006d5f75261f317f3ba37180/tester/data"
//        let url = URL(string: urlString)!
//        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
//            
//            debugPrint("\(data)")
//            
//            do {
//                var dict = try JSONSerialization.jsonObject(with: data ?? Data(), options: .mutableContainers)
//                print("\(dict)")
//            } catch {
//                fatalError("Error occurred: \(error)")
//            }
//            
//            DispatchQueue.main.sync {
//                completionHandler?(error)
//            }
//        }
//        dataTask.resume()
//    }
//    
//    // MARK: - Action Methods
//    
//    // MARK: - Notifications
//    
//    // MARK: - Protocol
//    
//    // MARK: - Helper Methods
//
//    
//}
