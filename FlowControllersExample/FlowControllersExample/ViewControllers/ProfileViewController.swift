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
    func didSelectFirstViewController() // for example
    func didSelectSecondViewController() // another example
    func didSelectThirdViewController() // another example
}

class ProfileViewController: UIViewController {
    
    weak var delegate:ProfileViewControllerDelegate?
    let viewModel:ProfileViewModelType
    
    init(viewModel:ProfileViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile View Controller"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func firstOption(_ sender: UIBarButtonItem) {
        delegate?.didSelectFirstViewController()
    }
    @IBAction func secondOption(_ sender: UIBarButtonItem) {
        delegate?.didSelectSecondViewController()
    }
    @IBAction func didSelectThirdOption(_ sender: UIBarButtonItem) {
        delegate?.didSelectThirdViewController()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

