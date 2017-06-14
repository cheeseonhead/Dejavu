//
//  TransitionDriver.swift
//  CardAnimationTest
//
//  Created by Jeffrey Wu on 2017-06-12.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import UIKit

class TransitionDriver {
    
    var transitionAnimator: UIViewPropertyAnimator!
    var transitionContext: UIViewControllerContextTransitioning
    
    private let pan: UIPanGestureRecognizer
    
    init(context: UIViewControllerContextTransitioning, panGestureRecognizer panGesture: UIPanGestureRecognizer) {
        self.transitionContext = context
        self.pan = panGesture
        
        self.pan.addTarget(self, action: #selector(updateInteraction(_:)))
        
        // Add the views to container view
        let fromView = context.view(forKey: .from)
        let toView = context.view(forKey: .to)!
        
        let translate = CGAffineTransform(translationX: 0, y: transitionContext.containerView.frame.size.height)
        toView.transform = translate
        context.containerView.addSubview(toView)
        
        transitionAnimator = UIViewPropertyAnimator(duration: 0.8, curve: .linear, animations: {
            toView.transform = .identity
        })
        
        transitionAnimator.addCompletion { [unowned self] (position) in
            let completed = (position == .end)
            self.transitionContext.completeTransition(completed)
        }
        
        let interPan = UIPanGestureRecognizer(target: self, action: #selector(updateInteraction(_:)))
        toView.addGestureRecognizer(interPan)
        
        if !context.isInteractive {
            transitionAnimator.startAnimation()
        }
    }
}

// MARK: - Animation Handling
extension TransitionDriver {
    @objc func updateInteraction(_ pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began, .changed:
            switch transitionAnimator.state {
            case .active:
                transitionAnimator.pauseAnimation()
            default: break
            }
            let translation = pan.translation(in: transitionContext.containerView)
            
            let percentComplete = transitionAnimator.fractionComplete +  translation.y / -200
            
            transitionAnimator.fractionComplete = percentComplete
            
            pan.setTranslation(CGPoint.zero, in: pan.view)
        case .ended, .cancelled:
//            transitionContext.finishInteractiveTransition()
            
            if transitionAnimator.state == .inactive {
                transitionAnimator.startAnimation()
            }
            else {
                transitionAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 1)
            }
        default: break
        }
    }
}
