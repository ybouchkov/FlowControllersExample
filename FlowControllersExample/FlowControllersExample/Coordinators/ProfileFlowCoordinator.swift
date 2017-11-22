//
//  ProfileFlowCoordinator.swift
//  FlowControllersExample
//
//  Created by Yani Buchkov on 11/21/17.
//  Copyright © 2017 Mr Bouchkov. All rights reserved.
//

import Foundation
import UIKit


protocol ProfileFlowCoordinatorDelegate:class { }

final class ProfileFlowCoordinator: Coordinator {
    
    fileprivate let navigationController: UINavigationController
    fileprivate let profileViewController: ProfileViewController
    fileprivate let navigationDelegate: NavigationControllerDelegate?

    fileprivate var isProfileViewContoller: Bool {
        guard let _ = navigationController.topViewController?.isKind(of: ProfileViewController.self) else { return false }
        return true
    }
    
    weak var delegate:ProfileFlowCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationDelegate = NavigationControllerDelegate()
        self.navigationController.delegate = navigationDelegate
        let viewModel = ProfileViewModel()
        self.profileViewController = ProfileViewController(viewModel: viewModel)

    }
    
    func start() {
        profileViewController.delegate = self 
        
        guard let topViewController = navigationController.topViewController else {
            return navigationController.setViewControllers([profileViewController], animated: false)
        }
        
        profileViewController.view.frame = topViewController.view.frame
        UIView.transition(from:topViewController.view , to: profileViewController.view, duration: 0.50, options: .transitionCrossDissolve) {[unowned self] (finished) in
            self.navigationController.setViewControllers([self.profileViewController], animated: false)
        }
    }
    
    fileprivate func showFirstViewController() {
        let firstViewModel = FirstViewModel()
        let firstVC = OneViewController(viewModel: firstViewModel)
        firstVC.delegate = self
        navigationController.show(firstVC, sender: self)
        
    }
    
    fileprivate func showSecondViewController(){
        let secondViewModel = SecondViewModel()
        let secondVC = SecondViewController(viewModel: secondViewModel)
        secondVC.delegate = self
        if isProfileViewContoller {
            navigationController.show(secondVC, sender: self)
        }
    }
    
    fileprivate func showThirdViewController() {
        let thirdViewModel = ThirdViewModel()
        let thirdVC = ThirdViewController(viewModel: thirdViewModel)
        thirdVC.delegate = self
        
        if isProfileViewContoller {
            navigationController.show(thirdVC, sender: self)
        }
    }
    
    fileprivate func dismissModal() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func popToProfileVC () {
        navigationController.popViewController(animated: true)
    }

}

extension ProfileFlowCoordinator : ProfileViewControllerDelegate {
    func didSelectFirstViewController() {
        showFirstViewController()
    }
    
    func didSelectSecondViewController() {
        showSecondViewController()
    }
    
    func didSelectThirdViewController() {
        showThirdViewController()
    }
}

extension ProfileFlowCoordinator: FirstViewControllerDelegates {
    func dismissFirstViewController() {
        dismissModal()
    }
}

extension ProfileFlowCoordinator: SecondAndThirdViewControllersDelegate {
    func didBackToProfileViewController() {
        popToProfileVC()
    }
}



