//
//  ViewController.swift
//  Lab1Teht2
//
//  Created by Risto Jääskelä on 27/08/2019.
//  Copyright © 2019 Risto Jääskelä. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("lol")
        // Do any addcdsitional setup after loading the view.
    }

    @IBAction func pressbutt(_ sender: Any) {
        let nameString = name.text!
        nameLabel.text = "Hello " + nameString + "!"
    }
    
}

