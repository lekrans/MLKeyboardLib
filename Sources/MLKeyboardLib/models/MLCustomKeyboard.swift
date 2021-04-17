//
//  MLCustomKeyboard.swift
//  MLKeyboard
//
//  Created by Michael Lekrans on 2021-04-12.
//

import Foundation


/// A simple keyboard button that implements the logic to pass the .behaviour to the MLKeyboardDelegate
public class MLCustomKeyboardButton: MLKeyboardButtonModel {
    public var keyboardDelegate: MLKeyboardDelegate?
    
    public var type: MLKeyboardButtonType
    public var behaviour: MLKeyboardButtonBehaviour
    public var value: String
    public var imageName: String
    
    public init(type: MLKeyboardButtonType, behaviour: MLKeyboardButtonBehaviour, value: String, imageName: String = "") {
        self.type = type
        self.behaviour = behaviour
        self.value = value
        self.imageName = imageName
    }
    
    public func trigger() {
        guard let keyboardDelegate = keyboardDelegate else { return }
        
        switch behaviour {
        case .add:
            keyboardDelegate.add(value: value)
        case .subtract:
            keyboardDelegate.remove()
        case .clear:
            keyboardDelegate.clear()
        case .submit:
            keyboardDelegate.submit()
        }
        
    }
    
}


/// Simple keyboard that updates it's text property to reflect the input from the added buttons
@available(iOS 13.0, *)
public class MLCustomKeyboard: MLKeyboard, ObservableObject {
    
    @Published public var text: String = "" {
        didSet {
            print("Didset published text \(text)")
        }
    }
    
    @Published public var submitted: Bool = false
    
    public var buttons: [MLKeyboardButtonModel]
    
    public init() {
        buttons = []
    }
    
    public func add(button: inout MLKeyboardButtonModel) {
        button.keyboardDelegate = self
        buttons.append(button)
    }
    
    public func add(value: String) {
        text += value
    }
    
    public func remove() {
        text = String(text.dropLast())
    }
    
    public func clear() {
        text = ""
    }
    
    public func submit() {
        self.submitted = true
    }
    
}
