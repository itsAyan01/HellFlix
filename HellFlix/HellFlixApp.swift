//
//  HellFlixApp.swift
//  HellFlix
//
//  Created by Ayan Ansari on 25/04/23.
//

import SwiftUI

@main
struct HellFlixApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView(vm: HomeViewModel())                
            }
        }
    }
}
