//
//  Expense+Ext.swift
//  DMExpenseTrackerBasicTests
//
//  Created by David Ruvinskiy on 3/28/23.
//

import Foundation
@testable import DMExpenseTrackerBasic

extension Expense: Hashable, Equatable, Comparable {
    public static func == (lhs: Expense, rhs: Expense) -> Bool {
        return lhs.title == rhs.title &&
        lhs.category == rhs.category &&
        lhs.amount == rhs.amount
    }
    
    public static func < (lhs: Expense, rhs: Expense) -> Bool {
        return lhs.amount < rhs.amount
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(category)
        hasher.combine(amount)
    }
}
