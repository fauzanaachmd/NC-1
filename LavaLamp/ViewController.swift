//
//  ViewController.swift
//  LavaLamp
//
//  Created by Fauzan Achmad on 20/05/19.
//  Copyright © 2019 Fauzan Achmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var circleOneView: UIView!
    @IBOutlet weak var circleTwoView: UIView!
    
    let bgColor: [UIColor] = [#colorLiteral(red: 0.003921568627, green: 0.1921568627, blue: 0.7176470588, alpha: 1), #colorLiteral(red: 0, green: 0.7843137255, blue: 0.7803921569, alpha: 1)]
    var bgColorIndex: Int = 0
    var outBgColorIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        circleOneView.layer.cornerRadius = circleOneView.frame.size.width/2
        circleTwoView.layer.cornerRadius = circleTwoView.frame.size.width/2
        
        _ = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(randomSize), userInfo: nil, repeats: true)
        
        bgColorIndex = bgColor.count - 1
    }

    @objc func randomSize() {
        let randomWidth = Int.random(in: 200...500)
        let randomHeight = Int.random(in: 200...500)
        
        // RANDOM X, Y, RADIUS FOR CIRCLE ONE
        let randomX = Int.random(in: 0...Int(UIScreen.main.bounds.width))
        let randomY = Int.random(in: 0...Int(UIScreen.main.bounds.height))
        let randomRadius = Int.random(in: 50...200)
        
        // RANDOM X, Y, RADIUS FOR CIRCLE TWO
        let randomX2 = Int.random(in: 0...Int(UIScreen.main.bounds.width))
        let randomY2 = Int.random(in: 0...Int(UIScreen.main.bounds.height))
        let randomRadius2 = Int.random(in: 50...200)
        
        UIView.animate(withDuration: 8, animations: {
            // CIRCLE ONE VIEW ANIMATION
            self.circleOneView.frame = CGRect(x: randomX - randomWidth, y: randomY - randomHeight, width: randomWidth, height: randomHeight)
            self.circleOneView.layer.cornerRadius = CGFloat(randomRadius)
            self.circleOneView.backgroundColor = self.bgColor[self.outBgColorIndex]
            
            // CIRCLE TWO VIEW ANIMATION
            self.circleTwoView.frame = CGRect(x: randomX2 - randomWidth, y: randomY2 - randomHeight, width: randomWidth, height: randomHeight)
            self.circleTwoView.layer.cornerRadius = CGFloat(randomRadius2)
            self.circleTwoView.backgroundColor = self.bgColor[self.outBgColorIndex]
        })
        
        if self.outBgColorIndex == self.bgColorIndex {
            self.outBgColorIndex = 0
            print("balik ke 0")
        } else {
            self.outBgColorIndex += 1
            print("tambah 1")
        }
    }

}

