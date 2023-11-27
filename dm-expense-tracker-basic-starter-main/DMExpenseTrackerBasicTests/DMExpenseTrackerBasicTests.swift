//
//  DMExpenseTrackerBasicTests.swift
//  DMExpenseTrackerBasicTests
//
//  Created by David Ruvinskiy on 3/28/23.
//

import XCTest
@testable import DMExpenseTrackerBasic

final class DMExpenseTrackerBasicTests: XCTestCase {
    func testCalculateTotalSpent() throws {
        for _ in 1...100 {
            let expenses = (1...100).map { _ in
                Expense(title: "", category: "", amount: Double.random(in: 1...1000))
            }
            
            XCTAssertEqual(Expense.calculateTotalSpent(expenses: expenses), expenses.reduce(0) { $0 + $1.amount })
        }
    }
    
    func testGetExpensesByCategory() throws {
        let categories = (1...100).map { _ in
            let length = Int.random(in: 1...5)
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
            let randomString = String((0..<length).map { _ in letters.randomElement()! })
            return randomString
        }
        
        for _ in 1...100 {
            let expenses = (1...100).map { _ in
                Expense(title: "", category: categories.randomElement()!, amount: Double.random(in: 1...1000))
            }
            
            let correctExpensesByCategory = Dictionary(grouping: expenses, by: { $0.category })
            let expensesByCategory = Expense.getExpensesByCategory(expenses: expenses)
            
            XCTAssertEqual(expensesByCategory, correctExpensesByCategory)
        }
    }
}
