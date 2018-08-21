//
//  ViewController.swift
//  WindlessDemo
//
//  Created by Apple on 2018/8/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.rowHeight = 100
    }
    
    // MARK: - Lazy load
    private lazy var vm = WindlessViewModel()

}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if vm.isWindless {
            return 10
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WindlessTableViewCell", for: indexPath) as? WindlessTableViewCell else {
            return UITableViewCell()
        }
        cell.setupContent(model: vm)
        return cell
    }
}
