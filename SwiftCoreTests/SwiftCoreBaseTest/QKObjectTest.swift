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
    
    let nested: [String: Any] = [
        "name" : "Quanky"
    ]
    
    let firstMedal :[String: Any] = [
        "type" : "Gold",
        "created" : "16-01-2007"
    ]
    let secondMedal :[String: Any] = [
        "type" : "Silver",
        "created" : "16-01-2007"
    ]
    
    
    var sample: [String: Any] = [
        "name" : "Quang",
        "nickname" : "Quang Pham",
        "token" : "$2y$10$JebsikhcX8j6wwX3agk12O1usfz6y7avRnwZ9qF31vLoN1Ob6HCcK",
        "age" : 5,
        "isVip" : true,
        "height" : 1.68,
        "homepage": "www.google.com",
    ]
    
    let scores = [1.5,2.7,3.9]
    let indices = [1,2,3,4]
    let friends = ["Paul", "Daniel"]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sample["coach"] = nested
        sample["medals"] = [firstMedal, secondMedal]
        sample["scores"] = scores
        sample["indices"] = indices
        sample["friends"] = friends
        myObject = MyObject(jsonObject: sample)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParsingJSONObject() {
        XCTAssert(myObject.name == sample["name"] as? String, "String parsing fails")
        
        XCTAssert(myObject.nickname == sample["nickname"] as? NSString, "String parsing fails")
        
        XCTAssert(myObject.age == sample["age"] as! Int, "Ing parsing fails")
        
        XCTAssert(myObject.isVip == sample["isVip"] as! Bool, "Bool parsing fails")
        
        XCTAssert(myObject.height == sample["height"] as? Double, "Decimal number parsing fails")
        
        XCTAssert(myObject.coach?.name == nested["name"] as? String, "Custom object parsing fails")
        
        XCTAssert(myObject.scores?.count == scores.count, "Array of decimal numbers parsing fails count")
        
        XCTAssert(myObject.scores?.first == scores.first, "Array of decimal numbers parsing fails value")
        
        XCTAssert(myObject.indices?.count == indices.count, "Array of integer numbers parsing fails count")
        
        XCTAssert(myObject.indices?.first == indices.first, "Array of integer numbers parsing fails value")
        
        XCTAssert(myObject.friends?.count == friends.count, "Array of String parsing fails count")
        
        XCTAssert(myObject.friends?.first == friends.first, "Array of String parsing fails value")
        
        XCTAssert(myObject.medals?.count == (sample["medals"] as! NSArray).count, "Array of objects parsing fails count")
        XCTAssert(myObject.medals?.first?.type == firstMedal["type"] as? String, "Array of objects parsing fails value")
    }
    
}

class MyObject: QKObject {
    var name: String?
    var nickname: NSString?
    var age: Int = 0
    var token: String?
    var isVip: Bool = false
    var height = 0.0
    var friend: MyNestedObject?
    var medals: [MyMedalObject]?
    var homepage: URL?
    var coach: MyNestedObject?
    var scores: [Double]?
    var indices: [Int]?
    var friends: [String]?
    
    
    func medalsClass() -> AnyClass {
        return MyMedalObject.self
    }
}

class MyNestedObject: QKObject {
    var name: String?
}

class MyMedalObject: QKObject {
    var type: String?
    var created: String?
}
