//
//  ViewController.swift
//  CMoney_01_CreditCard
//
//  Created by 張彩虹 on 2020/8/6.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import UIKit

private let tableviewReuseIdentifier = "TableViewCell"

class ViewController: UIViewController {
    
    var tableview: UITableView?
    
    let viewModel = ViewControllerViewModel()
    
    //MARK: - Operation
    func bindViewModel() {
        viewModel.onRequestEnd = {[weak self] cards in
            
        }
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableview = UITableView(frame: self.view.bounds, style: .plain)
        tableview?.register(UITableViewCell.self, forCellReuseIdentifier: tableviewReuseIdentifier)
        
        self.tableview?.delegate = self
        self.tableview?.dataSource = self
        
        self.view.addSubview(tableview!)
        
        self.bindViewModel()
        viewModel.getCreditCardData()
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: didSelected
        tableView.deselectRow(at: indexPath, animated: true)
        print("did selected: \(indexPath.row)")
        
        let photosViewController = PhotosViewController()
        photosViewController.title = viewModel.cards.discounts[indexPath.row].title
        photosViewController.viewModel.cards = viewModel.cards.discounts[indexPath.row].creditcards
        self.navigationController?.pushViewController(photosViewController, animated: true)
    }
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cards.discounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tableviewReuseIdentifier, for: indexPath)
        cell.textLabel?.text = viewModel.cards.discounts[indexPath.row].title
        return cell
    }
    
    
}
