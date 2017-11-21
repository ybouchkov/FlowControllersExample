//
//  SingUpViewController.swift
//  FlowControllersExample
//
//  Created by Yani Buchkov on 11/21/17.
//  Copyright © 2017 Mr Bouchkov. All rights reserved.
//

import UIKit

protocol SignupViewControllerDelegate:class {
    func didCompleteSignup()
}

protocol SignupViewModelType { }

struct SignupViewModel:SignupViewModelType { }


final class SingUpViewController: UIViewController {
    
    weak var delegate: SignupViewControllerDelegate?
    let viewModel: SignupViewModel?
    
    init(viewModel: SignupViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deallocing \(self)")
    }

    
}
