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
    private var selectedCategory = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeExpenseData()
        self.configureTableView()
        self.title = "Categories"
    }
    
    @IBSegueAction
    private func showPerson(coder: NSCoder, sender: Any?, segueIdentifier: String?)
        -> ExpensesViewController? {
            var resultOfExpenses: [Expense] = []
            expensesByCategory.filter({expense in expense.key == categories[selectedCategory]}).values.forEach { expenses in
                resultOfExpenses = expenses
            }
        return ExpensesViewController(coder: coder, category: categories[selectedCategory], expenses: resultOfExpenses)
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
        selectedCategory = indexPath.row
//        let resultOfExpenses = expenses.filter({ expense in expense.category == category})
        performSegue(withIdentifier: "segueExpense", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
