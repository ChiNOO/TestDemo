//
//  BaseViewController.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import UIKit

class BaseViewController: UIViewController{
    
    var presenter : BasePresenter?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   
        presenter?.loadPresenter()
    }
    
    override func viewDidLoad() {

    }

    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.unloadPresenter()
    }
    
    func setupPresenter<T: BasePresenter>(_ presenter: T) {
        self.presenter = presenter
    }
    
    func onViewControllerResult() {
        
    }
    
}
