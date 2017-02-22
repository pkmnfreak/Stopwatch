//
//  ViewController.swift
//  Stopwatch
//
//  Created by Evan Chang on 2/17/17.
//  Copyright © 2017 Evan Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let stopwatch = Stopwatch()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(startWasPressed), for: .touchUpInside)
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stopWasPressed(_ sender: UIButton) {
        stopwatch.stopWasPressed()
        stopwatch.isRunning = false
    }
    
    @IBAction func startWasPressed(_ sender: UIButton) {
        stopwatch.startWasPressed()
        stopwatch.isRunning = true
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.callUpdateTimer(_:)), userInfo: nil, repeats: true)
    }
    
    func callUpdateTimer(_ timer: Timer) {
        if (stopwatch.isRunning) {
            timeLabel.text = stopwatch.timeString
        } else {
            timer.invalidate()
        }
    }
    
    @IBOutlet weak var timeLabel: UILabel!

}

