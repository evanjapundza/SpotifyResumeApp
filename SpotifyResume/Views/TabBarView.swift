//
//  TabView.swift
//  SpotifyResume
//
//  Created by Evan Japundza on 2/22/23.
//

import Foundation
import SwiftUI


struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Personal", systemImage: "house")
                    
                }
            LibraryView()
                .tabItem {
                    Label("Professional", systemImage: "book")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
        
    }
}
