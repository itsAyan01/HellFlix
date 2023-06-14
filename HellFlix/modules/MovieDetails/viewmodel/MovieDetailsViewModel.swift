//
//  MovieDetailsViewModel.swift
//  HellFlix
//
//  Created by Ayan Ansari on 26/04/23.
//

import Foundation


class MovieDetailViewModel: ObservableObject {
    @Published var movieDetails: MovieDetailsModel?
    @Published var genreStr: String = ""

    
    init() {
        print("Initialised")
    }
    
    func getMovieDetailsBy(movieId: String) {
        NetworkManager.shared.callGetApi(apiEndPoint: .movieDetailUrl(movieId: movieId),
                                         resultType: MovieDetailsModel.self) { result in
            switch result {
            case .success(let data):
//                print("Movie Details \(data)")
                DispatchQueue.main.async { [weak self] in
                    self?.movieDetails = data
                    let isoCode = data.production_countries?.first?.iso_3166_1 ?? ""
                    self?.genreStr = isoCode + ","
                    + (self?.movieDetails?.genres?.compactMap { $0.name }.joined(separator: ", ") ?? "")
                }
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
}
