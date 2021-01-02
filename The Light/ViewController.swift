//
//  ViewController.swift
//  The Light
//
//  Created by Иван Карамазов on 02.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var isLightOn = true

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
      
    }
    
    fileprivate func updateUI() {
        view.backgroundColor = isLightOn ? .white : .black
    }


    @IBAction func buttonPressed() {
        isLightOn.toggle()
        updateUI()
    }
}

