//
//  ActivityIndicatorView.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 23/3/25.
//

import SwiftUI

struct ActivityIndicatorView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray)
                .frame(width: 120, height: 120)
            ProgressView("loading")
                .foregroundColor(.primary)
                .progressViewStyle(CircularProgressViewStyle())
        }
    }
}

#Preview {
    ActivityIndicatorView()
}
