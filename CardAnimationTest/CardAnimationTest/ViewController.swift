//
//  ViewController.swift
//  CardAnimationTest
//
//  Created by Jeffrey Wu on 2017-05-30.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var transition = Transition()
    @IBOutlet weak var yellow: UIView!
    var hasStarted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let expandPanGesture = UIPanGestureRecognizer()
        expandPanGesture.addTarget(self, action: #selector(handlePanGesture(pan:)))
        view.addGestureRecognizer(expandPanGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        let embedded = segue.destination as! EmbeddedViewController
//        embedded.transitioningDelegate = self
//    }
    
    func handlePanGesture(pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: pan.view!)
        
        let d = translation.y / (-20)
        
        switch (pan.state) {
        case .began:
            hasStarted = true
            let embedded = storyboard!.instantiateViewController(withIdentifier: "Embedded") as! EmbeddedViewController
            embedded.transitioningDelegate = self
            embedded.modalPresentationStyle = .custom
            present(embedded, animated: true, completion: nil)
        case .changed:
            print("\(d)")
            transition.update(d)
        default:
            hasStarted = false
            transition.finish()
        }
    }
}

extension ViewController: UIViewControllerTransitioningDelegate
{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originalFrame = yellow.frame
        transition.sourceVC = self
        transition.presenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return hasStarted ? transition : nil
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?
    {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
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

class Transition: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning
{
    var originalFrame = CGRect.zero
    var presenting = false
    var sourceVC: UIViewController?
    
    private var expandPanGesture: UIPanGestureRecognizer!
    private var interactive = false
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let finalFrame = toView.frame
        containerView.addSubview(toView)
        
        let xScale = originalFrame.width/finalFrame.width
        let yScale = originalFrame.height/finalFrame.height
        let scaleTransform = CGAffineTransform(scaleX: xScale, y: yScale)
        
        toView.transform = scaleTransform
//        toView.frame = originalFrame
//        toView.layoutIfNeeded()
        toView.center = CGPoint(x: originalFrame.midX, y: originalFrame.midY)
        toView.clipsToBounds = true
        toView.alpha = 0
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, options: .curveEaseOut, animations: {
//            toView.frame = finalFrame
            toView.transform = CGAffineTransform.identity
            toView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
            toView.alpha = 1.0
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
}
