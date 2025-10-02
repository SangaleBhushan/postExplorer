//
//  SwiftUIView.swift
//  PostExplorer
//
//  Created by Bhushan on 01/10/25.
//

import SwiftUI

struct PostDetailView: View {
    
    let postItem: PostItem
    @ObservedObject var viewModel: PostsViewModel
    @State private var fadeIn = false
    var isfromFavorite: Int = 1
    
    var body: some View {
        headerView
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                Text(postItem.post.title.capitalized)
                    .font(.largeTitle)
                    .bold()
                    .opacity(fadeIn ? 1 : 0)
                    .animation(.easeIn(duration: 0.6), value: fadeIn)
                    .multilineTextAlignment(.center)
                
                Text(postItem.post.body)
                    .font(.body)
                    .opacity(fadeIn ? 1 : 0)
                    .animation(.easeIn.delay(0.2), value: fadeIn)
                    .multilineTextAlignment(.center)
                
                Button {
                      ///
                } label: {
                    Label(postItem.isFavorite ? "Favorite" : "UnFavorite",
                          systemImage: postItem.isFavorite ? "heart.fill" : "heart")
                    .padding()
                    .background(Capsule().fill(Color.red.opacity(0.2)))
                    .scaleEffect(postItem.isFavorite ? 1.2 : 1.0)
                }
                .animation(.spring(), value: postItem.isFavorite)
            }.padding()
             .cornerRadius(8)
             .overlay(
                RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1)
             ).padding(.horizontal,16)
        }.padding(.top)
        .onAppear {
            fadeIn = true
        }
    }
    private var headerView:some View{
        VStack(spacing:02){
            HStack(spacing: 0){
                Button {
                    withAnimation{
                        ScreenNavigation().redirectToScreen(nextView: ContentView(selectedTab:isfromFavorite))
                    }
                }label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 32,maxHeight: 32)
                        .padding(.leading,1)
                }
                Spacer()
                
                CustomLabelUI(text:"Post Details".uppercased(), font: .title.bold(), foregroundColor:.darkBlue).padding(.trailing,32)
                
                Spacer()
            }.frame(height: 72)
            Divider().background(.black).padding(.horizontal,-16)
        }.padding(.horizontal,16)
    }
}

