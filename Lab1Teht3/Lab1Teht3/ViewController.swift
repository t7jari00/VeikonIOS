//
//  ViewController.swift
//  Lab1Teht3
//
//  Created by Risto Jääskelä on 28/08/2019.
//  Copyright © 2019 Risto Jääskelä. All rights reserved.
//

import UIKit

//class and its inheritance
class ViewController: UIViewController {

    //objects and theis various visibilities
    public var strinki: String = "tekst"
    private var privaattiStrinki: String = "tekst moor"
    internal var proctektiStrinki: String = "eeven moor tekst"
    @IBOutlet weak var laabeli: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coolFunction()
    }
    
    //method
    func coolFunction(){
        
        //interface example
        laabeli.text = "Cool"
    }


}

