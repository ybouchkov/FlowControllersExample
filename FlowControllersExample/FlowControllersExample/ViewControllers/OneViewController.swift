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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "Apple-Logo-Store-TA-692625636")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        let button = UIButton(frame: view.bounds)
        button.center = view.center
        button.addTarget(self, action: #selector(dismissViewController(sender:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Deallocating: \(self)")
    }
    
    @objc func dismissViewController(sender:Any) {
        print("dismiss button pressed")
        delegate?.dismissFirstViewController()
    }

}
