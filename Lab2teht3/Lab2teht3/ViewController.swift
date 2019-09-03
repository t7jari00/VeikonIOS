//
//  ViewController.swift
//  Lab2teht3
//
//  Created by Risto Jääskelä on 03/09/2019.
//  Copyright © 2019 Risto Jääskelä. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func greetEnglish(_ sender: UIButton) {
        greetLabel.text = "Hello " + nameText.text!
    }
    
    @IBAction func greetSverige(_ sender: UIButton) {
        greetLabel.text = "Hej " + nameText.text!
    }
    @IBAction func greetSuomi(_ sender: UIButton) {
        greetLabel.text = "MOROOO " + nameText.text!
    }
    @IBAction func greetSurprise(_ sender: UIButton) {
        greetLabel.text = "Hola " + nameText.text!
    }
}

