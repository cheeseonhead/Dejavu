//
//  TransitionDriver.swift
//  CardAnimationTest
//
//  Created by Jeffrey Wu on 2017-06-12.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import UIKit

class TransitionDriver: NSObject {
    
    var transitionAnimator: UIViewPropertyAnimator!
    var transitionContext: UIViewControllerContextTransitioning
    
    private let pan: UIPanGestureRecognizer
    fileprivate var interruptPan: UIPanGestureRecognizer!
    fileprivate var interruptPress: UILongPressGestureRecognizer!
    
    init(context: UIViewControllerContextTransitioning, panGestureRecognizer panGesture: UIPanGestureRecognizer) {
        self.transitionContext = context
        self.pan = panGesture
        super.init()
        
        self.pan.addTarget(self, action: #selector(updateInteraction(_:)))
        
        // Add the views to container view
        let toView = context.view(forKey: .to)!
        
        position(toView)
        setupTransitionAnimator(with: toView)
        interruptPan = addInterruptPanGesture(to: toView)
        interruptPress = addInterruptPressGesture(to: toView)
        
        if !context.isInteractive {
            transitionAnimator.startAnimation()
        }
    }
}

// MARK: - Setup
extension TransitionDriver {
    func position(_ toView: UIView) {
        let translate = CGAffineTransform(translationX: 0, y: transitionContext.containerView.frame.size.height)
        toView.transform = translate
        transitionContext.containerView.addSubview(toView)
    }
    
    func setupTransitionAnimator(with toView: UIView) {
        transitionAnimator = UIViewPropertyAnimator(duration: 0.8, curve: .linear, animations: {
            toView.transform = .identity
        })
        
        transitionAnimator.addCompletion { [unowned self] (position) in
            let completed = (position == .end)
            self.transitionContext.completeTransition(completed)
            toView.removeGestureRecognizer(self.interruptPan!)
            toView.removeGestureRecognizer(self.interruptPress)
        }
    }
    
    func addInterruptPanGesture(to toView:UIView) -> UIPanGestureRecognizer {
        let interPan = UIPanGestureRecognizer(target: self, action: #selector(updateInteraction(_:)))
        interPan.delegate = self
        toView.addGestureRecognizer(interPan)
        
        return interPan
    }
    
    func addInterruptPressGesture(to toView:UIView) -> UILongPressGestureRecognizer {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handle(press:)))
        longPress.delegate = self
        longPress.minimumPressDuration = 0.0
        toView.addGestureRecognizer(longPress)
        
        return longPress
    }
}

// MARK: - Gesture Delegate
extension TransitionDriver: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

// MARK: - Animation Handling
extension TransitionDriver {
    @objc func updateInteraction(_ pan: UIPanGestureRecognizer) {
        
        let translation = pan.translation(in: transitionContext.containerView)
        let percentComplete = transitionAnimator.fractionComplete +  translation.y / -200
        
        switch pan.state {
        case .began, .changed:
            switch transitionAnimator.state {
            case .active:
                transitionAnimator.pauseAnimation()
            default: break
            }
            
            transitionAnimator.fractionComplete = percentComplete
            
            pan.setTranslation(CGPoint.zero, in: pan.view)
        case .ended, .cancelled:
            if transitionAnimator.state == .inactive {
                transitionAnimator.startAnimation()
            }
            else {
                let percentRemaining = 1 - percentComplete
                transitionAnimator.continueAnimation(withTimingParameters: nil, durationFactor: percentRemaining)
            }
        default: break
        }
    }
    
    @objc func handle(press: UILongPressGestureRecognizer) {
        switch press.state {
        case .began:
            switch transitionAnimator.state {
            case .active:
                transitionAnimator.pauseAnimation()
            default: break
            }
        default: break
        }
    }
}
