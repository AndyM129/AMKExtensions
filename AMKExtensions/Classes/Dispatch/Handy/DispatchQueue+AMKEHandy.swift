//
//  DispatchQueue+AMKEHandy.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/8.
//

import Dispatch

public extension DispatchQueue {
    
    private static var _amke_onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    static func amke_once(token: String, block:()->Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        
        if _amke_onceTracker.contains(token) {
            return
        }
        
        _amke_onceTracker.append(token)
        block()
    }
    
}
