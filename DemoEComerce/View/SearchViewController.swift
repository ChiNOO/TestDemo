//
//  SearchViewController.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, SearchDelegate, ReusableTableViewDelegate {
   
    func successSearch(list: [ProductModel]) {
        dismiss(animated: true, completion: nil)
    }
    
    func errorSearch() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func loadSearchWords(list: [SearchWordModel]) {
        reusableTableView?.update(items: list)
    }
    
    
    
    @IBOutlet weak var searchView: UISearchBar!
    
    @IBOutlet weak var searchTableView: UITableView!
    var reusableTableView: ReusableTableViewDataSource?
    var searchPresenter: SearchPresenter?
    var searchList: [SearchWordModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchPresenter = SearchPresenter(delegate: self)

        updateView()
        searchPresenter?.loadPresenter()

        // Do any additional setup after loading the view.
    }
    
    func updateView(){
        searchView.delegate = self
        searchView.searchTextField.becomeFirstResponder()
        
        
        reusableTableView = ReusableTableViewDataSource(tableView: self.searchTableView, delegate: self, nibName: "SearchItem", cellName: "cell")
        searchTableView.dataSource = reusableTableView
        searchTableView.delegate = reusableTableView
        searchTableView.reloadData()
        reusableTableView?.update(items: searchList)
        searchPresenter?.getSearchsWords()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Button search")
        self.searchPresenter?.getRequestAPICall(parameters_name: searchBar.searchTextField.text!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Button canccel")
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
