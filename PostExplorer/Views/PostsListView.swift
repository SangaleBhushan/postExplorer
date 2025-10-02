//
//  PostsListView.swift
//  PostExplorer
//
//  Created by Bhushan on 01/10/25.
//

import SwiftUI

struct PostsListView: View {
    @StateObject var viewModel = PostsViewModel.shared
    @FocusState var isFocused: Bool
    
    var body: some View {
        ZStack{
            if viewModel.isLoading {
                LoaderView()
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .background(Color.black.opacity(0.3)).ignoresSafeArea()
            }
            VStack{
                headerView
                if viewModel.filteredPosts.count > 0{
                    listConent
                }else{
                    Spacer()
                    EmptyStateView()
                    Spacer()
                }
            }
        }.refreshable {
            await viewModel.fetchPosts()
        }.onAppear{
            Task{
                if viewModel.posts.isEmpty{
                    await viewModel.fetchPosts()
                }
            }
        }.overlay{
            if viewModel.isErrorPresent ?? false, !viewModel.isLoading{
                CommonErrorPopupView(primaryAction:{
                    Task{
                        viewModel.isErrorPresent = false
                        await viewModel.fetchPosts()
                    }
                }, secondaryAction:{
                    viewModel.isErrorPresent = false
                    
                })
            }
        }
    }
    private var headerView:some View{
        VStack(spacing: 4){
            VStack(spacing: 16){
            HStack(spacing: 0){
                Spacer()
                CustomLabelUI(text:"Posts".uppercased(), font: .title.bold(), foregroundColor:.darkBlue)
                Spacer()
            }.padding(.top,5)
            SearchBar(searchText:$viewModel.searchText , isFocused:$isFocused,placeholder: "Search Post By Title")
                .background(.white)
                .cornerRadius(8)
                .padding(.horizontal)
         }.frame(maxWidth: .infinity,maxHeight: 120)
            Divider().background(.black).padding(.horizontal,-16)
        }.background(.fafafa)
        
    }
    private var listConent:some View{
        ScrollView(showsIndicators: false){
                ForEach(viewModel.filteredPosts) { postItem in
                    VStack(spacing: 16){
                        CustomeCard(name: postItem.post.title, id: "\(postItem.post.userId)", isFavorite:postItem.isFavorite){
                            viewModel.toggleFavorite(for: postItem)
                        }.onTapGesture {
                            ScreenNavigation().redirectToScreen(nextView: PostDetailView(postItem: postItem, viewModel: viewModel,isfromFavorite: 0))
                        }
                    }
                }
        }.padding(.horizontal,16)
    }
}

