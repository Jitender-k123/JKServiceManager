# JKService

A description of this package.

To call Service Manager just use like below code: 

let router = Router.getProductIds
var parameters: [String: String] {
    switch router {
    case .getSources:
        return ["page": "1",
                "access_token": accessToken]
    case .getProductIds:
        return ["page": "1",
                "collection_id": "68424466488",
                "access_token": accessToken]
    case .getProductInfo:
        return ["page": "1",
                "ids": "2759162243,2759143811",
                "access_token": accessToken]
    }
}

ServiceLayer().request(router: router, parameters: parameters) { (result: Result<[String : [ModelItem]], Error>) in
    switch result {
    case .success: print(result)
    case .failure: print(result)
    }
}

