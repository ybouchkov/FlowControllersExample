//
//  NavigationControllerDelegate.swift
//  FlowControllersExample
//
//  Created by Yani Buchkov on 11/21/17.
//  Copyright © 2017 Mr Bouchkov. All rights reserved.
//

import Foundation
import UIKit

final class NavigationControllerDelegate: NSObject {
    fileprivate var animator:AnimatedTransitioning!
    fileprivate var interactionController:UIPercentDrivenInteractiveTransition?
    
    init(animator:AnimatedTransitioning = NavigationAnimator()) {
        self.animator = animator
    }
}

extension NavigationControllerDelegate : UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.operation = operation
        return animator
    }
    
    public func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
}
