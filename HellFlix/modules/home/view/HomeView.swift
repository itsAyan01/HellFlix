//
//  HomeView.swift
//  HellFlix
//
//  Created by Ayan Ansari on 25/04/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @StateObject var vm: HomeViewModel
    
    init(vm: HomeViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                topBar
                ScrollView {
                    VStack {
                        nowPlayingMoviesList
                            .padding()
                        
                        popularMoviesList
                            .padding()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// Views
extension HomeView {
    
    private var topBar: some View {
        HStack {
            Image.hameBurgerIcon
                .font(.title2)
            
            Spacer()
            
            Image.magnifyingGlass
                .font(.title2)
        }
        .foregroundColor(.white)
        .padding()
    }
    
    private var nowPlayingMoviesList: some View {
        VStack(alignment: .leading) {
            Text(AppStrings.nowPlaying.localizedString)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(vm.nowPlayingData) { movie in
                        NavigationLink {
                            MovieDetailView(
                                 movieId: String(movie.id ?? 0)
                            )
                        } label: {
                            getNowPlayingRow(movie: movie)
                        }
                    }
                }
            }
        }
    }
    
    private func getNowPlayingRow(movie: NowPlayingMoviesData) -> some View {
        VStack {
            WebImage(url: URL(string: ImageStrings.baseUrl.rawValue + (movie.poster_path ?? "")))
                .resizable()
                .placeholder {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.gray.opacity(0.2))
                        
                        ProgressView()
                    }
                    .frame(width: 100, height: 150)
                }
                .scaledToFill()
                .frame(width: 100, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
    
    private var popularMoviesList: some View {
        VStack(alignment: .leading) {
            Text(AppStrings.popular.localizedString)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(vm.allPopularMovies) { movie in
                        NavigationLink {
                            MovieDetailView(movieId: String(movie.id ?? 0))
                        } label: {
                            getPopularMoviesRow(movie: movie)
                        }
                    }
                }
            }
        }
    }
    
    private func getPopularMoviesRow(movie: PopularMoviesData) -> some View {
        VStack {
            WebImage(url: URL(string: ImageStrings.baseUrl.rawValue + (movie.poster_path ?? "")))
                .resizable()
                .placeholder {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.gray.opacity(0.2))
                        
                        ProgressView()
                    }
                    .frame(width: 100, height: 150)
                }
                .scaledToFill()
                .frame(width: 100, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: HomeViewModel())
    }
}
