//
//  SearchBar.swift
//  PostExplorer
//
//  Created by Bhushan on 01/10/25.
//

import SwiftUI

struct SearchBar:View {
    @Binding var searchText: String
    @FocusState.Binding  var isFocused:Bool
    var placeholder : String = ""
    var body: some View {
        HStack {
            RenderingCustomImage(inputImage: "search_icon", width: 24, height: 24, foregroundColor: .mamey).padding(.leading, 12).padding(.trailing,4)
            TextField(placeholder,text: $searchText).foregroundColor(.darkBlue)
                .disableAutocorrection(true)
                .focused($isFocused)
            if !searchText.isEmpty && isFocused {
                Image("ic_delete")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.orange)
                    .padding(.trailing, 12)
                    .onTapGesture {
                        withAnimation {
                            searchText = ""
                            isFocused = false
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 42)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isFocused ? Color.orange : .black, lineWidth: 1.5)
        )
    }
}


