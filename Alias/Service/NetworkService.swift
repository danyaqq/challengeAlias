//
//  NetworkService.swift
//  Alias
//
//  Created by Даня on 23.02.2022.
//

import Foundation

class NetworkService{
    
    static let shared = NetworkService()
    
    private init() {}
    
    func getDataFromAPI<T: Decodable>(url: String, completion: @escaping(T) -> Void){
        guard let url = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let data = data else {
                return
            }

            do{
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData)
            } catch let err{
                print(err.localizedDescription)
            }
        }
        task.resume()
    }
}
