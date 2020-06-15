//
//  ManagerConnections.swift
//  FilmsApp
//
//  Created by camilo andres ibarra yepes on 7/06/20.
//  Copyright © 2020 camilo andres ibarra yepes. All rights reserved.
//

import Foundation
import RxSwift

class ManagerConnections {
    
    func getPopularMovies() -> Observable<[Movie]> {
        return Observable.create { observer in
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: Constans.URL.main+Constans.Endpoints.urlListMovies+Constans.apiKey)!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    do {
                        print("entra")
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(Movies.self, from: data)
                        print("movies", movies)
                        observer.onNext(movies.listOfMovies)
                    } catch let error {
                        observer.onError(error)
                        print("Error", error.localizedDescription)
                    }
                } else if response.statusCode == 401 {
                    print("Error 401")
                }
                observer.onCompleted()
            }.resume()
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
    
    func getDetailMovies() {
        
    }
}
