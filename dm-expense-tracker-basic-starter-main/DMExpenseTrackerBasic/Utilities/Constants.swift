//
//  Constants.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/29/23.
//

import Foundation

enum Constants {
    static let categoryReuseID = "CategoryCell"
    static let expenseReuseID = "ExpenseCell"
}

extension NSNumber {
    
    var currency: String {
        return self.currency(for: Locale.current)
    }
    
    func currency(for locale: Locale) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = locale.groupingSeparator != nil
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = locale
        
        return numberFormatter.string(from: self)!
    }
}

extension Double {
    
    var currency: String {
        return NSNumber(value: self).currency(for: Locale.current)
    }
    
    func currency(for locale: Locale) -> String {
        return NSNumber(value: self).currency(for: locale)
    }
}
