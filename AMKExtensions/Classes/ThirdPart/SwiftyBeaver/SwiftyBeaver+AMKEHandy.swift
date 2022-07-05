//
//  SwiftyBeaver+AMKEHandy.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/5.
//

import Foundation
import SwiftyBeaver

/// SwiftyBeaver 的别名
public let AMKELog = SwiftyBeaver.amke_log()

/// 相关扩展
extension SwiftyBeaver {
    
    fileprivate class func amke_log() -> SwiftyBeaver.Type {
        amke_resetConfig()
        return SwiftyBeaver.self
    }
    
    /// 重置为定制化配置
    open class func amke_resetConfig() {
        // 清除配置
        removeAllDestinations()
        
        // 控制台输出的配置，详见：https://docs.swiftybeaver.com/article/9-log-to-xcode-console
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
        addDestination(console)
    }
    
}
