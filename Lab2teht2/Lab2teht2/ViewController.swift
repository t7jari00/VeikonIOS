//
//  ViewController.swift
//  Lab2teht2
//
//  Created by Risto Jääskelä on 03/09/2019.
//  Copyright © 2019 Risto Jääskelä. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0;
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonpress(_ sender: UIButton) {
        counter += 1
        button.setTitle("You have pressed button " + String(counter) + " times", for: .normal)
    }

}

