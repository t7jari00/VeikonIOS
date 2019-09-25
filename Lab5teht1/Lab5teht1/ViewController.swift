//
//  ViewController.swift
//  Lab5teht1
//
//  Created by Janne Tyni on 25/09/2019.
//  Copyright © 2019 Janne Tyni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerData: [String] = [String]()
    var pickerDataSeconds: [String] = [String]()
    var timeString:String = "0:0"
    var newMinutes:Int = 0
    var newSeconds:Int = 0
    
    @IBOutlet weak var picker: UIPickerView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return pickerData[row] }
        return pickerDataSeconds[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
        for n in 0...59 {
            let nstr = String(n)
            pickerData.append(nstr + " minutes")
            pickerDataSeconds.append(nstr + " seconds")
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if( component == 0){
            newMinutes = row
        }
        newSeconds = row
        
    }
    
    
    @IBAction func starttimer(_ sender: Any) {
        performSegue(withIdentifier: "startTheTimer", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! FirstViewController
        timeString = String(newMinutes) + ":" + String(newSeconds)
        controller.time = timeString
    }
}

