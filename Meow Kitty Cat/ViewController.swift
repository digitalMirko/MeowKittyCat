//
//  ViewController.swift
//  Meow Kitty Cat
//
//  Created by Mirko Cukich on 10/28/18.
//  Copyright © 2018 Digital Mirko. All rights reserved.
//

import UIKit
import AVFoundation  // used to play sounds

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    // linked to sound effect object
    var catSound: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // scales button graphic in proportion
        button.imageView?.contentMode = .scaleAspectFit
        
        // label is initially hidden
        label.isHidden = true
        
        // links to sound file
        let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        
        do {
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        }
        // prints error in debug area if it happens
        catch {
            print(error)
        }
        
    }
    // When button is clicked label appears, cat sound effect is made
    // then the label disappears until the button is clicked again
    @IBAction func meow(_ sender: Any) {
        // label is displayed to user
        label.isHidden = false
        
        // plays cat meow sound
        catSound.play()
        
        // delayed action to hide label in 1.5 seconds
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
        
        
        
    }
    // hides label
    @objc func hideLabel(){
        label.isHidden = true
    }
    
}

