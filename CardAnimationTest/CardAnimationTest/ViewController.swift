//
//  ViewController.swift
//  CardAnimationTest
//
//  Created by Jeffrey Wu on 2017-05-30.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yellow: UIView!
    var hasStarted = false
    
    var transitionController: TransitionController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let expandPanGesture = UIPanGestureRecognizer()
        expandPanGesture.addTarget(self, action: #selector(handlePanGesture(pan:)))
        view.addGestureRecognizer(expandPanGesture)
        
        transitionController = TransitionController(presentingViewController: self, panGesture: expandPanGesture)
    }
    
    func handlePanGesture(pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: pan.view!)
        
        let d = translation.y / (-20)
        
        switch (pan.state) {
        case .began:
            hasStarted = true
            let embedded = storyboard!.instantiateViewController(withIdentifier: "Embedded") as! EmbeddedViewController
            embedded.transitioningDelegate = transitionController
            embedded.modalPresentationStyle = .custom
            present(embedded, animated: true, completion: nil)
        default:
            break
        }
    }
}

class EmbeddedViewController: UIViewController
{
    
}

class HalfSizePresentationController: UIPresentationController
{
    override var frameOfPresentedViewInContainerView: CGRect {
        let half = containerView!.bounds.height / 2
//        let half = containerView!.bounds.height
        let result = CGRect(x: 0, y: containerView!.bounds.height - 250, width: containerView!.bounds.width, height: 250)
        return result
    }
    
    override func presentationTransitionWillBegin() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
}
