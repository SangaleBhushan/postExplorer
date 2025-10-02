//
//  file.swift
//  PostExplorer
//
//  Created by Bhushan on 01/10/25.
//

import SwiftUI

struct CustomLabelUI: View{
    var text : String
    var font : Font
    var foregroundColor : Color
    
    init(text: String, font: Font, foregroundColor: Color){
        self.text = text
        self.font = font
        self.foregroundColor = foregroundColor
    }
    
    var body: some View{
        Text(text)
            .font(font)
            .foregroundColor(foregroundColor)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
    }
}

