//
//  Expense.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import Foundation

struct Expense: Codable {
    var title: String
    var category: String
    var amount: Double
    
    static func calculateTotalSpent(expenses: [Expense]) -> Double {
        var totalAmount = 0.0
        expenses.forEach { expense in
            totalAmount += expense.amount
        }
        
        return totalAmount
    }
    
    static func getExpensesByCategory(expenses: [Expense]) -> [String: [Expense]] {
        var dict: [String: [Expense]] = [:]
        dict = Dictionary(grouping: expenses, by: { $0.category })
        return dict
    }
}
