//
//  Post.swift
//  PostExplorer
//
//  Created by Bhushan on 01/10/25.
//

import Foundation

struct Post: Codable, Equatable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct PostItem: Identifiable, Equatable {
    var id: Int { post.id } 
    let post: Post
    var isFavorite: Bool = false
}
