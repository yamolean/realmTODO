//
//  ViewController.swift
//  realmPractice
//
//  Created by 矢守叡 on 2020/02/29.
//  Copyright © 2020 yamolean. All rights reserved.
//

import UIKit
import RealmSwift

//output,buttonでrealmDBに値を送る作業
//input,realmからcellに値を渡す作業

final class ViewController: UIViewController {
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    
    //input
    private var itemList: Results<ToDoEntity>!
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(ToDoCell.self, forCellReuseIdentifier:  "cellID")
//        
        //input,Realmデータベースに登録されているデータを全て取得
        itemList = realm.objects(ToDoEntity.self)
    }
    
    //output
    @IBAction private func buttonTapped(_ sender: UIButton) {
        let todo = ToDoEntity()
        todo.Text = textField.text
        
        try! realm.write {
            realm.add(todo)
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! ToDoCell
//        let cellItem = itemList[indexPath.row]
//        cell.Label.text = cellItem.Text
//        return cell
    }
    
    
}
