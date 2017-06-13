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
        
        toView.alpha = 0
        context.containerView.addSubview(toView)
        
        transitionAnimator = UIViewPropertyAnimator(duration: 0.8, curve: .linear, animations: {
            toView.alpha = 1.0
        })
        
        transitionAnimator.addCompletion { [unowned self] (position) in
            self.transitionContext.completeTransition(true)
        }
        
//        setupTransitionAnimator({
//            <#code#>
//        }, transitionCompletion: <#T##(UIViewAnimatingPosition) -> ()#>)
    }
}

// MARK: - Setup
extension TransitionDriver {
    func setupTransitionAnimator(_ transitionAnimations: @escaping ()->(), transitionCompletion: @escaping (UIViewAnimatingPosition)->()) {
        // The duration of the transition, if uninterrupted
        let transitionDuration = 0.8
        
        // Create a UIViewPropertyAnimator that lives the lifetime of the transition
        transitionAnimator = UIViewPropertyAnimator(duration: transitionDuration, curve: .easeOut, animations: transitionAnimations)
        
        transitionAnimator.addCompletion { [unowned self] (position) in
            // Call the supplied completion
            transitionCompletion(position)
            
            // Inform the transition context that the transition has completed
            let completed = (position == .end)
            self.transitionContext.completeTransition(completed)
        }
    }
}


// MARK: - Animation Handling
extension TransitionDriver {
    @objc func updateInteraction(_ pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began, .changed:
            // Ask the gesture recognizer for it's translation
            let translation = pan.translation(in: transitionContext.containerView)
            
            // Calculate the percent complete
//            let percentComplete = transitionAnimator.fractionComplete + progressStepFor(translation: translation)
            let percentComplete = translation.y / -200
            
            // Update the transition animator's fractionCompete to scrub it's animations
            transitionAnimator.fractionComplete = percentComplete
            
            // Inform the transition context of the updated percent complete
            transitionContext.updateInteractiveTransition(percentComplete)
            
            // Update each transition item for the
//            updateItemsForInteractive(translation: translation)
            
            // Reset the gestures translation
//            fromGesture.setTranslation(CGPoint.zero, in: transitionContext.containerView)
        case .ended, .cancelled:
            transitionContext.finishInteractiveTransition()
            
            if transitionAnimator.state == .inactive {
                transitionAnimator.startAnimation()
            }
            else {
                transitionAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 1)
            }
            
            print(transitionAnimator.state)
            break
            // End the interactive phase of the transition
//            endInteraction()
        default: break
        }
    }
}
