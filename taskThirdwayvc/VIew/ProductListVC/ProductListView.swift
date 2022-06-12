//
//  ProductListView.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 10/06/2022.
//

import UIKit

class ProductListView: UIView {

    //MARK:- outLets
    @IBOutlet weak var collectionView: UICollectionView!

    //MARK:- AnimationCollectionView
    func reloadAnimationCollectionView(cell:UICollectionViewCell){
    cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        cell.alpha = 0
    UIView.animate(withDuration: 0.35, delay: 0, options: UIView.AnimationOptions.allowUserInteraction, animations: {
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
        }, completion: nil)
      
    UIView.animate(withDuration: 0.45, delay: 0, options: UIView.AnimationOptions.allowUserInteraction, animations: {
            cell.alpha = 1
        }, completion: nil)
    }
}
