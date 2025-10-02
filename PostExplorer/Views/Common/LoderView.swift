//
//  LoderView.swift
//  PostExplorer
//
//  Created by Bhushan on 01/10/25.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        VStack(spacing:20.5){
            LoadingAnimationView(color: .mamey,width: 75, height: 75, lineWidth:4)
            CustomLabelUI(text: "Fetcing Posts ..!", font: .custom("Inter-Medium", size: 18), foregroundColor: .gray)
                .multilineTextAlignment(.center)
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
         .edgesIgnoringSafeArea(.all)
    
    }
}
struct LoadingAnimationView: View {
    
    @State private var isCircleRotating = true
    @State private var animateStart = false
    @State private var animateEnd = true
    var color: Color
    @State var width = CGFloat()
    @State var height = CGFloat()
    @State var lineWidth = CGFloat()
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: lineWidth)
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: animateStart ? 1/3 : 1/9, to: animateEnd ? 2/5 : 1)
                .stroke(.mamey, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(isCircleRotating ? -360 : 0))
                .frame(width: width, height: height)
                .onAppear() {
                    performOnLoadingViewAppear()
                }
        }
    }
    func performOnLoadingViewAppear(){
        withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
            self.isCircleRotating.toggle()
        }
        withAnimation(Animation.linear(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
            self.animateStart.toggle()
        }
        withAnimation(Animation.linear(duration: 1).delay(1).repeatForever(autoreverses: true)) {
            self.animateEnd.toggle()
        }
    }
}

#Preview{
    LoaderView()
}
