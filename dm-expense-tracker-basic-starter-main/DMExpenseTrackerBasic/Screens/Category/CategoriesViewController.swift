//
//  CategoriesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    func initializeExpenseData() {
        expenses = DataController.getExpenses()
        expensesByCategory = Expense.getExpensesByCategory(expenses: expenses)
        expensesByCategory.keys.forEach { key in
            categories.append(key)
        }
    }
    
    func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.categoryReuseID)
        self.tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    private var expenses: [Expense] = []
    private var expensesByCategory: [String: [Expense]] = [:]
    private var categories: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeExpenseData()
        self.configureTableView()
        self.title = "Categories"
    }
}

extension CategoriesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.categoryReuseID, for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = categories[indexPath.row]
        
        return cell
    }
}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        let resultOfExpenses = expenses.filter ({ expense in expense.category == category})
        guard let expenseVC = self.storyboard?.instantiateViewController(identifier: "ExpensesViewController", creator: { coder in
            return ExpensesViewController(coder: coder, category: category, expenses: resultOfExpenses)
        }) else {
            fatalError("Could not find ExpensesViewController!")
        }
        self.navigationController?.pushViewController(expenseVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
