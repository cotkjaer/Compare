//
//  Compare.swift
//  Compare
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

// MARK: Comparing

public enum ComparisonResult : Int
{
    case Same = 0
    case Ascending = -1
    case Descending = 1
}

public extension Comparable
{
    func compare(rhs: Self) -> ComparisonResult
    {
        if self < rhs { return .Ascending }
        if self > rhs { return .Descending }
        
        return .Same
    }
}

public func compare<T: Comparable>(lhs: T, rhs: T) -> Int
{
    return lhs.compare(rhs).rawValue
}
