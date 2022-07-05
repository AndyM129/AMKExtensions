//
//  AMLogViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/5.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import SwiftyBeaver
//import TinyConsole

/// 开发调试日志
class AMLogViewController: AMStackViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "开发调试日志"
        
        test_print()
        test_debugPrint()
        test_SwiftyBeaver()
        test_TinyConsole()
    }

    func test_print() {
        
        stackView.addArrangedSeparator(withTitle: "print", color: view.tintColor, size: 13)
        stackView.addArrangedButton("log", controlEvents: .touchUpInside) { sender in
            print("not so important")
            print("something to debug")
            print("a nice information")
            print("oh no, that won’t be good")
            print("ouch, an error did occur!")
            print("\n\n")
            
            print(123)
            print(-123.45678)
            print(Date())
            print(["I", "like", "logs!"])
            print(["name": "Mr Beaver", "address": "7 Beaver Lodge"])
            print("\n\n")
        }
    }
    
    func test_debugPrint() {
        stackView.addArrangedSeparator(withTitle: "debugPrint", color: view.tintColor, size: 13)
        stackView.addArrangedButton("log", controlEvents: .touchUpInside) { sender in
            debugPrint("not so important")
            debugPrint("something to debug")
            debugPrint("a nice information")
            debugPrint("oh no, that won’t be good")
            debugPrint("ouch, an error did occur!")
            debugPrint("\n\n")
            
            debugPrint(123)
            debugPrint(-123.45678)
            debugPrint(Date())
            debugPrint(["I", "like", "logs!"])
            debugPrint(["name": "Mr Beaver", "address": "7 Beaver Lodge"])
            print("\n\n")
        }
    }
    
    
    
    func test_SwiftyBeaver() {
        let log = SwiftyBeaver.self

        // 配置 - 输出到控制台，详见：https://docs.swiftybeaver.com/article/9-log-to-xcode-console
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss.SSS$d $C$L$c$N.$F Line $l: $M" // 详见：https://docs.swiftybeaver.com/article/20-custom-format
        console.levelString.verbose = ""
        console.levelString.debug = ""
        console.levelString.info = ""
        console.levelString.warning = ""
        console.levelString.error = ""
        console.levelColor.verbose = ""
        console.levelColor.debug = "👨🏻‍💻 "
        console.levelColor.info = "ℹ️ "
        console.levelColor.warning = "⚠️ "
        console.levelColor.error = "❌ "
        log.addDestination(console)
        
        // 配置 - 输出到 MacApp，详见：https://docs.swiftybeaver.com/article/11-log-to-swiftybeaver-platform
        //let platform = SBPlatformDestination(appID: "dGPwkz", appSecret: "xg2o7W9dRqancFt5hbgZ9eruiyvvynce", encryptionKey: "ke26cokfxzd2Wmp79jjytxgeDPw2dojJ")
        //log.addDestination(platform)
        
        // 示例
        stackView.addArrangedSeparator(withTitle: "SwiftyBeaver", color: view.tintColor, size: 13)
        stackView.addArrangedButton("log", controlEvents: .touchUpInside) { sender in
            log.verbose("not so important")
            log.debug("something to debug")
            log.info("a nice information")
            log.warning("oh no, that won’t be good")
            log.error("ouch, an error did occur!")
            print("\n\n")
            
            // log anything!
            log.verbose(123)
            log.info(-123.45678)
            log.warning(Date())
            log.error(["I", "like", "logs!"])
            log.error(["name": "Mr Beaver", "address": "7 Beaver Lodge"])
            print("\n\n")
        }
    }
    
    func test_TinyConsole() {
        // 详见：https://github.com/Cosmo/TinyConsole/tree/1.3.2
        // let window = UIApplication.shared.delegate!.window!!
        // let rootViewController = window.rootViewController!
        //
        // stackView.addArrangedSeparator(withTitle: "TinyConsole", color: view.tintColor, size: 13)
        // stackView.addArrangedButton("启用", controlEvents: .touchUpInside) { sender in
        //     window.rootViewController = TinyConsoleController(rootViewController: rootViewController)
        // }
        // stackView.addArrangedButton("恢复", controlEvents: .touchUpInside) { sender in
        //     window.rootViewController = rootViewController
        // }
        // stackView.addArrangedButton("log", controlEvents: .touchUpInside) { sender in
        //     // Print message
        //     TinyConsole.print("not so important")
        //
        //     // Print messages any color you want
        //     TinyConsole.print("something to debug", color: UIColor.green)
        //
        //     // Print a red error message
        //     TinyConsole.error("ouch, an error did occur!")
        //
        //     // Print a marker for orientation
        //     TinyConsole.addMarker()
        //
        //     // Clear console
        //     //TinyConsole.clear()
        // }
    }
    
}
