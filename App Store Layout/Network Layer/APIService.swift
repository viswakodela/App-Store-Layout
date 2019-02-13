//
//  APIService.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/12/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let error = err {
                completion([], error)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let searchResults = try JSONDecoder().decode(SearchResults.self, from: data)
                completion(searchResults.results, nil)
            } catch {
                completion([], error)
            }
            }.resume()
        
    }
    
}
