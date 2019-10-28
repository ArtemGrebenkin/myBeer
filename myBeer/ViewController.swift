//
//  ViewController.swift
//  myBeer
//
//  Created by Artem Grebenkin on 10/19/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerDescription: UITextView!
    @IBOutlet weak var beerIconImage: UIImageView!
    
    var myBeer: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beerNameLabel.text = myBeer?.name
        beerDescription.text = myBeer?.description
        //beerIconImage.image =
    }
}

