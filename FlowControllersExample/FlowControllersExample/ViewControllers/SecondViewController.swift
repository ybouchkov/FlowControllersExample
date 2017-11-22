//
//  SecondViewController.swift
//  FlowControllersExample
//
//  Created by Yani Buchkov on 11/22/17.
//  Copyright © 2017 Mr Bouchkov. All rights reserved.
//

import UIKit

protocol SecondAndThirdViewControllersDelegate:class {
    func didBackToProfileViewController()
}


protocol SecondViewModelType { }
struct SecondViewModel: SecondViewModelType { }


class SecondViewController: UIViewController {

    let viewModel: SecondViewModel?
    public weak var delegate: SecondAndThirdViewControllersDelegate?
    
    init(viewModel: SecondViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SecondViewController"
    }
    deinit {
        print("Deallocating: \(self)")
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }


}
