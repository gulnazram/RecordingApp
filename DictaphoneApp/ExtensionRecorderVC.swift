//
//  ExtensionRecorderVC.swift
//  DictaphoneApp
//
//  Created by Gulnaz on 05.12.2022.
//

import UIKit

extension RecorderViewController {
    
    @objc func updateAudioMeter(_ timer: Timer) {
               
        if let recorder = self.audioRecorder {
           if recorder.isRecording {
               let min = Int(recorder.currentTime / 60)
               let sec = Int(recorder.currentTime.truncatingRemainder(dividingBy: 60))
               let timeString = String(format: "%02d:%02d", min, sec)
               timeLabel.text = timeString
               recorder.updateMeters()
            }
    }
}
        
    func startTimer() {
       self.timer = Timer.scheduledTimer(
       timeInterval: 0.1,
       target: self,
       selector: #selector(self.updateAudioMeter(_:)),
       userInfo: nil,
       repeats: true)
   }
}
