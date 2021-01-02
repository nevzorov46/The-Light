//
//  ViewController.swift
//  The Light
//
//  Created by Иван Карамазов on 02.01.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var color = 0
    
    var isTorch = false

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
      
    }
    
    fileprivate func updateUI() {
        switch color {
        case 0:
            view.backgroundColor = .cyan
            color = 1
        case 1:
            view.backgroundColor = .purple
            color = 2
        case 2:
            view.backgroundColor = .yellow
            color = 0
        default:
            view.backgroundColor = .cyan
        }
    }


    @IBAction func buttonPressed() {
        updateUI()
    }
    
    
    @IBAction func actionTorchClick(_ sender: Any) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else {
          return
        }
        
        if device.hasTorch {
            isTorch = !isTorch
            
            do {
                try device.lockForConfiguration()
                
                if isTorch == true {
                    device.torchMode = .on
                }
                
                else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            }
            
            catch {
                print("Torch is not working.")
            }
        }
        
        else {
            print("Torch not compatible with device")
        }
    }
}

