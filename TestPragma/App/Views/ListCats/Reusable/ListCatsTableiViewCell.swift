//
//  ListCatsTableiViewCell1.swift
//  TestExito
//
//  Created by Pedro Alonso Daza B on 16/02/21.
//

import Foundation
import UIKit
import URLImage
import SkeletonView
class ListCatsTableiViewCell: UITableViewCell{
    @IBOutlet weak var generalView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var contryLabel: UILabel!
    @IBOutlet weak var smartLabel: UILabel!
    
    var detail: ((CatModel) -> Void)?
    var catModel: CatModel?
    func setData(catModel: CatModel, detail: @escaping ((CatModel) -> Void)) {
        self.detail = detail
        self.catModel = catModel
        
        guard let nameCat = catModel.name else {return}
        guard let origeCat = catModel.origin else {return}
        guard let temperamentCat = catModel.temperament else {return}
        
        CatRepository.getImageOfBrandCat(id: catModel.reference_image_id ?? "") { [weak self] imageData in
            
            DispatchQueue.main.async {
                guard let self = self else {return}
                guard let urlImage = URL(string: imageData.url ?? "") else {return}
                self.catImageView.load(url: urlImage)
            }
            
        } error: { error in
            
        }

        
        titleLabel.text = nameCat
        contryLabel.text = origeCat
        smartLabel.text = temperamentCat
        
        moreLabel.text = "More.."
        
    }
    
    @IBAction func moreDatailsPressed(_ sender: UIButton) {
        if let cat = self.catModel{
            detail?(cat)
        }
        
    }
    
    func showSkeletor() {
        //let dddd = self.catImageView
        self.catImageView.showGradientSkeleton()
    }
    
    func hideSkeletor(){
        self.catImageView.hideSkeleton()
    }
    
}
