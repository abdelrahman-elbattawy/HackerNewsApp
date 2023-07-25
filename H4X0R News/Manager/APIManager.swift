//
//  APIManager.swift
//  H4X0R News
//
//  Created by Aboody on 25/07/2023.
//

import Foundation

class APIManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData() {
        guard let url = URL(string: Constants.API_URL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(Results.self, from: data)
                
                DispatchQueue.main.async {
                    self.posts = results.hits
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
