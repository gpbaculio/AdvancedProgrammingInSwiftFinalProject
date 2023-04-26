//
//  AsyncImageLoader.swift
//  AdvancedProgrammingInSwiftFinal
//
//  Created by Glendon Philipp Baculio on 4/26/23.
//

import Foundation
import SwiftUI
import UIKit
import Combine

final class ImageCache {
    private let cache = NSCache<NSString, UIImage>()
    
    func image(for url: URL) -> UIImage? {
        cache.object(forKey: url.absoluteString as NSString)
    }
    
    func insertImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url.absoluteString as NSString)
    }
}


struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: () -> Placeholder
    private let imageCache: ImageCache
    
    
    init(url: URL, @ViewBuilder placeholder: @escaping () -> Placeholder, imageCache: ImageCache) {
        self._loader = StateObject(wrappedValue: ImageLoader(url: url, imageCache: imageCache))
        self.placeholder = placeholder
        self.imageCache = imageCache
    }
    
    var body: some View {
        if let image = loader.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit) 
        } else {
            placeholder()
                .onAppear(perform: loader.load)
        }
    }
}

final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    private let imageCache: ImageCache
    private var cancellable: AnyCancellable?
    
    init(url: URL, imageCache: ImageCache) {
        self.url = url
        self.imageCache = imageCache
    }
    
    func load() {
        if let cachedImage = imageCache.image(for: url) {
            image = cachedImage
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self, let image = $0 else { return }
                self.image = image
                self.imageCache.insertImage(image, for: self.url)
            }
    }
}
