//
//  SplashView.swift
//  PostExplorer
//
//  Created by Bhushan on 01/10/25.
//

import SwiftUI

struct SplashView: View {
    @State private var scale = 0.6
    @State private var opacity = 0.3
    @State private var showMainView = false
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                Image(systemName: "bolt.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.yellow)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                            scale = 1.2
                            opacity = 1.0
                        }
                    }
                
                Text("PostExplorer")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                    .opacity(opacity)
                    .padding(.top, 12)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                ScreenNavigation().redirectToScreen(nextView: ContentView())
            }
        }
    }
}

#Preview {
    SplashView()
}
