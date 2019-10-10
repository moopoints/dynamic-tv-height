//
//  ViewController.swift
//  dynamic-tv-height
//
//  Created by Jan Senderek on 10/9/19.
//  Copyright © 2019 Jan Senderek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var data = [MyData]()
    let data0 = MyData(title: "Cell 0", tokenStrings: ["lorem", "ipsum", "is", "simply dummy", "text", "of", "the", "printing"])
    let data1 = MyData(title: "Cell 1", tokenStrings: ["it", "is", "a", "long", "established fact", "that", "a", "reader", "will", "be distracted"])
    let data2 = MyData(title: "Cell 2", tokenStrings: ["it", "is", "a", "long"])

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dynamic Cells"
        data = [data0, data1, data2]
        setupTableView()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.backgroundColor = .yellow

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
    }
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.configure(with: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return data[indexPath.row].returnHeight()
    }
}


struct MyData {
    var title = String()
    var tokenStrings = [String]()
    
    func returnHeight() -> CGFloat {
        var height = CGFloat()
        let topBottomMargin: CGFloat = 24
        let titleHeight: CGFloat = 18
        let tagsMargin: CGFloat = 12
        height += topBottomMargin
        height += titleHeight
        height += tagsMargin
        height += 64
        return height
    }
}
