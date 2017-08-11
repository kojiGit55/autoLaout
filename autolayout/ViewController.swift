//
//  ViewController.swift
//  autolayout
//
//  Created by 中島幸治 on 2017/08/11.
//  Copyright © 2017 中島幸治. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    //override func viewDidLoad() {
    //    super.viewDidLoad()
        
    
   /// }
    
    let sampleLabel = { (text) -> UILabel in
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }("aaaa")
    let motionManager = CMMotionManager()
    var x = 0
    var y = 0
    var z = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(sampleLabel)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-60-[button(200)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["button": sampleLabel]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-60-[button(200)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["button": sampleLabel]))

        
        self.motionManager.accelerometerUpdateInterval = 0.2
        self.motionManager.startAccelerometerUpdates(to: OperationQueue()) {
            (data, error) in
            DispatchQueue.main.async() {
                self.updateAccelerationData(data: (data?.acceleration)!)
            }
        }
    }
    
    func updateAccelerationData(data: CMAcceleration) {
        
        print("x = \(Int(data.x)), y = \(Int(data.y)), z = \(Int(data.z))")
        
        var isShaken = self.x != Int(data.x) || self.y != Int(data.y) || self.z != Int(data.z)
        
        if isShaken {
            // シェイクされたときの処理
        }
        
        self.x = Int(data.x)
        self.y = Int(data.y)
        self.z = Int(data.z)
    }
}

