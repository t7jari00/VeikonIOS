//
//  ViewController.swift
//  Lab5Teht2
//
//  Created by Janne Tyni on 01/10/2019.
//  Copyright © 2019 Janne Tyni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var things: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.addTarget(self, action: #selector(self.textFieldChanged), for: .editingChanged)
        let stuff = UserDefaults.standard.string(forKey: "key")
        textField.text = stuff
    }
    
    @objc func textFieldChanged(textField: UITextField){
        things = textField.text!
        UserDefaults.standard.set(things, forKey: "key")
    }

}

