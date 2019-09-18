//
//  ViewController.swift
//  Lab4Teht2
//
//  Created by Risto Jääskelä on 18/09/2019.
//  Copyright © 2019 Risto Jääskelä. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func greet(_ sender: Any) {
        performSegue(withIdentifier: "goGreet", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! SecondViewController
        controller.name = nameField.text!
    }
    
}
