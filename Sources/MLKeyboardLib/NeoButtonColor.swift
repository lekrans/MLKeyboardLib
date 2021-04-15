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
    static public let hightlight = Color("Highlight")
    static public let shadow = Color("Shadow")
    static public let element = Color("Element")
    static public let elementLight = Color("ElementLight")
}

@available(iOS 13.0, *)
public extension View {
    public func northWestShadow(radius: CGFloat = 16, offset: CGFloat = 6) -> some View {
        return self
            .shadow(color: .hightlight, radius: radius, x: -offset, y: -offset)
            .shadow(color: .shadow, radius: radius, x: offset, y: offset)
    }
    
    public func southEastShadow(radius: CGFloat = 16, offset: CGFloat = 6) -> some View {
        return self
            .shadow(color: .shadow, radius: radius, x: -offset, y: -offset)
            .shadow(color: .hightlight, radius: radius, x: offset, y: offset)
    }
    
}


