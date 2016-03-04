//
//  OptionalEquatable.swift
//  Compare
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

///Protocol to describe dynamic equatable properties
public protocol OptionalEquatable
{
    func equals(thing: Any?) -> Bool
}

/// compares two optional Equatables and returns true if they are equal or one or both are nil
infix operator =?= { precedence 130 }

/// compares two optional Equatables and returns true if they are equal or one or both are nil
public func =?= <T:Equatable> (lhs: T?, rhs: T?) -> Bool
{
    if lhs == nil { return true }
    if rhs == nil { return true }
    return lhs == rhs
}

///// compares two optional Equatables and returns true if they are equal or both are nil
//infix operator =!= { precedence 130 }
//
///// compares two optional Equatables and returns true if they are equal or both are nil
//public func =!= <T:Equatable> (lhs: T?, rhs: T?) -> Bool
//{
//    if lhs == nil && rhs == nil { return true }
//    if lhs == nil { return false }
//    if rhs == nil { return false }
//    return lhs! == rhs!
//}
