//
//  ThirdViewController.swift
//  FlowControllersExample
//
//  Created by Yani Buchkov on 11/22/17.
//  Copyright © 2017 Mr Bouchkov. All rights reserved.
//

import UIKit

protocol ThirdViewModelType { }
struct ThirdViewModel: ThirdViewModelType { }

class ThirdViewController: UIViewController {

    let viewModel: ThirdViewModel?
    weak var delegate: SecondAndThirdViewControllersDelegate?
    
    init(viewModel: ThirdViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ThirdViewController"
    }
    
    deinit {
        print("Deallocating: \(self)")
    }

}
