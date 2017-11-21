//
//  AppCoordinator.swift
//  FlowControllersExample
//
//  Created by Yani Buchkov on 11/21/17.
//  Copyright © 2017 Mr Bouchkov. All rights reserved.
//

import Foundation
import UIKit

class Coordinator { }


final class AppCoordinator {
    
    fileprivate var isLoggedIn: Bool = false
    fileprivate let navigationController:UINavigationController
    fileprivate var childCoordinators = [Coordinator]()

    init(withNavigationController navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("deallocing: \(self)")
    }
    
    func start() {
        if isLoggedIn {
            showProfile()
        } else {
            showSignUp()
        }
    }
    
    fileprivate func showProfile() {
        // show profile
        let profileFlowCoordinator = ProfileFlowCoordinator(navigationController: navigationController)
        profileFlowCoordinator.delegate = self
        profileFlowCoordinator.start()
        childCoordinators.append(profileFlowCoordinator)
    }
    
    func showSignUp() {
        // show sign up
        let authenticationFlowCoordinator = AuthenticationCoordinator(navigationController: navigationController)
        authenticationFlowCoordinator.delegate = self
        authenticationFlowCoordinator.start()
        childCoordinators.append(authenticationFlowCoordinator)
    }
}

extension AppCoordinator: AuthenticationCoordinatorDelegate {
    
    func coordinatorDidAuthenticate(coordinator: AuthenticationCoordinator) {
        removeCoordinator(coordinator: coordinator)
        showProfile()
    }
    
    //  removing the coordinators from childs
    fileprivate func removeCoordinator(coordinator: Coordinator) {
        var idx: Int?
        
        for (index, value) in childCoordinators.enumerated() {
            if value === coordinator {
                idx = index
                break
            }
        }
        
        if let index = idx {
            childCoordinators.remove(at: index)
        }
    }
}


extension AppCoordinator: ProfileFlowCoordinatorDelegate {
    //  TODO: - Implement
}











