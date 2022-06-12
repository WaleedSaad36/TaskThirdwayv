//
//  Ex+UICollcetionView.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 11/06/2022.
//

import Foundation
import UIKit
extension UICollectionView {
    
    func registerNib<cell:UICollectionViewCell>(cell:cell.Type){
        let nibName = String(describing: cell)
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    func registerHeader<header:UICollectionReusableView>(header:header.Type){
        let nibName = String(describing: header)
        self.register(UINib(nibName: nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: nibName)
    }
}
