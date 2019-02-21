//
//  APIService.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/12/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import Foundation

class APIService {
    
    ///Singleton for the APIService
    static let shared = APIService()
    
    /// These Functions is used to fetch the results based on the SearchTerm
    func fetchApps(searchTerm: String, completion: @escaping (SearchResults?, Error?) -> ()) {
        fetchGenericJSONFetch(urlString: "https://itunes.apple.com/search?term=\(searchTerm)&entity=software", completion: completion)
    }
    
    func fetchApps(urlString: String, completion: @escaping (AppGroup?, Error?) -> ()) {
        fetchGenericJSONFetch(urlString: urlString, completion: completion)
    }
    
    func fetchSocialAppsForHeader(urlString: String, completion: @escaping ([HeaderModel]?, Error?) -> ()){
        fetchGenericJSONFetch(urlString: urlString, completion: completion)
    }
    
    
    func fetchGenericJSONFetch<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        
        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { (data, resp, err) in

            if let error = err {
                print("Failed fetching the data:", error)
                completion(nil, error)
            }
            guard let data = data else {return}
            let results = try? JSONDecoder().decode(T.self, from: data)
            completion(results, nil)
        }.resume()
    }
    
}
