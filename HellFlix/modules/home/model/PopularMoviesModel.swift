//
//  LatestMoviesModel.swift
//  HellFlix
//
//  Created by Ayan Ansari on 26/04/23.
//

import Foundation

struct PopularMoviesModel: Codable {
    let page: Int?
    let results: [PopularMoviesData]?
    let totalPages: Int?
    let totalResults: Int?
}

// MARK: - Genre
struct PopularMoviesData: Codable, Identifiable {
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
