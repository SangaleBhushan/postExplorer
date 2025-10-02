//
//  EmptyStateView.swift
//  PostExplorer
//
//  Created by Bhushan on 02/10/25.
//

import SwiftUI

struct EmptyStateView: View {
    var message: String?
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            RenderingCustomImage(inputImage: "emptyState", width: 128, height: 128, foregroundColor:.gray)
            CustomLabelUI(text: "There are no posts to show",font:.subheadline,foregroundColor: .darkBlue).multilineTextAlignment(.center)
        }
    }
}

#Preview {
    EmptyStateView()
}
