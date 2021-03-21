//
//  MainPresenter.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

class MainPresenter: BasePresenter{
    
    var delegate: MainDelegate?
    
    
    init(delegate : MainDelegate) {
        self.delegate = delegate
    }
    
    func getSearch(){
        let productsSearch = realm?.objects(ProductModel.self)
        var productList: [ProductModel] = []
        for result in productsSearch!{
            productList.append(result)
        }
        print(productList)
        self.delegate?.loadSearch(list: productList)
    }

}
