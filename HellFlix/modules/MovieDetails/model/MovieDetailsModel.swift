//
//  MovieDetailsModel.swift
//  HellFlix
//
//  Created by Ayan Ansari on 26/04/23.
//

import Foundation

struct MovieDetailsModel: Decodable {
    let adult: Bool?
    let backdrop_path: String?
    let belongs_to_collection: BelongsToCollection?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdb_id: String?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let production_countries: [ProductionCountry]?
    let release_date: String?
    let revenue: Int?
    let runtime: Int?
//    let spokenLanguages: [SpokenLanguage]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
}

struct BelongsToCollection: Decodable {
    let id: Int?
    let name: String?
    let poster_path: String?
    let backdrop_path: String?
}

struct Genre: Decodable, Identifiable {
    let id: Int?
    let name: String?
}

struct ProductionCountry: Decodable {
    let iso_3166_1: String
    let name: String
}
