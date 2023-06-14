//
//  HomeViewModel.swift
//  HellFlix
//
//  Created by Ayan Ansari on 25/04/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var nowPlayingData: [NowPlayingMoviesData] = []
    @Published var allPopularMovies: [PopularMoviesData] = []
    
    init() {
        getNowPlayingMovies()
        getPopularMovies()
    }
    
    private func getNowPlayingMovies() {
        NetworkManager.shared.callGetApi(apiEndPoint: .nowPlayingApiUrl,
                                         resultType: NowPlayingModel.self) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.nowPlayingData = data.results ?? []
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func getPopularMovies() {
        NetworkManager.shared.callGetApi(apiEndPoint: .popularMoviewUrl,
                                         resultType: PopularMoviesModel.self) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.allPopularMovies = data.results ?? []
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
