//
//  SwiftUIView.swift
//  PostExplorer
//
//  Created by Bhushan on 02/10/25.
//

import SwiftUI

struct CustomHorizontalButton:View {
    let buttonText: String
        let buttonTextColor: Color
        let buttonBackgroundColor: Color
        let strokeColor: Color
        let action: () -> Void
        let hight: CGFloat
        
    init(buttonText: String,buttonTextColor: Color,buttonBackgroundColor: Color,strokeColor: Color,hight: CGFloat = 56,action: @escaping () -> Void) {
            
            self.buttonText = buttonText
            self.buttonTextColor = buttonTextColor
            self.buttonBackgroundColor = buttonBackgroundColor
            self.strokeColor = strokeColor
            self.action = action
            self.hight = hight
        }
    var body: some View {
        Button(action:action){
            CustomLabelUI(text:buttonText, font: .title3.bold(), foregroundColor: buttonTextColor)
                .frame(maxWidth: .infinity, maxHeight:hight)
                .background(buttonBackgroundColor)
                .cornerRadius(8)
                .overlay{
                    RoundedRectangle(cornerRadius: 8).stroke(strokeColor,lineWidth: 1)
            }
        }
    }
}


