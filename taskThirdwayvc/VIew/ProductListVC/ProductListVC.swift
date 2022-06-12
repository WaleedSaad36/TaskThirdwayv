//
//  ProductListVC.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 10/06/2022.
//

import UIKit
import Network

protocol ProductListVCProtocol:class {
    func reloadCollectionView()
    func showAlert()
    func convertURLImageToData(urls:String) -> Data
}

class ProductListVC: UIViewController {
    //MARK:- OutLets
    @IBOutlet var productListView: ProductListView!
    private var viewModel:ProductListVMProtocol?
    
    
    //MARK:- LiftCycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel =  ProductListViewModel(view: self)
        viewModel?.checkInternetConnection()
        productListView.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.viewModel?.checkChooseFetchingData()
        configerCollectionView()

    }
    //MARK:- configrationCollectionView + RegisterNib
    private func configerCollectionView(){
        self.productListView.collectionView.delegate = self
        self.productListView.collectionView.dataSource = self
        self.productListView.collectionView.registerNib(cell: ProductListCell.self)
    }
}
//MARK:- conform Protocol ViewController
extension ProductListVC:ProductListVCProtocol{
    func showAlert() {
        let alert = UIAlertController(title: "no Internet ", message: "The App Requiers Wifi or celluar", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            NSLog("the \"ok\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func reloadCollectionView() {
        self.productListView.collectionView.reloadData()
    }
}

//MARK:- Conform Delegate Protocol
extension ProductListVC : UICollectionViewDelegate{
    
}
//MARK:- Conform DataSource Protocol
extension ProductListVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel?.checkStateCount() ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductListCell", for: indexPath) as? ProductListCell else {return UICollectionViewCell()}
       
        if viewModel?.checkInternetConnection() == true {
            guard let resultCoreData = viewModel?.getItemListCoreData(for: indexPath.item) else {return UICollectionViewCell()}
            cell.configerCellOnCoreData(data: resultCoreData)
        }else{
           
            guard let data = viewModel?.getProductListItem(for: indexPath.item) else {return UICollectionViewCell()}
            cell.configrationCell(data: data)
        }
        
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let data = viewModel?.getProductListCount() else {return}
        let lastItem = data-1
        if indexPath.item >= lastItem{
            viewModel?.fetchProductListAPI()
        }
        productListView.reloadAnimationCollectionView(cell: cell)
    }
}
//MARK:- Conform UICollectionViewDelegateFlowLayout
extension ProductListVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 10) / 2
        return CGSize(width: size, height: 350 )
    }
    
}
