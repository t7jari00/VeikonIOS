//
//  FirstViewController.swift
//  Lab5teht1
//
//  Created by Janne Tyni on 25/09/2019.
//  Copyright © 2019 Janne Tyni. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {
    var time:String = "no time"
    @IBOutlet weak var timeLabel: UILabel!
    var timer = Timer()
    var isTimerRunning = false
    var minutes:Int = 0
    var seconds:Int = 0
    var splited: [String] = []
    var speechSynthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = time
        let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: "START")
        speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 4.0
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        speechSynthesizer.speak(speechUtterance)
        splited = time.components(separatedBy: ":")
        minutes = Int(splited[0])!
        seconds = Int(splited[1])!
        runTimer()
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(FirstViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if(seconds > 0){
            seconds -= 1
        }else{
            if(minutes > 0){
                minutes -= 1
                seconds = 59
            } else {
                timer.invalidate()
                let speechUtteranceEnd: AVSpeechUtterance = AVSpeechUtterance(string: "TIME IS UP")
                speechUtteranceEnd.rate = AVSpeechUtteranceMaximumSpeechRate / 4.0
                speechUtteranceEnd.voice = AVSpeechSynthesisVoice(language: "en-US")
                speechSynthesizer.speak(speechUtteranceEnd)
                _ = navigationController?.popToRootViewController(animated: true)
                
            }
        }
        
        timeLabel.text = String(minutes) + ":" + String(seconds)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
