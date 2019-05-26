//
//  ViewController.swift
//  LavaLamp
//
//  Created by Fauzan Achmad on 20/05/19.
//  Copyright © 2019 Fauzan Achmad. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var circleOneView: UIView!
    @IBOutlet weak var circleTwoView: UIView!
    @IBOutlet weak var circleThreeView: UIView!
    
    let bgColor: [UIColor] = [#colorLiteral(red: 0.003921568627, green: 0.1921568627, blue: 0.7176470588, alpha: 1), #colorLiteral(red: 0, green: 0.7843137255, blue: 0.7803921569, alpha: 1), #colorLiteral(red: 0.937254902, green: 0.2784313725, blue: 0.4352941176, alpha: 1), #colorLiteral(red: 1, green: 0.8196078431, blue: 0.4, alpha: 1), #colorLiteral(red: 0.8980392157, green: 0.3882352941, blue: 0.6, alpha: 1)]
    var bgColorIndex: Int = 0
    var outBgColorIndex: Int = 0
    var timerTest: Timer?
    
    var player: AVAudioPlayer?
    
    override func viewWillAppear(_ animated: Bool) {
        circleOneView.layer.cornerRadius = circleOneView.frame.size.width/2
        circleTwoView.layer.cornerRadius = circleTwoView.frame.size.width/2
        circleThreeView.layer.cornerRadius = circleThreeView.frame.size.width/2
        
        if timerTest == nil {
            timerTest = Timer.scheduledTimer(timeInterval: TimeInterval(0), target: self, selector: #selector(ViewController.randomSize), userInfo: nil, repeats: false)
            
            timerTest = Timer.scheduledTimer(timeInterval: TimeInterval(8.0), target: self, selector: #selector(ViewController.randomSize), userInfo: nil, repeats: true)
        }
        
        bgColorIndex = bgColor.count - 1
        
        UIView.appearance().backgroundColor = UIColor.white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        stopTimerTest()
        print("dissapear light view")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UITabBar.appearance().backgroundColor = UIColor.white
        
        // CODE FOR BACKGROUND SOUND
        guard let url = Bundle.main.url(forResource: "Pixelated_Autumn_Leaves", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

    @objc func randomSize() {
        // RANDOM WIDTH AND HEIGHT 1
        let randomWidth = CGFloat.random(in: 200...500)
        let randomHeight = CGFloat.random(in: 200...500)
        
        // RANDOM WIDTH AND HEIGHT 2
        let randomWidth2 = CGFloat.random(in: 100...300)
        let randomHeight2 = CGFloat.random(in: 100...300)
        
        // RANDOM WIDTH AND HEIGHT 3
        let randomWidth3 = CGFloat.random(in: 50...200)
        let randomHeight3 = CGFloat.random(in: 50...200)
        
        // RANDOM X, Y, RADIUS FOR CIRCLE ONE
        let randomX = CGFloat.random(in: 0...CGFloat(UIScreen.main.bounds.width))
        let randomY = CGFloat.random(in: 0...CGFloat(UIScreen.main.bounds.height))
        let randomRadius = Int.random(in: 50...200)
        
        // RANDOM X, Y, RADIUS FOR CIRCLE TWO
        let randomX2 = CGFloat.random(in: 0...CGFloat(UIScreen.main.bounds.width))
        let randomY2 = CGFloat.random(in: 0...CGFloat(UIScreen.main.bounds.height))
        let randomRadius2 = Int.random(in: 50...200)
        
        // RANDOM X, Y, RADIUS FOR CIRCLE THREE
        let randomX3 = CGFloat.random(in: 0...CGFloat(UIScreen.main.bounds.width))
        let randomY3 = CGFloat.random(in: 0...CGFloat(UIScreen.main.bounds.height))
        let randomRadius3 = Int.random(in: 50...200)
        
        UIView.animate(withDuration: 8, animations: {
            // CIRCLE ONE VIEW ANIMATION
            self.circleOneView.frame = CGRect(x: randomX, y: randomY, width: randomWidth, height: randomHeight)
            self.circleOneView.layer.cornerRadius = CGFloat(randomRadius)
            self.circleOneView.backgroundColor = self.bgColor[self.outBgColorIndex]
            
            // CIRCLE TWO VIEW ANIMATION
            self.circleTwoView.frame = CGRect(x: randomX2, y: randomY2, width: randomWidth2, height: randomHeight2)
            self.circleTwoView.layer.cornerRadius = CGFloat(randomRadius2)
            self.circleTwoView.backgroundColor = self.bgColor[self.outBgColorIndex]
            
            // CIRCLE THREE VIEW ANIMATION
            self.circleThreeView.frame = CGRect(x: randomX3, y: randomY3, width: randomWidth3, height: randomHeight3)
            self.circleThreeView.layer.cornerRadius = CGFloat(randomRadius3)
            self.circleThreeView.backgroundColor = self.bgColor[self.outBgColorIndex]
        })
        
        if self.outBgColorIndex == self.bgColorIndex {
            self.outBgColorIndex = 0
        } else {
            self.outBgColorIndex += 1
        }
    }
    
    func stopTimerTest() {
        if timerTest != nil {
            timerTest!.invalidate()
            timerTest = nil
        }
    }

}

