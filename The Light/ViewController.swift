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
    
    var color = 0

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
}

