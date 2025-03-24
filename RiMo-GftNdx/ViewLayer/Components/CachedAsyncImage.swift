//
//  CachedAsyncImage.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

import SwiftUI

struct CachedAsyncImage: View {
    let url: URL
    
    @State private var image: UIImage? = nil
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else {
                ProgressView()
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }
    
    private func loadImage() {
        if let cachedImage = appSingletons.imageCache.image(for: url) {
            self.image = cachedImage
            return
        }
        Task {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let downloadedImage = UIImage(data: data) {
                await MainActor.run {
                    appSingletons.imageCache.saveImage(downloadedImage, for: url)
                    self.image = downloadedImage
                }
            }
        }
    }
}
