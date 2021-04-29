//
//  PruebasViewController.swift
//  CasaInteligente
//
//  Created by Brayan Romero on 4/27/21.
//  Copyright © 2021 Brayan Romero. All rights reserved.
//

import UIKit

class PruebasViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource=self
        
        view.addSubview(tableView)
        
    }

    
}
extension PruebasViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Call" )
        cell.textLabel?.text = "KK"
        return cell
    }

}
