//
//  SwiftUIView.swift
//  
//
//  Created by Joel Ferriera on 8/20/24.
//

import SwiftUI

public struct RoundedCardView: ViewModifier {
    var cornerRadius: CGFloat

    public func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}
