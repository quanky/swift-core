//
//  QKObjectTest.swift
//  SwiftCore
//
//  Created by Quang Co on 3/15/17.
//  Copyright © 2017 quanky. All rights reserved.
//

import XCTest
import SwiftCore

class QKObjectTest: XCTestCase {
    
    var myObject: MyObject!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitWithObjectWithStringProperty() {
        let sample: [String: Any] = [
            "name" : "Quang"
        ]
        
        myObject = MyObject(jsonObject: sample)
        
        XCTAssertNotNil(myObject, "Object should not be nil after init with json object")
        
        XCTAssertNotNil(myObject.name, "Name property should not be nil")
        
        XCTAssert(myObject.name == "Quang", "Name property should have value of Quang")
    }
    
    func testInitWithObjectWithOptinalStringProperty() {
        let sample: [String: Any] = [
            "nameOptional" : "Quang"
        ]
        
        myObject = MyObject(jsonObject: sample)
        
        XCTAssertNotNil(myObject, "Object should not be nil after init with json object")
        
        XCTAssertNotNil(myObject.nameOptional, "Optinal Name property should not be nil")
        
        XCTAssert(myObject.nameOptional == "Quang", "Optinal Name property should have value of Quang")
    }
    
    func testInitWithObjectWithIntProperty() {
        let sample: [String: Any] = [
            "age" : 5
        ]
        
        myObject = MyObject(jsonObject: sample)
        
        XCTAssertNotNil(myObject, "Object should not be nil after init with json object")
        
        XCTAssertNotNil(myObject.age, "Age property should not be nil")

        XCTAssert(myObject.age == 5, "Age property should have value of 5")
    }

    func testInitWithObjectWithBoolProperty() {
        let sample: [String: Any] = [
            "isVip" : true
        ]
        
        myObject = MyObject(jsonObject: sample)
        
        XCTAssertNotNil(myObject, "Object should not be nil after init with json object")
        
        XCTAssertNotNil(myObject.isVip, "isVip property should not be nil")
        
        XCTAssert(myObject.isVip, "isVip property should have value of true")
    }
    
    func testInitWithObjectWithFloatProperty() {
        let sample: [String: Any] = [
            "height" : 1.68
        ]
        
        myObject = MyObject(jsonObject: sample)
        
        XCTAssertNotNil(myObject, "Object should not be nil after init with json object")
        
        XCTAssertNotNil(myObject.height, "height property should not be nil")
        
        XCTAssert(myObject.height == 1.68, "height property should have value of true")
    }
    
}

class MyObject: QKObject {
    var name: String!
    var nameOptional: String?
    var age: Int = 0
    var isVip: Bool = false
    var height: Float = 0
}
