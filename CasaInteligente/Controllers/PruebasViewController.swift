//
//  PruebasViewController.swift
//  CasaInteligente
//
//  Created by Brayan Romero on 4/27/21.
//  Copyright © 2021 Brayan Romero. All rights reserved.
//

import UIKit

class PruebasViewController: UIViewController {
let perros=[
    "chihuahua",
    "french",
    "dalmata"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource=self
        tableView.delegate=self
        view.addSubview(tableView)
          
    }

    
}
extension PruebasViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        return perros.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Call" )
        cell.textLabel?.text = perros[indexPath.row]
        return cell
    }

}
extension PruebasViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(perros[indexPath.row])

    }
}
