//
//  FavoritesView.swift
//  PostExplorer
//
//  Created by Bhushan on 01/10/25.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var viewModel = PostsViewModel.shared
    
    var body: some View {
        VStack{
            headerView
            if viewModel.favoritePosts.isEmpty{
                Spacer()
                EmptyStateView(message: "There is no favorite post")
                Spacer()
            }else{
                ScrollView(showsIndicators: false){
                    ForEach(viewModel.favoritePosts) { postItem in
                        VStack(alignment: .leading) {
                            CustomeCard(name: postItem.post.title, id:"\(postItem.post.userId)" , isFavorite:postItem.isFavorite){
                                //
                            }.onTapGesture {
                                ScreenNavigation().redirectToScreen(nextView:PostDetailView(postItem: postItem, viewModel:viewModel,isfromFavorite: 1))
                            }
                        }.padding(.horizontal,16)
                    }
                }
            }
        }
    }
    private var headerView:some View{
        VStack(spacing: 24){
            HStack(spacing: 0){
                Spacer()
                CustomLabelUI(text:"Favorites Posts".uppercased(), font: .title.bold(), foregroundColor:.darkBlue)
                Spacer()
            }.padding(.top,5)
                .frame(maxWidth: .infinity,maxHeight: 72)
            Divider().background(.black).padding(.horizontal,-16)
        }.background(.fafafa)
        
    }
}

