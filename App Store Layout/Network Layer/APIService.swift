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
    
    /// This Function is used to fetch the results based on the SearchTerm
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
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
    
    func fetchApps(urlString: String, completion: @escaping (AppGroup?, Error?) -> ()) {
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let error = err {
                print(error.localizedDescription)
                completion(nil, error)
                return
            }
            guard let data = data else {return}
            let appGroup = try? JSONDecoder().decode(AppGroup.self, from: data)
            completion(appGroup, nil)
        }.resume()
    }
    
}
