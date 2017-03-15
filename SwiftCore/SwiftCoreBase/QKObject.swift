//
//  QKObject.swift
//  SwiftCore
//
//  Created by Quang Co on 3/15/17.
//  Copyright © 2017 quanky. All rights reserved.
//

import UIKit

open class QKObject: NSObject, NSCoding {
    public convenience init(jsonObject: [String: Any]) {
        self.init()
        print("Start setting values for key of object \(type(of:self))")
        setValuesForKeys(jsonObject)
    }
    
    public convenience init(jsonArray: [Any]) {
        self.init()
        print("Init object with array")
    }
    
    
    open override func setValue(_ value: Any?, forKey key: String) {
        if let newValue = value {
            let newKey = transformKeyToSwift(key)
            let property = class_getProperty(type(of:self), newKey.cString(using: .utf8))
            
            if let prop = property {
                print("My property \(prop)")
            }
            
            print("Going to set value \(newValue) for key \(newKey) with property \(property)")
            super.setValue(value, forKey: key)
        }
    }
    
    
    //MARK : - Private
    private func transformKeyToSwift(_ key: String) -> String {
        return key
    }
    
    
    override public init() {
        
    }
    //MARK : - Serialization
    required public init?(coder aDecoder: NSCoder) {
        super.init()
    }
    
    public func encode(with aCoder: NSCoder) {
        
    }
}
