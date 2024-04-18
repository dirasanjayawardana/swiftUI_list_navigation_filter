//
//  MainView.swift
//  EmojiSearch
//
//  Created by MACBOOK PRO on 18/04/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {Label("Emoji", systemImage: "ev.plug.dc.nacs")}
                .badge(2)
            
            Text("Map View")
                .tabItem {Label("Map", systemImage: "binoculars")}
            
            Text("Setting Page")
                .tabItem {Label("Settings", systemImage: "gear")}
            
            Text("Map View")
                .tabItem {Label("Map", systemImage: "binoculars")}
            
            Text("Setting Page")
                .tabItem {Label("Settings", systemImage: "gear")}
            
            Text("Setting Page")
                .tabItem {Label("Settings", systemImage: "gear")}
        }
        .tint(.primary)
    }
}

#Preview {
    MainView()
}
