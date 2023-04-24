//
//  CatRepository.swift
//  TestPragma
//
//  Created by Pedro Alonso Daza B on 26/04/21.
//

import Foundation

class CatRepository {
    static func getListCats(limit: Int, page: Int, ok: @escaping (([CatModel]) -> Void), error: @escaping ((String) -> Void)) {
        
        
        let newUrl = getApi(api: .getAllBreeds).replacingOccurrences(of: "{limit}", with: "\(limit)").replacingOccurrences(of: "{page}", with: "\(page)")
        
        ApiRest().getApiData(url: newUrl, params: nil, headers: ["x-api-key": "bda53789-d59e-46cd-9bc4-2936630fde39"], type: [CatModel].self, correctStatus: 200) { succes, listCatModel, error1 in
            DispatchQueue.main.async {
                if succes {
                    if let listCatModel = listCatModel {
                        ok(listCatModel)
                    } else {
                        error("wrong")
                    }
                    
                } else {
                    error(error1 ?? "")
                }
            }
            
        }

    }
    
    static func getDetailsOfCat(idBread: String, ok: @escaping (([DetailCatElement]) -> Void), error: @escaping ((String) -> Void)) {
        let newUrl = getApi(api: .getBreadsForSearch).replacingOccurrences(of: "{idBread}", with: "\(idBread)")
        
        ApiRest().getApiData(url: newUrl, params: nil, headers: ["x-api-key": "bda53789-d59e-46cd-9bc4-2936630fde39"], type: [DetailCatElement].self, correctStatus: 200) { succes, detailCatElement, error1 in
            DispatchQueue.main.async {
                if succes {
                    if let detailCatElement = detailCatElement {
                        ok(detailCatElement)
                    } else {
                        error("wrong")
                    }
                } else {
                    error(error1 ?? "")
                }
            }
            
        }
    }
    
    static func getImageOfBrandCat(id: String, ok: @escaping ((Image) -> Void), error: @escaping ((String) -> Void)) {
        let newUrl = getApi(api: .getImageFromIdBrand).replacingOccurrences(of: "{idImage}", with: "\(id)")
        
        ApiRest().getApiData(url: newUrl, params: nil, headers: ["x-api-key": "bda53789-d59e-46cd-9bc4-2936630fde39"], type: Image.self, correctStatus: 200) { succes, detailCatElement, error1 in
            if succes {
                if let detailCatElement = detailCatElement {
                    ok(detailCatElement)
                } else {
                    error("wrong")
                }
            } else {
                error(error1 ?? "")
            }
        }
    }
}
