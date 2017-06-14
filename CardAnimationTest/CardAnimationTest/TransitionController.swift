//
//  TransitionController.swift
//  CardAnimationTest
//
//  Created by Jeffrey Wu on 2017-06-12.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import UIKit

let transitionTime = 0.8

class TransitionController: NSObject {
    var presentingVC: UIViewController?
    var panGestureRecognizer: UIPanGestureRecognizer
    var transitionDriver: TransitionDriver?
    var initiallyInteractive = false
    
    var isPresenting = false
    
    init(presentingViewController vc: UIViewController, panGesture: UIPanGestureRecognizer) {
        presentingVC = vc
        panGestureRecognizer = panGesture
        super.init()
        
        configurePanGestureRecognizer()
    }
    
    func configurePanGestureRecognizer() {
        panGestureRecognizer.delegate = self
        panGestureRecognizer.maximumNumberOfTouches = 1
        panGestureRecognizer.addTarget(self, action: #selector(initiateTransitionInteractively(_:)))
    }
    
    @objc func initiateTransitionInteractively(_ panGesture: UIPanGestureRecognizer) {
        initiallyInteractive = false
    }
}

extension TransitionController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension TransitionController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self
    }
}

extension TransitionController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionTime
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {}
    
    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        return (transitionDriver?.transitionAnimator)!
    }
}

extension TransitionController: UIViewControllerInteractiveTransitioning {
    func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        transitionDriver = TransitionDriver(context: transitionContext, panGestureRecognizer: panGestureRecognizer)
    }
    
    var wantsInteractiveStart: Bool {
        return initiallyInteractive
    }
}
