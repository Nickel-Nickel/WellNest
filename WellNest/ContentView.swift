//
//  ContentView.swift
//  WellNest
//
//  Created by csuftitan on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /* TabView is a SwiftUI container view used to
        display multiple views as tabs */
        TabView {
            HomeView().tabItem{
                    //SF Symbols are used for the tab's icon
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
