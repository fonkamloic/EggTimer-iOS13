//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
        
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var temp = 0
    var secondsRemaining = 60
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        titleLabel.text = hardness
        timer.invalidate()
        progressView.progress = 0.0
        temp = 0
        secondsRemaining = eggTimes[hardness]!
        
     timer =   Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer),userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if temp < secondsRemaining
        {
            print("\(temp) seconds.")
            temp += 1
            let prog =  Float(temp)  / Float(secondsRemaining )
            print(prog)
            progressView.progress = prog
        }
        else {
            AudioServicesPlaySystemSound(1007)
            timer.invalidate()
            print("Done.")
            titleLabel.text = "DONE."
        }
    }
}
