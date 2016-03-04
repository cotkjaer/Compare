//
//  CompareTests.swift
//  CompareTests
//
//  Created by Christian Otkjær on 04/03/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import Compare

class CompareTests: XCTestCase
{
    func test_OptionalEquals()
    {
        let one : Int? = 1
        let none : Int? = nil
        
        XCTAssert(none =?= none)
        XCTAssert(none =?= one)
        XCTAssert(one =?= none)
        XCTAssert(one =?= one)
        
        XCTAssert(none == none)
        XCTAssertFalse(none == one)
        XCTAssertFalse(one == none)
        XCTAssert(one == one)
    }
    
    func test_assign_if_less_than()
    {
        var variable = 2
        
        variable <?= 1
        
        XCTAssertEqual(variable , 2)
        
        variable <?= 3
        
        XCTAssertEqual(variable , 3)
    }
    
    func test_assign_if_greater_than()
    {
        var variable = 2
        
        variable >?= 1
        
        XCTAssertEqual(variable , 1)
        
        variable >?= 3
        
        XCTAssertEqual(variable , 1)
    }
    
    func test_assign_if_not_equal()
    {
        var variable : Int? = 2
        
        let greater : Int? = 3
        
        let less : Int? = 1
        
        let none : Int? = nil
        
        variable !?= variable
        
        XCTAssertEqual(variable , 2)
        
        variable !?= greater
        
        XCTAssertEqual(variable , 3)
        
        variable !?= less
        
        XCTAssertEqual(variable , 1)
        
        variable !?= none
        
        XCTAssertNil(variable)
        
        variable !?= less
        
        XCTAssertEqual(variable , 1)
    }
}
