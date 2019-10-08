//
//  ViewController.swift
//  Lab6Teht1
//
//  Created by Janne Tyni on 01/10/2019.
//  Copyright © 2019 Janne Tyni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var city: String? = ""
    let manager = StuffGetter()
    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var TemperatureLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var WeatherImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        manager.completionhandler = {
            let tempString = String(self.manager.temperature)
            let descString = self.manager.description
            let image: UIImage = self.manager.image
            print(self.manager.imagedata as Any)
            self.UpdateUI(tempString:tempString,descString:descString,image:image)
        }
    }
    
    func UpdateUI(tempString:String,descString:String,image:UIImage) {
        print("got temp: " + String(self.manager.temperature))
        print("got desc: " + self.manager.description)
        print("got icon: " + self.manager.weatherIcon)
        
        DispatchQueue.main.async {
            self.TemperatureLabel.text = tempString
            self.DescriptionLabel.text = descString
            self.WeatherImage.image = image
        }
    }

    @IBAction func buttonGet(_ sender: Any) {
        let city: String = CityTextField.text!
        manager.getstuff(city: city)
    }
}

