//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Evan Chang on 2/17/17.
//  Copyright © 2017 Evan Chang. All rights reserved.
//

import Foundation

class Stopwatch {

    var isRunning = false
    var startTime: Date?
    
    var currentTime: TimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }

    var timeString: String {
        let minutes = currentTime / 60
        let seconds = currentTime.truncatingRemainder(dividingBy: 60)
        let milliseconds = currentTime.truncatingRemainder(dividingBy: 1.0) * 100
        return String(format: "%02d:%02d.%02d", Int(minutes), Int(seconds),Int(milliseconds))
    }
    
    func startWasPressed() {
        startTime = Date()
    }
    
    func stopWasPressed() {
        startTime = nil
    }
}
