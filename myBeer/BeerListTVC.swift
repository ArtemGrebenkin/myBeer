//
//  BeerListTVC.swift
//  myBeer
//
//  Created by Artem Grebenkin on 10/20/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit
import Alamofire


class BeerListTVC: UITableViewController {

    private var beers = [Beer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.fetchData() { (array) in
            DispatchQueue.main.async {
                self.beers = array
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = beers[indexPath.row].name
        cell.imageView?.image = UIImage(named: "noBeerIcon") //если нет иконки то покажем пустышку
        let iconImageStrUrl = beers[indexPath.row].labels?.icon
        ImageManager.shared.getImageFrom(stringURL: iconImageStrUrl) { (image) in
            DispatchQueue.main.async {
                cell.imageView?.image = image
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! ViewController
                detailVC.myBeer = beers[indexPath.row]
            }
        }
    }
}

