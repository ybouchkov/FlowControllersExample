//
//  LoginViewController.swift
//  FlowControllersExample
//
//  Created by Yani Buchkov on 11/21/17.
//  Copyright © 2017 Mr Bouchkov. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate:class {
    func didSuccessfullyLogin()
    func didChooseSignup()
}
protocol LoginViewModelType { }
struct LoginViewModel: LoginViewModelType { }


final class LoginViewController: UIViewController {
    
    weak var delegate:LoginViewControllerDelegate?
    let viewModel: LoginViewModel?
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deallocing \(self)")
    }
    //  MARK:   -   ACTIONS
    @IBAction func loginAction(_ sender: UIButton) {
        delegate?.didSuccessfullyLogin()
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        delegate?.didChooseSignup()
    }
    
    
}
