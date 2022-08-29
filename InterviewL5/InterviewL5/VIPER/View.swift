//
//  View.swift
//  InterviewL5
//
//  Created by emil kurbanov on 29.08.2022.
//

import Foundation
import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    func upLoad(with users: [User])
    func upLoad(with error: String)
}

class UserViewController: UIViewController,AnyView, UITableViewDataSource, UITableViewDelegate {
    var presenter: AnyPresenter?
    var user: [User] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        return tableView
    }()
    let errorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(errorLabel)
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.frame = view.bounds
        errorLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        errorLabel.center = view.center
    }
    
    func upLoad(with users: [User]) {
        DispatchQueue.main.async {
            self.user = users
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func upLoad(with error: String) {
        DispatchQueue.main.async {
            self.user = []
            self.errorLabel.text = error
            self.tableView.isHidden = true
            self.errorLabel.isHidden = false
        }
    }
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = user[indexPath.row].description
        return cell
    }
    
}
