//
//  WebApi.swift
//  TestPragma
//
//  Created by Pedro Alonso Daza B on 26/04/21.
//

import Foundation


enum Api {
    case getAllBreeds
    case getBreadsForSearch
    case getImageFromIdBrand
}

func getStringInfoPList(key: String) -> String {
    return Bundle.main.object(forInfoDictionaryKey: key) as? String ?? ""
}

func getApi(api: Api) -> String{
    switch api {
    case .getAllBreeds:
        let url = getStringInfoPList(key: "KURL_BASE") + "/v1/breeds?limit={limit}&page={page}&order=Desc"
        return url
    case .getBreadsForSearch:
        let url = getStringInfoPList(key: "KURL_BASE") + "/v1/images/search?breed_ids={idBread}&limit=10"
        return url
    case .getImageFromIdBrand:
        let url = getStringInfoPList(key: "KURL_BASE") + "/v1/images/{idImage}"
        return url
    default:
        return "/sites"
    }
}
