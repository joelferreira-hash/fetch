//
//  File.swift
//  
//
//  Created by Joel Ferriera on 8/20/24.
//

import SwiftUI

public extension View {
    func roundedCorner(cornerRadius: CGFloat, borderWidth: CGFloat) -> some View {
        modifier(RoundedCardView(cornerRadius: cornerRadius))
    }
}
