//
//  CachedImageView.swift
//  MarvelApp
//
//  Created by Jessica Tarra on 26/10/24.
//

import Foundation
import NukeUI
import SwiftUI
import SwiftUICore

struct CachedImageView: View {
    let url: URL?

    var body: some View {
        LazyImage(url: url) { photo in
            if let image = photo.image {
                image.resizable()
            } else if photo.error != nil {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ZStack(alignment: .center) {
                    Color.gray.aspectRatio(contentMode: .fill)
                    ProgressView()
                }
            }
        }
    }
}

struct CachedImageView_Previews: PreviewProvider {
    static var previews: some View {
        CachedImageView(url: URL(string: "https://example.com/image.jpeg"))
    }
}
