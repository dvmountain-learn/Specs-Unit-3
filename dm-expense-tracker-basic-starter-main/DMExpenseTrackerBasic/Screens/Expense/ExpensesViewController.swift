//
//  ExpensesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/28/23.
//

import UIKit

class ExpensesViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    func configureViewController() {
        self.displayLabel.text = displayUILabel(self.expenses)
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ExpenseCell", bundle: nil), forCellReuseIdentifier: Constants.expenseReuseID)
        self.tableView.reloadData()
    }
    
    func displayUILabel(_ expenses: [Expense]) -> String {
        return "You spent \(Expense.calculateTotalSpent(expenses: expenses).currency(for: Locale(identifier: "en-US"))) on \(category)"
    }
    
    var category: String
    var expenses: [Expense]
    
    init?(coder: NSCoder, category: String, expenses: [Expense]) {
        self.category = category
        self.expenses = expenses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViewController()
    }
}


extension ExpensesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.expenseReuseID, for: indexPath) as? ExpenseCell else { return UITableViewCell() }
        cell.set(expense: expenses[indexPath.row])
        
        return cell
    }
}
