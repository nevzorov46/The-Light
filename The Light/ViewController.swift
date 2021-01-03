//
//  ViewController.swift
//  The Light
//
//  Created by Иван Карамазов on 02.01.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
   // Variable for the switching background color.
   private var color = 0
    
   // Variable for switching state of the torch light.
   private var isTorch = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
      
    }
    
    
    /// This function changes background color depends on integer.
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

    
    /// Called whe a user taps on the empty space on the screen.
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

