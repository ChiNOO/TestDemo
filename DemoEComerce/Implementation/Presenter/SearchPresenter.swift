//
//  SearchPresenter.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import Foundation
import Alamofire
import ObjectMapper


class SearchPresenter: BasePresenter{
    
    var delegate: SearchDelegate?
    
    
    init(delegate : SearchDelegate) {
        self.delegate = delegate
    }
    
    func getSearchsWords(){
        let searchWords = realm?.objects(SearchWordModel.self)
        var searchWordList: [SearchWordModel] = []
        for result in searchWords!{
            searchWordList.append(result)
        }
        print(searchWordList)
        self.delegate?.loadSearchWords(list: searchWordList)
    }
    
    func getRequestAPICall(parameters_name: String)  {
        
        let searchWord = SearchWordModel()
        searchWord.searchWord = parameters_name
        searchWord.id = NSUUID().uuidString
        
        try! realm!.write{
            realm!.add(searchWord)
        }
        
        let headers: HTTPHeaders = [
            "X-IBM-Client-Id": "adb8204d-d574-4394-8c1a-53226a40876e"        ]
        
        AF.request("https://00672285.us-south.apigw.appdomain.cloud/demo-gapsi/search?&query=\(parameters_name)", headers: headers)
            .responseData { response in
                
                switch response.result {
                       case .success(let value):
                           print(String(data: value, encoding: .utf8)!)
                        if let result = ResultModel.init(JSONString: String(data: value, encoding: .utf8)!) {
                            if !result.productsList.isEmpty && result.productsList.count > 0{
                                try! self.realm!.write{
                                    let products = self.realm?.objects(ProductModel.self)
                                    self.realm?.delete(products!)
                                    self.realm!.add(result.productsList)
                                }
                                self.delegate?.successSearch(list: result.productsList)
                            }else{
                                self.delegate?.errorSearch()
                            }
                        }else{
                            self.delegate?.errorSearch()
                        }
                       case .failure(let error):
                            self.delegate?.errorSearch()
                       }
                
            }
    }
    
    
}
