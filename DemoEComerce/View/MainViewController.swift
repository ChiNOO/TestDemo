//
//  MainViewController.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import UIKit


class MainViewController: UIViewController, UISearchBarDelegate, ReusableTableViewDelegate, MainDelegate{
    
    func loadSearch(list: [ProductModel]) {
        self.reusableTableView?.update(items: list)
    }
    
    
    @IBOutlet weak var searchView: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var reusableTableView: ReusableTableViewDataSource?
    var mainPresenter: MainPresenter?

    var productsList: [ProductModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        mainPresenter = MainPresenter(delegate: self)

        updateView()
        // Do any additional setup after loading the view.
    }
    
    func updateView(){
        searchView.delegate = self
        
        reusableTableView = ReusableTableViewDataSource(tableView: self.tableView, delegate: self, nibName: "ProductItem", cellName: "cell")
        tableView.dataSource = reusableTableView
        tableView.delegate = reusableTableView
        tableView.reloadData()
        reusableTableView?.update(items: productsList)
       // searchPresenter?.getSearchsWords()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("HOLA")
        self.mainPresenter?.getSearch()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchView.searchTextField.endEditing(true)
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController")
        viewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
       

        self.present(viewController, animated: true, completion: nil)
    }


}

