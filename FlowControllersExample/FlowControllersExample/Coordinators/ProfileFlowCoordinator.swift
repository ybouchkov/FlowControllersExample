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
}

extension ProfileFlowCoordinator : ProfileViewControllerDelegate {
    
    func didSelectSettingsAction() {
    }
    
    func didSelectFollowingAction() {
    }
    
    func didSelectFollowersAction() {
    }
}


