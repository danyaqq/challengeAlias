//
//  NetworkService.swift
//  Alias
//
//  Created by Даня on 23.02.2022.
//

import Foundation

protocol JokeManagerDelegate: AnyObject {
    func didUpdateJoke(_ jokeManager: JokeManager, joke: Joke)
}

class JokeManager {
    
    let jokeURL = "https://geek-jokes.sameerkumar.website/api?format=json"
    
    weak var delegate: JokeManagerDelegate?
    
    init(){
        performRequest(with: jokeURL)
    }
    
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
                        print(joke)
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
