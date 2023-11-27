//
//  DataController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 9/2/23.
//

import Foundation

enum DataController {
    static func getExpenses() -> [Expense] {
        return [
            Expense(title: "Amazon", category: "Shopping", amount: 59.99),
            Expense(title: "Apple Music", category: "Entertainment", amount: 9.99),
            Expense(title: "Movie", category: "Entertainment", amount: 37.98),
            Expense(title: "Amazon", category: "Shopping", amount: 45.99),
            Expense(title: "Nike Shoes", category: "Shoes", amount: 120.67),
            Expense(title: "Home Depot", category: "Home", amount: 75.1),
            Expense(title: "Monthly Rent", category: "Housing", amount: 1000.0),
            Expense(title: "Cab Ride", category: "Transportation", amount: 20.0),
            Expense(title: "Coffee Shop", category: "Food", amount: 4.5),
            Expense(title: "Uber Ride", category: "Transportation", amount: 20.76),
            Expense(title: "Gas Fill Up", category: "Transportation", amount: 37.52),
            Expense(title: "Supermarket", category: "Food", amount: 70.0),
            Expense(title: "Uber", category: "Transportation", amount: 19.35),
            Expense(title: "Amazon", category: "Shopping", amount: 49.99),
            Expense(title: "Gas", category: "Transportation", amount: 80.11),
            Expense(title: "Rent", category: "Housing", amount: 1500.0),
            Expense(title: "Amazon", category: "Shopping", amount: 50.0),
            Expense(title: "Netflix", category: "Entertainment", amount: 14.99),
            Expense(title: "Amazon", category: "Shopping", amount: 75.0),
            Expense(title: "Haircut", category: "Personal Care", amount: 30.0),
            Expense(title: "Grocery Store", category: "Food", amount: 150.0),
            Expense(title: "Gym", category: "Health", amount: 40.0),
            Expense(title: "Starbucks", category: "Food", amount: 5.4),
            Expense(title: "Pharmacy", category: "Health", amount: 43.0),
            Expense(title: "Uber", category: "Transportation", amount: 45.0),
            Expense(title: "Snowboarding Lessons", category: "Entertainment", amount: 75.0),
            Expense(title: "Ski Trip", category: "Travel", amount: 102.52)
        ]
    }
}
