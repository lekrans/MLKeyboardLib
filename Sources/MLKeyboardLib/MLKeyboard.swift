//
//  MLKeyboard.swift
//  MLKeyboard
//
//  Created by Michael Lekrans on 2021-04-12.
//

import Foundation


/// MLKeyboardButton type. Show if it is supposed to be treated as a numeric och alphanumeric value
public enum MLKeyboardButtonType {
    case numeric, alphanumeric
}


/// MLKeyboardButton behaviour. Show how the value of the button is supposed to be treated.  ex .add will mathematically add two .numeric values .. but add it like strings if the button is .alphaNumeric ( .numeric 5 .add 6 = 11, .alphaNumeric 5 .add 6 = 56)
public enum MLKeyboardButtonBehaviour {
    case add, subtract, clear
}



/// MLKeyboard Delegate. specify the actions of a button. This protocol is implemented by the implementations of MLKeyboard and used by MLKeyboardButtonModel
public protocol MLKeyboardDelegate {
    func add(value: String)
    func remove()
    func clear()
}


/// The internal workings and data of a  ML'button'. It specifies the type (.alphanumeric, .numeric), the behaviour (.add, .subtract, .clear and so on). It can have a value but that value can be blank if the behaviour specifies some kind of action like .clear.
public protocol MLKeyboardButtonModel {
    var type: MLKeyboardButtonType { get }
    var behaviour: MLKeyboardButtonBehaviour { get }
    var value: String { get }
    var imageName: String { get }
    var keyboardDelegate: MLKeyboardDelegate? { get set }
    
    func trigger()
    
}


/// The keyboard model. this is the central point of the keyboard that implements the MLKeyboardDelegate protocol and handles the buttons 'trigger' events
public protocol MLKeyboard: MLKeyboardDelegate {
    var buttons: [MLKeyboardButtonModel] { get set }
    var text: String { get }
    
    func add(button: inout MLKeyboardButtonModel)
}


