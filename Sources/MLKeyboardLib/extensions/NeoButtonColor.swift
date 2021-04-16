//
//  NeoButtonColor.swift
//  MLKeyboard
//
//  Created by Michael Lekrans on 2021-04-13.
//

//
//  NeoButtonColor.swift
//  MathMaster
//
//  Created by Michael Lekrans on 2021-04-11.
//

import SwiftUI


// MARK: - Extension Color
@available(iOS 13.0, *)
public extension Color {
    static let hightlight = Color("Highlight")
    static let shadow = Color("Shadow")
    static let element = Color("Element")
    static let elementLight = Color("ElementLight")
}

@available(iOS 13.0, *)
public extension View {
    func northWestShadow(radius: CGFloat = 16, offset: CGFloat = 6) -> some View {
        return self
            .shadow(color: .hightlight, radius: radius, x: -offset, y: -offset)
            .shadow(color: .shadow, radius: radius, x: offset, y: offset)
    }
    
    func southEastShadow(radius: CGFloat = 16, offset: CGFloat = 6) -> some View {
        return self
            .shadow(color: .shadow, radius: radius, x: -offset, y: -offset)
            .shadow(color: .hightlight, radius: radius, x: offset, y: offset)
    }
    
}


