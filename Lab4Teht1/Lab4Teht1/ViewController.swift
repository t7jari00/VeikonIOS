//
//  ViewController.swift
//  Lab4Teht1
//
//  Created by Risto Jääskelä on 17/09/2019.
//  Copyright © 2019 Risto Jääskelä. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var pic1: UIImageView!
    @IBOutlet weak var pic2: UIImageView!
    @IBOutlet weak var pic3: UIImageView!
    @IBOutlet weak var pic4: UIImageView!
    @IBOutlet weak var pickerActually: UISegmentedControl!
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pic1.isUserInteractionEnabled = true
        pic2.isUserInteractionEnabled = true
        pic3.isUserInteractionEnabled = true
        pic4.isUserInteractionEnabled = true
        
        let tapRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        pic1.addGestureRecognizer(tapRecognizer1)
        
        let tapRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        pic2.addGestureRecognizer(tapRecognizer2)
        
        let tapRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        pic3.addGestureRecognizer(tapRecognizer3)
        
        let tapRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        pic4.addGestureRecognizer(tapRecognizer4)
    }
    
    @IBAction func picker(_ sender: Any) {
        if pickerActually.selectedSegmentIndex == 1{
            var image: UIImage = UIImage(named: "huuhkaja.jpg")!
            pic1.image = image
            image = UIImage(named: "peippo.jpg")!
            pic2.image = image
            image = UIImage(named: "punatulkku.jpg")!
            pic3.image = image
            image = UIImage(named: "peukaloinen.jpg")!
            pic4.image = image
        }
        else if pickerActually.selectedSegmentIndex == 0{
            var image: UIImage = UIImage(named: "bear.jpg")!
            pic1.image = image
            image = UIImage(named: "elephant.jpg")!
            pic2.image = image
            image = UIImage(named: "wolf.jpg")!
            pic3.image = image
            image = UIImage(named: "lamb.jpg")!
            pic4.image = image
        }
    }
    
    @objc func imageTapped(recognizer: UITapGestureRecognizer) {
        print("Image was tapped")
        let p = recognizer.location(in: view)
        //var fileURL: String?
        if pic1.layer.hitTest(p) != nil {
            
            if pickerActually.selectedSegmentIndex == 0{
                play(name:"bear", format:"wav")
            }else{
                play(name:"huuhkaja_norther_eagle_owl", format:"mp3")
            }
        }
        
        else if pic2.layer.hitTest(p) != nil {
            if pickerActually.selectedSegmentIndex == 0{
                play(name:"elephant", format:"wav")
            }else{
                play(name:"peippo_chaffinch", format:"mp3")
            }
        }
        
        else if pic3.layer.hitTest(p) != nil {
            if pickerActually.selectedSegmentIndex == 0{
                play(name:"wolf", format:"wav")
            }else{
                play(name:"punatulkku_northern_bullfinch", format:"mp3")
            }
        }
        
        else if pic4.layer.hitTest(p) != nil {
            if pickerActually.selectedSegmentIndex == 0{
                play(name:"lamb", format:"wav")
            }else{
                play(name:"peukaloinen_wren", format:"mp3")
            }
        }
    }
    
    func play(name:String, format:String){
        let sound = Bundle.main.url(forResource: name, withExtension: format)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound!)
            guard let player = audioPlayer else { return }
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

