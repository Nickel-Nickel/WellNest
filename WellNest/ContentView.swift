//
//  ContentView.swift
//  WellNest
//
//  Created by csuftitan on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            MoodView().tabItem{
                Image(systemName: "face.smiling")
                Text("Mood Logger")
            }
            AccountView().tabItem{
                Image(systemName: "bird")
                Text("Account")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
