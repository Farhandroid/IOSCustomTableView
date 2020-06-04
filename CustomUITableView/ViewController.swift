//
//  ViewController.swift
//  CustomUITableView
//
//  Created by user on 6/4/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var messages : [Message] = [
        Message(sender: "Sender 1", body: "Body 1"),
        Message(sender: "Sender 2", body: "Body 2"),
        Message(sender: "Sender 3", body: "Body 3"),
        Message(sender: "Sender 4", body: "Body 4"),
        Message(sender: "Sender 5", body: "Body 5")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: K.messageTableViewCell, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        // Do any additional setup after loading the view.
    }
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageTableViewCell
        cell.messageLabel.text = self.messages[indexPath.row].body
        //cell.textLabel?.text = self.messages[indexPath.row].body
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(messages[indexPath.row].body)
    }
}

