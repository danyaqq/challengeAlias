//
//  NetworkService.swift
//  Alias
//
//  Created by Даня on 23.02.2022.
//

import Foundation

protocol JokeManagerDelegate {
    func didUpdateJoke(_ jokeManager: JokeManager, joke: Joke)
}

struct JokeManager {
    
    let jokeURL = "http://rzhunemogu.ru/RandJSON.aspx?CType=1"
    
    var delegate: JokeManagerDelegate?
    
    func performRequest(with jokeURL: String) {
        if let url = URL(string: jokeURL) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                
                if let safeData = data {
                    if let joke = self.parseJSON(safeData) {
                        self.delegate?.didUpdateJoke(self, joke: joke)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> Joke? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(Joke.self, from: weatherData)
            return decodeData
        } catch {
            return nil
        }
    }
}










class NetworkService{
    
    static let shared = NetworkService()
    
    let jokeURL = "http://rzhunemogu.ru/RandJSON.aspx?CType=1"
    
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
