//
//  PostsViewModel.swift
//  PostExplorer
//
//  Created by Bhushan on 01/10/25.
//

import Foundation
import SwiftUI

@MainActor
class PostsViewModel: ObservableObject {
    static let shared = PostsViewModel()
    private init() {
    }
    @Published var posts: [PostItem] = []
    @Published var searchText: String = ""{
        didSet{
            self.filterPosts1()
        }
    }
    @Published var isLoading: Bool = true
    @Published var isErrorPresent: Bool?
    @Published var filteredPosts:[PostItem] = []
    
    func filterPosts1() {
        if self.searchText.isEmpty {
            filteredPosts.removeAll()
            filteredPosts = posts
            return
        }
        filteredPosts.removeAll()
        filteredPosts = posts.filter { $0.post.title.localizedCaseInsensitiveContains(self.searchText) }
    }
    
    func fetchPosts() async {
        isLoading = true
        do {
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
            print(decodedPosts)
            let wrappedPosts = decodedPosts.map { post in
                PostItem(post: post, isFavorite: false)
            }
            
            self.posts = wrappedPosts
        } catch {
            isErrorPresent = true
        }
        filterPosts1()
        isLoading = false
    }
    
    func toggleFavorite(for post: PostItem) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                posts[index].isFavorite.toggle()
                filterPosts1()
            }
        }
    }
    
    var favoritePosts: [PostItem] {
        posts.filter { $0.isFavorite }
    }
}
