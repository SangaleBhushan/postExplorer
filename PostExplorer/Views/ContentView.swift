//
//  ContentView.swift
//  PostExplorer
//
//  Created by Bhushan on 01/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PostsViewModel.shared
    @State  var selectedTab = 0
    var body: some View {
        ZStack(alignment: .bottom){
            Rectangle()
                .fill(.fafafa)
                    .frame(height: 70) // tab bar height
                    .ignoresSafeArea(edges: .bottom)
            TabView(selection: $selectedTab) {
                
                PostsListView()
                    .tabItem {
                        Label("Posts", systemImage: "list.bullet")
                    }.tag(0)
                
                
                FavoritesView(viewModel:viewModel )
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }.tag(1)
                
            }
        }
    }
}




#Preview {
    ContentView()
}
