//
//  ProfileViewController.swift
//  FlowControllersExample
//
//  Created by Yani Buchkov on 11/21/17.
//  Copyright © 2017 Mr Bouchkov. All rights reserved.
//

import UIKit

struct ProfileViewModel:ProfileViewModelType { }

protocol ProfileViewModelType { }

protocol ProfileViewControllerDelegate:class  {
    func didSelectSettingsAction() // for example
    func didSelectFollowingAction() // another example
    func didSelectFollowersAction() // another example
}

class ProfileViewController: UIViewController {
    
    weak var delegate:ProfileViewControllerDelegate?
    let viewModel:ProfileViewModelType
    
    init(viewModel:ProfileViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
