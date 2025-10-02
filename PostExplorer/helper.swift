//
//  helper.swift
//  PostExplorer
//
//  Created by Bhushan on 01/10/25.
//

import Foundation
import UIKit
import SwiftUI
struct ScreenNavigation<Content> where Content : View{
   // var screenName : String? = ""
    func redirectToScreen(nextView: Content) {
        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                let window = windowScene.windows.first
                window?.rootViewController = UIHostingController(rootView: nextView)
                window?.makeKeyAndVisible()
            }
        }
    }
}
