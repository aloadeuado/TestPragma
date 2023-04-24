//
//  DetailCatViewModel.swift
//  TestPragma
//
//  Created by Pedro Alonso Daza B on 26/04/21.
//

import Foundation
class DetailCatViewModel {
    var detailCatViewModelDelegate: DetailCatViewModelDelegate?

    init(detailCatViewModelDelegate: DetailCatViewModelDelegate) {
        self.detailCatViewModelDelegate = detailCatViewModelDelegate
    }
    
    func getDetailCat(idBread: String) {
        CatRepository.getDetailsOfCat(idBread: idBread) { [weak self] (detailCats) in
            guard let self = self else {return}
            if !detailCats.isEmpty {
                self.detailCatViewModelDelegate?.successgetListCats(succesGetCat: detailCats)
            } else {
                self.detailCatViewModelDelegate?.error(error: TextConstants().WS_ERROR_NO_DATA)
            }
            
        } error: { (err) in
            self.detailCatViewModelDelegate?.error(error: err)
        }

    }
}

protocol DetailCatViewModelDelegate {
    func successgetListCats(succesGetCat listCats: [DetailCatElement])
    func error(error: String)
}
