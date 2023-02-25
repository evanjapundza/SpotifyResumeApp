//
//  ContentView.swift
//  SpotifyResume
//
//  Created by Evan Japundza on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
