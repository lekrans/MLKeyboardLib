//
//  NeoButtonStyle.swift
//  MLKeyboard
//
//  Created by Michael Lekrans on 2021-04-13.
//

import SwiftUI

@available(iOS 13.0, *)
public struct NeoButtonStyle: ButtonStyle {
    public let lightStyle: Bool
    public var baseColor: Color?
    public var innerColor: Color?
    
    public var fillInnerColor: Color {
        innerColor ?? Color.element
    }
    
    public var fillBaseColor: Color {
        baseColor ?? Color.element
    }
    
    public var buttonBrightness: Double {
        lightStyle ? 0.4 : 0
    }
    public var isBeveled: Bool = false
    
    // method in the ButtonStyle protocol where you have access to label and isPressed
    // You have to take care of the buttonPress yourself when creating a ButtonStyle
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.2 : 1)
            .background(
                Group {
                    if !configuration.isPressed { /// determine if the button should looked pressed or not
                        ZStack {
                            Capsule()
                                .fill(fillBaseColor)
                                .northWestShadow(radius: isBeveled ? 3 : 16, offset: isBeveled ? 1 : 6 )
                            if isBeveled {
                                Capsule() /// base color in the background.. so we can `tint` the fill color on top
                                    .inset(by: 3)
                                    .fill(fillBaseColor)
                                    .southEastShadow(radius: 1, offset: 1)
                                Capsule()
                                    .inset(by: 3)
                                    .fill(fillInnerColor)
                                    .brightness(buttonBrightness)
                                    .opacity(0.3)
                                    .southEastShadow(radius: 1, offset: 1)

                            }
                        }
                    } else {
                        ZStack {
                            Capsule()
                                .fill(fillBaseColor)
                                .southEastShadow(radius: isBeveled ? 3 : 3, offset: isBeveled ? 1 : 1 )
                            if isBeveled {
                                Capsule() /// base color in the background.. so we can `tint` the fill color on top
                                    .inset(by: 3)
                                    .fill(fillBaseColor)
                                    .northWestShadow(radius: 1, offset: 1)
                                Capsule()
                                    .inset(by: 3)
                                    .fill(fillInnerColor)
                                    .brightness(buttonBrightness)
                                    .opacity(0.3)
                                    .northWestShadow(radius: 1, offset: 1)

                            }
                        }
                    }
                }
            )
    }
}
