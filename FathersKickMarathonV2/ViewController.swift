//
//  ViewController.swift
//  FathersKickMarathonV2
//
//  Created by Геннадий Ведерников on 04.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var animator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
        button1.addGestureRecognizer(tapGestureRecognizer1)

        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
        button2.addGestureRecognizer(tapGestureRecognizer2)

        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
        button3.addGestureRecognizer(tapGestureRecognizer3)
        
    }
    
    @objc func buttonTapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            
            let duration = 0.5
            let timingParameters = UICubicTimingParameters(animationCurve: .easeInOut)
            animator = UIViewPropertyAnimator(duration: duration, timingParameters: timingParameters)

            animator?.addAnimations {
                sender.view?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }

            animator?.addCompletion { _ in
                sender.view?.transform = CGAffineTransform.identity
            }

            animator?.startAnimation()
        } else if sender.state == .cancelled || sender.state == .failed || sender.state == .recognized {
            animator?.isReversed = true
        }
    }
}

