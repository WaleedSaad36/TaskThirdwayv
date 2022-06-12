//
//  ProductListCell.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 11/06/2022.
//

import UIKit

class ProductListCell: UICollectionViewCell {

    //MARK:- private properties
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUICell()
    }
    
    //MARK:- Configration Data Cell
    func configrationCell(data:ProductListResponse){
        self.image.loadImage(with: data.image?.url ?? "" )
        self.descriptionLbl.text = data.productDescription
        self.priceLbl.text = String(data.price ?? 0 ).currencyFormatting()
        self.image.frame.size = CGSize(width: CGFloat(data.image?.width ?? 0) , height: CGFloat(data.image?.height ?? 0))
    }
    
    func configerCellOnCoreData(data:ProductList){
        self.image.image  = UIImage(data: data.image ?? Data())
        self.descriptionLbl.text = data.descriptionProduct
        self.priceLbl.text = String(data.price).currencyFormatting()
    }
    //MARK:- setupUICell
    private func setupUICell(){
        layoutIfNeeded()
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        self.image.translatesAutoresizingMaskIntoConstraints = false
        contentView.sizeToFit()
        
    }
}
