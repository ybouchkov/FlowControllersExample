//
//  AuthenticationCoordinator.swift
//  FlowControllersExample
//
//  Created by Yani Buchkov on 11/21/17.
//  Copyright © 2017 Mr Bouchkov. All rights reserved.
//

import Foundation
import UIKit

protocol AuthenticationCoordinatorDelegate:class {
    func coordinatorDidAuthenticate(coordinator: AuthenticationCoordinator)
}

final class AuthenticationCoordinator: Coordinator {
    
    weak var delegate: AuthenticationCoordinatorDelegate?
    let navigationController: UINavigationController
    let loginViewController: LoginViewController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let viewModel = LoginViewModel()
        self.loginViewController = LoginViewController(viewModel: viewModel)
    }
    
    func start() {
        showLoginViewController()
    }
    
    deinit {
        print("deallocating: \(self)")
    }

    func showLoginViewController() {
        loginViewController.delegate = self
        navigationController.show(loginViewController, sender: self)
    }
    
    func showSignUpViewController() {
        let viewModel = SignupViewModel()
        let signup = SingUpViewController(viewModel: viewModel)
        signup.delegate = self
        navigationController.show(signup, sender: self)
    }
}

extension AuthenticationCoordinator : LoginViewControllerDelegate {
    
    func didSuccessfullyLogin() {
        print(navigationController.childViewControllers)
        delegate?.coordinatorDidAuthenticate(coordinator: self)
    }
    
    func didChooseSignup() {
        showSignUpViewController()
    }
}

extension AuthenticationCoordinator : SignupViewControllerDelegate {
    func didCompleteSignup() {
    }
}


