//
//  MLNumericKeyboard.swift
//  MLKeyboard
//
//  Created by Michael Lekrans on 2021-04-12.
//

import Foundation

@available(iOS 13.0, *)

/// Test 
public class MLNumericKeyboard: MLCustomKeyboard {
    override public func add(button: inout MLKeyboardButtonModel) {
        super.add(button: &button)
    }
    
}
