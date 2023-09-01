//
//  CacheAsynImage.swift
//  OracleTest
//
//  Created by Jael  on 29/08/23.
//

import SwiftUI

fileprivate class ImageCache {
    static private var cache: [URL: Image] = [:]
    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}

struct CacheAsyncImage<Content>: View  where Content: View {
    
    private let url: URL
    private let scale: CGFloat
    private var transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    
    init(url: URL, scale: CGFloat = 1.0,
         transaction: Transaction = Transaction(),
         @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    var body: some View {
        if let cached = ImageCache[url] {
            content(.success(cached))
        } else {
            AsyncImage(url: url,scale: scale , transaction: transaction) { phase in
                cacheRender(phase: phase)
            }
        }
        
    }
    
    func cacheRender(phase : AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            ImageCache[url] = image
        }
        return content(phase)
    }
}

struct CacheAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CacheAsyncImage(url: URL(string:"https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble") ?? URL(filePath: "")){ phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
            case .failure(let error):
                Text("Error: \(error.localizedDescription)")
            @unknown default:
                fatalError()
            }
            
        }
    }
}

