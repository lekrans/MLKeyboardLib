//
//  MLNumericKeyboard.swift
//  MLKeyboard
//
//  Created by Michael Lekrans on 2021-04-12.
//

import Foundation



/// A Lekrans Numeric Keyboard class
/// Use @Published var text to get the entered text
/// Use @Published var submitted to check if it has been submitted
@available(iOS 13.0, *)
public class MLNumericKeyboard: MLCustomKeyboard {
    override public func add(button: inout MLKeyboardButtonModel) {
        super.add(button: &button)
    }
    
}
