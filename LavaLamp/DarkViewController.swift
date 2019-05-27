//
//  DarkViewController.swift
//  LavaLamp
//
//  Created by Fauzan Achmad on 20/05/19.
//  Copyright © 2019 Fauzan Achmad. All rights reserved.
//

import UIKit

class DarkViewController: UIViewController {
    
    @IBOutlet weak var circleOneView: UIView!
    @IBOutlet weak var circleTwoView: UIView!
    @IBOutlet weak var circleThreeView: UIView!
    
    let bgColor: [UIColor] = [#colorLiteral(red: 0.7960784314, green: 0.9098039216, blue: 0.5882352941, alpha: 1), #colorLiteral(red: 0, green: 0.7843137255, blue: 0.7803921569, alpha: 1), #colorLiteral(red: 0.937254902, green: 0.2784313725, blue: 0.4352941176, alpha: 1), #colorLiteral(red: 1, green: 0.8196078431, blue: 0.4, alpha: 1), #colorLiteral(red: 0.8980392157, green: 0.3882352941, blue: 0.6, alpha: 1)]
    var bgColorIndex: Int = 0
    var outBgColorIndex: Int = 0
    var timerTest: Timer?
    
    override func viewWillAppear(_ animated: Bool) {
        circleOneView.layer.cornerRadius = circleOneView.frame.size.width/2
        circleTwoView.layer.cornerRadius = circleTwoView.frame.size.width/2
        circleThreeView.layer.cornerRadius = circleThreeView.frame.size.width/2
        
        // CIRCLE ONE SHADOW CONFIGURATION
        circleOneView.layer.shadowOffset = CGSize(width: 0, height: 2)
        circleOneView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        circleOneView.layer.shadowOpacity = 50
        circleOneView.layer.shadowRadius = 10
        
        // CIRCLE TWO SHADOW CONFIGURATION
        circleTwoView.layer.shadowOffset = CGSize(width: 0, height: 2)
        circleTwoView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        circleTwoView.layer.shadowOpacity = 50
        circleTwoView.layer.shadowRadius = 10
        
        // CIRCLE THREE SHADOW CONFIGURATION
        circleThreeView.layer.shadowOffset = CGSize(width: 0, height: 2)
        circleThreeView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        circleThreeView.layer.shadowOpacity = 50
        circleThreeView.layer.shadowRadius = 10
        
        if timerTest == nil {
            timerTest = Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(DarkViewController.randomSize), userInfo: nil, repeats: false)
            
            timerTest = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(DarkViewController.randomSize), userInfo: nil, repeats: true)
        }
        
        bgColorIndex = bgColor.count - 1
        
        UIView.appearance().backgroundColor = UIColor.black
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        stopTimerTest()
        print("dissapear dark view")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
            self.circleOneView.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.circleOneView.layer.shadowColor = self.bgColor[self.outBgColorIndex].cgColor
            self.circleOneView.layer.shadowOpacity = 50
            self.circleOneView.layer.shadowRadius = 10
            
            // CIRCLE TWO VIEW ANIMATION
            self.circleTwoView.frame = CGRect(x: randomX2, y: randomY2, width: randomWidth2, height: randomHeight2)
            self.circleTwoView.layer.cornerRadius = CGFloat(randomRadius2)
            self.circleTwoView.backgroundColor = self.bgColor[self.outBgColorIndex]
            self.circleTwoView.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.circleTwoView.layer.shadowColor = self.bgColor[self.outBgColorIndex].cgColor
            self.circleTwoView.layer.shadowOpacity = 50
            self.circleTwoView.layer.shadowRadius = 10
            
            // CIRCLE THREE VIEW ANIMATION
            self.circleThreeView.frame = CGRect(x: randomX3, y: randomY3, width: randomWidth3, height: randomHeight3)
            self.circleThreeView.layer.cornerRadius = CGFloat(randomRadius3)
            self.circleThreeView.backgroundColor = self.bgColor[self.outBgColorIndex]
            self.circleThreeView.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.circleThreeView.layer.shadowColor = self.bgColor[self.outBgColorIndex].cgColor
            self.circleThreeView.layer.shadowOpacity = 50
            self.circleThreeView.layer.shadowRadius = 10
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
