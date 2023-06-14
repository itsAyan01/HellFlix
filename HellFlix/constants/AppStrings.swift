//
//  AppStrings.swift
//  HellFlix
//
//  Created by Ayan Ansari on 26/04/23.
//

import Foundation

enum AppStrings: String {
    
    case nowPlaying = "Now Playing"
    case popular = "Popular"
    
    
    var localizedString: String {
        self.rawValue
    }
}
