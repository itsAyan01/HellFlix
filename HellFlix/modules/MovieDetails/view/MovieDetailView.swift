//
//  MovieDetailView.swift
//  HellFlix
//
//  Created by Ayan Ansari on 26/04/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var movieDetailViewModel = MovieDetailViewModel()
    let movieId: String
    
    var body: some View {
        ZStack(alignment: .top) {
            
            backgroundImage
            
            contentOnScrollView
            
            backBtn
        }
    }
    
}

extension MovieDetailView {
    
    private var backgroundImage: some View {
        ZStack(alignment: .top) {
            Color.black
                .ignoresSafeArea()
            
            WebImage(url: URL(string: ImageStrings.baseUrl.rawValue + (movieDetailViewModel.movieDetails?.poster_path ?? "")))
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
                .ignoresSafeArea()
                .opacity(0.2)
        }
    }
    
    private var backBtn: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image.backArrow
                    .font(.title3)
                    .padding(.bottom, 8)
                    .contentShape(Rectangle())
                    .foregroundColor(.white)
            }
            
            Spacer()

        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.black.opacity(0.4))
    }
    
    private var contentOnScrollView: some View {
        VStack {
            ScrollView {
                Rectangle()
                    .fill(.blue.opacity(0.01))
                    .hidden()
                    .frame(height: 48)
                
                if let data = movieDetailViewModel.movieDetails {
                    VStack(alignment: .leading) {
                        TextWithAttributes(text: data.original_title ?? "",
                                           font: .title2,
                                           fontWeight: .bold,
                                           color: .white)
                        .lineLimit(2)
                        
                        HStack(alignment: .top) {
                            WebImage(url: URL(string: ImageStrings.baseUrl.rawValue + (data.poster_path ?? "")))
                                .resizable()
                                .placeholder {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(.gray.opacity(0.2))
                                            .frame(width: 120, height: 180)
                                        
                                        ProgressView()
                                    }
                                }
                                .scaledToFill()
                                .frame(width: 120, height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(color: .gray.opacity(0.6),
                                        radius: 8,
                                        x: 0, y: 0)
                            
                            VStack(alignment: .leading) {
                                TextWithAttributes(text: movieDetailViewModel.genreStr,
                                                   font: .headline,
                                                   fontWeight: .bold,
                                                   color: .white)
                                
                                HStack(spacing: 12) {
                                    Circle()
                                        .strokeBorder(lineWidth: 2, antialiased: true)
                                        .foregroundColor(.yellow)
                                        .frame(width: 48, height: 48)
                                        .overlay(alignment: .center) {
                                            TextWithAttributes(
                                                text: String(format: "%.1f", data.vote_average ?? 0),
                                                font: .headline,
                                                fontWeight: .medium,
                                                color: .white
                                            )
                                        }
                                    
                                    Rectangle()
                                        .strokeBorder(lineWidth: 2, antialiased: true)
                                        .foregroundColor(.green)
                                        .frame(width: 42, height: 42)
                                        .overlay(alignment: .center) {
                                            TextWithAttributes(
                                                text: (data.original_language ?? "EN").uppercased(),
                                                font: .headline,
                                                fontWeight: .medium,
                                                color: .white
                                            )
                                        }
                                }
                                
                                VStack(alignment: .leading, spacing: 14) {
                                    greenAndWhiteText(heading: "Status",
                                                      value: data.status ?? "")
                                    greenAndWhiteText(heading: "Revenue",
                                                      value: Double(data.revenue ?? 0).convertIntoDollars())
                                }
                                
                            }
                            .padding(.horizontal,8)
                            
                            //for align the view leading
                            Spacer()
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 200)
                    .padding()
                }
            }
        }
        .onAppear {
            movieDetailViewModel.getMovieDetailsBy(movieId: movieId)
        }
        .navigationBarHidden(true)
    }
    
    
    private func greenAndWhiteText(heading: String, value: String) -> some View {
        VStack(alignment: .leading) {
            TextWithAttributes(text: heading,
                               font: .caption,
                               fontWeight: .light,
                               color: .white)
            
            TextWithAttributes(text: value,
                               font: .caption,
                               fontWeight: .light,
                               color: .green)
        }
    }
    
    
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieId: "849869")
    }
}
