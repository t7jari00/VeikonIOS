//
//  StuffGetter.swift
//  Lab6Teht1
//
//  Created by Janne Tyni on 01/10/2019.
//  Copyright © 2019 Janne Tyni. All rights reserved.
//

import Foundation
import UIKit

class StuffGetter {
    var completionhandler: (() -> Void)?
    var temperature = 0.0
    var weatherIcon = ""
    var description = ""
    var imagedata: Data!
    var image: UIImage!
    
    
    func getImageData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) ->()){
        print("Bruh1")
        
    }
    
    func getstuff(city: String) {
        
        struct Response: Codable { // or Decodable
            let weather: String
        }
        
        DispatchQueue.global(qos: .background).async {
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&APPID=65dbec3aae5e5bf9000c7a956c8b76f6")
            URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
                guard let data = data, error == nil else { return }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                    let main = json["main"] as! [String: Any]
                    let temp = main["temp"] as! Double
                    self.temperature = temp - 273.15
                    self.temperature = Double(round(1000*self.temperature)/1000)
                    
                    let weather = json["weather"] as! [Any]
                    let weatherdic = weather.first
                    do {
                        let jsondata = try JSONSerialization.data(withJSONObject: weatherdic!, options: .prettyPrinted)
                        let decoded = try JSONSerialization.jsonObject(with: jsondata, options: [])
                        if let dictfromJSON = decoded as? [String:Any] {
                            let weatherdesc = dictfromJSON["main"]!
                            let icon = dictfromJSON["icon"]!
                            self.description = weatherdesc as! String
                            self.weatherIcon = icon as! String
                            
                            print(self.weatherIcon)
                            let weatherPictureURL = URL(string: "https://openweathermap.org/img/w/" + self.weatherIcon + ".png")!
                            
                            if let data = try? Data(contentsOf: weatherPictureURL){
                                if let image = UIImage(data: data){
                                    DispatchQueue.global(qos: .background).sync {
                                        self.image = image
                                    }
                                }
                            }
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                } catch let error as NSError {
                    print(error)
                }
                self.completionhandler?()
            }).resume()
        }
    }
}



//let session = URLSession(configuration: .default)
//print("Bruh-1")

/*
 let downloadPicTask = session.dataTask(with: weatherPictureURL) { (data, response, error) in
 print("Bruh0")
 if let e = error {
 print("Error downloading weather picture: \(e)")
 } else {
 print("Bruh1")
 if let res = response as? HTTPURLResponse {
 print("Bruh2")
 print("Downloaded weather picture with response code \(res.statusCode)")
 if let imageData = data {
 print("Bruh3")
 self.imagedata = imageData
 print(self.imagedata as Any)
 } else {
 print("Couldn't get image: Image is nil")
 }
 } else {
 print("Couldn't get response code for some reason")
 }
 }
 }
 downloadPicTask.resume()*/
