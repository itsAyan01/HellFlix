//
//  NowPlayingModel.swift
//  HellFlix
//
//  Created by Ayan Ansari on 25/04/23.
//

import Foundation


struct NowPlayingModel: Decodable {
    let dates: Dates?
    let page: Int?
    let results: [NowPlayingMoviesData]?
    let totalPages: Int?
    let totalResults: Int?
}

// MARK: - Dates
struct Dates: Decodable {
    let maximum: String?
    let minimum: String?
}

// MARK: - Result
struct NowPlayingMoviesData: Decodable, Identifiable {
    let adult: Bool?
    let backdrop_path: String?
    let genre_ids: [Int]?
    let id: Int?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
    
}
