//
//  ViewController.swift
//  Lab3teht2
//
//  Created by Risto Jääskelä on 17/09/2019.
//  Copyright © 2019 Risto Jääskelä. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var browserText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var callText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func browserButton(_ sender: Any) {
        let url: String = browserText.text!
        UIApplication.shared.open(NSURL(string:url)! as URL)
    }
    @IBAction func emailButton(_ sender: Any) {
        var email: String = "mailto:"
        email.append(emailText.text!)
        UIApplication.shared.open(NSURL(string:email)! as URL)
    }
    @IBAction func callButton(_ sender: Any) {
        var number: String = "tel://"
        number.append(callText.text!)
        UIApplication.shared.open(NSURL(string:number)! as URL)
    }
    @IBAction func cameraButton(_ sender: Any) {
        let cameraVc = UIImagePickerController()
        cameraVc.delegate = self
        cameraVc.sourceType = .camera
        cameraVc.allowsEditing = false
        cameraVc.showsCameraControls = true
        self.present(cameraVc, animated: true, completion: nil)
    }
    
}

