//
//  File.swift
//  
//
//  Created by Joel Ferriera on 8/21/24.
//

import Foundation
import SwiftUI

public struct FetchImageView: View {
    var url: String?
    var size: CGSize = .init(width: 300, height: 300)

    public var body: some View {
        AsyncImage(
            url: URL(string: url ?? ""),
            content: { image in
                image.resizable()
            },
            placeholder: {
                Image(systemName: "doc.text.image")
                    .font(.system(size: 75))
            })
        .frame(height: size.height)
        .frame(maxWidth: size.width)
        .clipped()
        .aspectRatio(contentMode: .fit)
    }
    
    public init(url: String? = nil, size: CGSize = .init(width: 300, height: 300)) {
        self.url = url
        self.size = size
    }
}
