//
//  OptionalComparable.swift
//  Compare
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

///Protocol to describe dynamically comparable entities - good for comparing objects in an inheritance-hierarchy
public protocol OptionalComparable
{
    func lessThan(thing: Any?) -> Bool
    
    func < (lhs: Self, rhs: Any?) -> Bool
}

// MARK: - Default

public func < <OC: OptionalComparable>(lhs: OC, rhs: Any?) -> Bool
{
    return lhs.lessThan(rhs)
}

public extension OptionalComparable where Self : Comparable
{
    public func lessThan(thing: Self?) -> Bool
    {
        if let other = thing { return self < other } else { return false }
    }
}

