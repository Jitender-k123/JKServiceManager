//
//  NetworkManager.swift
//  
//
//  Created by Jitender Kumar on 11/3/21.
//

import Foundation
public class NetworkManager {
   public init() { }
    public func request<T: Codable>(router: Router,
                                    parameters: [String: String],
                                    completion: @escaping (Result<[String: [T]], Error>) -> ()) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = queryItems(dictionary: parameters)
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let err = error {
                completion(.failure(err))
                print(err.localizedDescription)
                return
            }
            guard response != nil, let data = data else {
                return
            }
            let responseObject = try! JSONDecoder().decode([String: [T]].self, from: data)
            DispatchQueue.main.async {
                completion(.success(responseObject))
            }
        }
        dataTask.resume()
    }
    func queryItems(dictionary: [String:String]) -> [URLQueryItem] {
        return dictionary.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
    }
}
