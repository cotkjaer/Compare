//
//  ConditionalAssign.swift
//  Compare
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

/// Assign rhs to lhs only if check(lhs,rhs) is true
public func conditionalAssign<T>(inout lhs: T, rhs: T?, @noescape check: ((T,T) -> Bool)) { if let rhs = rhs { if check(lhs,rhs) { lhs = rhs } } }

/// Assign rhs to lhs only if check(lhs,rhs) is true
public func conditionalAssign<T>(inout lhs: T?, rhs: T?, @noescape check: ((T?,T?) -> Bool)) { if check(lhs,rhs) { lhs = rhs } }

/// Assign rhs to lhs only if lhs > rhs
infix operator >?= { associativity right precedence 90 }

/// Assign rhs to lhs only if lhs > rhs
public func >?= <T:Comparable>(inout lhs: T, rhs: T?)
{
    conditionalAssign(&lhs, rhs: rhs, check: >)
}

/// Assign rhs to lhs only if lhs < rhs
infix operator <?= { associativity right precedence 90 }

/// Assign rhs to lhs only if lhs < rhs
public func <?= <T:Comparable>(inout lhs: T, rhs: T?)
{
    conditionalAssign(&lhs, rhs: rhs, check: <)
}

infix operator !?= { associativity right precedence 90 }

/// Assign `rhs` to `lhs` only if `lhs` is not already equal to `rhs`
public func !?= <T:Equatable>(inout lhs: T, rhs: T?)
{
    conditionalAssign(&lhs, rhs: rhs, check: !=)
//    if lhs != rhs { lhs = rhs }
}

/// Assign `rhs` to `lhs` only if `lhs` is not already equal to `rhs`
public func !?= <T:Equatable>(inout lhs: T?, rhs: T?)
{
    if lhs != rhs { lhs = rhs }
}

