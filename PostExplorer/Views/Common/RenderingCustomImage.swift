//
//  customeImage.swift
//  PostExplorer
//
//  Created by Bhushan on 02/10/25.
//

import SwiftUI

struct RenderingCustomImage: View {
    let image : String
    let width : CGFloat
    let height: CGFloat
    let foregroundColor: Color
    init(inputImage:String, width: CGFloat, height: CGFloat, foregroundColor: Color) {
        self.image = inputImage
        self.width = width
        self.height = height
        self.foregroundColor = foregroundColor
    }
    var body: some View {
        Image(self.image)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(foregroundColor)
            .frame(width: width, height: height)
    }
}
