//
//  ProductListViewModel.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 11/06/2022.

import Foundation
import Network
import UIKit
protocol ProductListVMProtocol:class{
    // FetchData From API
    func fetchProductListAPI()
    func getProductListItem(for item:Int) -> ProductListResponse
    func getProductListCount() -> Int
    // FetchData From CoreData
    func fetchProductsFromCoreData()
    func getItemListCoreData(for item:Int) -> ProductList?
    func getCountListCoreData() -> Int
    func saveProductsDetails()

    // Check on Connections
    func checkChooseFetchingData()
    func checkInternetConnection() -> Bool
    func checkStateCallItem(item:Int) -> Any
    func checkStateCount() -> Int
}
class ProductListViewModel{

    //MARK:- Private Properties
    private var view:ProductListVCProtocol?
    private var productListArray:[ProductListResponse] = [ProductListResponse]()
    private var listProductCoreData:[ProductList]?
    private var flagCheckConnection:Bool = false
    
    //MARK:- initialization ViewModel
    init(view:ProductListVCProtocol) {
        self.view = view
    }
}

extension ProductListViewModel:ProductListVMProtocol{
    // FetchData From API
    
    func getProductListItem(for item: Int) -> ProductListResponse {
            return productListArray[item]
    }
    
    func getProductListCount() -> Int {
        return productListArray.count
    }
    
    func fetchProductListAPI(){
        guard let url = URL(string: URLs.base) else {return}
        let session = URLSession.shared.dataTask(with: url) { (data,response,error) in
            do{
                if let data = data {
                    let result = try JSONDecoder().decode(ProductListRes.self, from: data)
                    DispatchQueue.main.async {
                        self.productListArray += result
                        self.view?.reloadCollectionView()
                    }
                    self.saveProductsDetails()
                }
            }catch(let error){
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    // FetchData From CoreData
    func fetchProductsFromCoreData() {
        guard let data = CoreDataHelper.fetchDataProducts() else {return}
        self.listProductCoreData = data
    }
    
    func getItemListCoreData(for item:Int) -> ProductList? {
        return listProductCoreData?[item]
    }
    
    func getCountListCoreData() -> Int {
        return listProductCoreData?.count ?? 0
    }
    
    func saveProductsDetails(){
        productListArray.forEach({ result in
            guard let  image = view?.convertURLImageToData(urls: result.image?.url ?? "" ) else {return }
            CoreDataHelper.saveData(id: result.id ?? 0 , image: image , price: result.price ?? 0 , description: result.productDescription ?? "" , height: result.image?.height ?? 0 , width: result.image?.width ?? 0 )
        })
    }
    
    // Check on connection

   
    func checkInternetConnection() -> Bool{
        if !NetWorkMonitor.shared.isConnection{
            //self.view?.showAlert()
            self.flagCheckConnection = true
            return true
        }
        return false
    }
    
    func checkStateCallItem(item:Int) -> Any{
        if checkInternetConnection() == true {
            return  self.listProductCoreData?[item] ?? [listProductCoreData]
        }else{
            return self.productListArray[item]
        }
    }
    func checkStateCount() -> Int {
        if checkInternetConnection() == true {
            
            return self.listProductCoreData?.count ?? 0
        }else{
            return self.productListArray.count
        }
    }
    func checkChooseFetchingData(){
        if flagCheckConnection == true {
            fetchProductsFromCoreData()
        }else{
            self.fetchProductListAPI()
        }
    }
}
