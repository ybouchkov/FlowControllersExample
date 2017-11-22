//
//  OneViewController.swift
//  FlowControllersExample
//
//  Created by Yani Buchkov on 11/22/17.
//  Copyright © 2017 Mr Bouchkov. All rights reserved.
//

import UIKit

protocol FirstViewControllerDelegates: class {
    func dismissFirstViewController()
}

protocol FirstViewModelType { }
struct FirstViewModel: FirstViewModelType { }


class OneViewController: UIViewController {

    let viewModel: FirstViewModel
    public weak var delegate: FirstViewControllerDelegates?
    
    init(viewModel: FirstViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Deallocating: \(self)")
    }
    
    func dismissViewController(sender:Any) {
        print("dismiss button pressed")
        delegate?.dismissFirstViewController()
    }

}
