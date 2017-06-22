//
//  PlaySoundsViewController.swift
//  PitchPerfectProj
//
//  Created by Maria  on 12/1/16.
//  Copyright © 2016 Maria . All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    // Plays Sounds based on pressed button.
    @IBAction func playSoundForButton(_ sender: UIButton) {
        
        switch(ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 0.5)
            case .fast:
                playSound(rate: 1.5)
            case .chipmunk:
                playSound(pitch: 1000)
            case .vader:
                playSound(pitch: -1000)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
       
        }
        
        configureUI(.playing)
    }
    
    // Stops playing the audio.
    @IBAction func stopSound(_ sender: AnyObject) {
        stopAudio()
    }
    
    func buttonAspectFit(button: UIButton) {
        button.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonAspectFit(button: snailButton)
        buttonAspectFit(button: rabbitButton)
        buttonAspectFit(button: chipmunkButton)
        buttonAspectFit(button: vaderButton)
        buttonAspectFit(button: echoButton)
        buttonAspectFit(button: reverbButton)
        buttonAspectFit(button: stopButton)

        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    
}
