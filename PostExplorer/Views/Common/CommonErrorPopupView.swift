//
//  CommoError.swift
//  PostExplorer
//
//  Created by Bhushan on 02/10/25.
//

import SwiftUI

struct CommonErrorPopupView: View {
    var title: String = "Error"
    var message: String = "Something went Wrong please check Network Connection , if network is fine try again later or retry"
    var buttonText: String = "Retry"
    var secondButtonText: String = "Cancel"
    var primaryAction: (() -> Void)? = nil
    var secondaryAction: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()
            VStack(alignment: .leading, spacing: 16) {
                CustomLabelUI(
                    text: title,
                    font: .title2.bold(),
                    foregroundColor: .black
                )
                
                CustomLabelUI(
                    text: message,
                    font: .title3,
                    foregroundColor: .black
                )
                VStack(spacing:16){
                    CustomHorizontalButton(
                        buttonText: buttonText,
                        buttonTextColor: .white,
                        buttonBackgroundColor:.mamey,
                        strokeColor: .mamey,
                        hight: 48
                    ) {
                        if let primaryAction = primaryAction {
                            primaryAction()
                        }
                        
                    }
                    
                    CustomHorizontalButton(
                        buttonText:secondButtonText,
                        buttonTextColor: .darkBlue,
                        buttonBackgroundColor: .white,
                        strokeColor: .gray,
                        hight: 48
                    ) {
                        if let secondaryAction =  secondaryAction {
                            secondaryAction()
                        }
                    }
                }.padding(.top,8)
                    .padding(.horizontal,13.5)
            }
            .padding(24)
            .background(Color.white)
            .cornerRadius(24)
            .shadow(radius: 10)
            .padding(.horizontal, 16)
        }
    }
}


