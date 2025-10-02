//
//  CustomeCard.swift
//  PostExplorer
//
//  Created by Bhushan on 02/10/25.
//

import SwiftUI

struct CustomeCard: View {
    var name : String
    var id : String
    var isFavorite:Bool
    var togleAction:()->()
    var body: some View {
        HStack{
            VStack(alignment: .leading,spacing: 16){
                CustomLabelUI(text: "\(name)", font:.headline, foregroundColor: .darkBlue)
                CustomLabelUI(text: "UserID: \(id)", font:.subheadline, foregroundColor: .darkBlue)
            }
            Spacer()
            Image(systemName:isFavorite ? "heart.fill" : "heart")
                .foregroundColor(.red)
                .scaleEffect(isFavorite ? 1.3 : 1.0)
                .animation(.easeInOut, value: isFavorite)
                .frame(width: 40,height: 40)
                .onTapGesture {
                    togleAction()
                }
            
        }.padding(.horizontal, 13)
         .frame(height: 100)
         .cornerRadius(8)
         .overlay(
            RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1)
        )
    }
}

