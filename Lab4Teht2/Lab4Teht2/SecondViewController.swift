//
//  SecondViewController.swift
//  Lab4Teht2
//
//  Created by Risto Jääskelä on 18/09/2019.
//  Copyright © 2019 Risto Jääskelä. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var name:String = "No name"
    var veikko:String = "veikko"
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = name
        if(veikko.caseInsensitiveCompare(name) == ComparisonResult.orderedSame){
            image.image = UIImage(named: "lady-smiling-in-the-sun.jpg")!
        }
    }
    
}
