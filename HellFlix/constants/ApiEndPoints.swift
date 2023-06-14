//
//  ApiEndPoints.swift
//  HellFlix
//
//  Created by Ayan Ansari on 26/04/23.
//

import Foundation

enum ApiEndPoints {
    
    case nowPlayingApiUrl
    case latestMovies
    case popularMoviewUrl
    case movieDetailUrl(movieId: String)
    
    var url: String {
        switch self {
        case .nowPlayingApiUrl:
            return "https://api.themoviedb.org/3/movie/now_playing?api_key=ded69c36da0a080457821172bdd4c601&language=en-US&page=1"
        case .latestMovies:
            return "https://api.themoviedb.org/3/movie/latest?api_key=ded69c36da0a080457821172bdd4c601&language=en-US"
        case .popularMoviewUrl:
            return "https://api.themoviedb.org/3/movie/popular?api_key=ded69c36da0a080457821172bdd4c601&language=en-US&page=1"
        case .movieDetailUrl(let movieId):
            return "https://api.themoviedb.org/3/movie/\(movieId)?api_key=ded69c36da0a080457821172bdd4c601&language=en-US"
        }
    }
    
}
