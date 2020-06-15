//
//  Constans.swift
//  FilmsApp
//
//  Created by camilo andres ibarra yepes on 7/06/20.
//  Copyright © 2020 camilo andres ibarra yepes. All rights reserved.
//

import Foundation

struct Constans {
    static let apiKey = "?api_key=09bc30176dd825e3dad5b414ac08ba5d"
    
    struct URL {
        static let main = "https://api.themoviedb.org/"
        static let urlImages = "https://image.tmdb.org/t/p/w200"
    }
    
    struct Endpoints {
        static let urlListMovies = "3/movie/popular"
        static let urlDetailsMovie = "3/movie/"
    }
}
