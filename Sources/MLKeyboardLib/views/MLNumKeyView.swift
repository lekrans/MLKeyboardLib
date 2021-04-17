//
//  File.swift
//  
//
//  Created by Michael Lekrans on 2021-04-16.
//

import SwiftUI

public enum MLKeyOrientation {
    case none, top, right, bottom
}

@available(iOS 13.0, *)
public struct MLNumKeyViewConfiguration{
    public var returnKey: MLKeyOrientation = .none
    public init(returnKey: MLKeyOrientation) {
        self.returnKey = returnKey
    }
}

@available(iOS 13.0, *)
/// Premade Numeric keyboard
public struct MLNumKeyView: View {
    @ObservedObject var keyboard: MLCustomKeyboard
    var returnButton: MLKeyboardButtonModel?
    var backButton: MLKeyboardButtonModel
    var internalText: String = ""
    var buttons: [MLKeyboardButtonModel] = []
    
    public init(keyboard: MLNumericKeyboard?, configuration: MLNumKeyViewConfiguration? = nil) {

        self.keyboard = keyboard ?? MLNumericKeyboard()

        backButton = MLCustomKeyboardButton(type: .alphanumeric, behaviour: .subtract, value: String(""), imageName: "chevron.backward.2")
        if let configuration = configuration, configuration.returnKey != .none {
            returnButton = MLCustomKeyboardButton(type: .alphanumeric, behaviour: .submit, value: String("ANSWER"), imageName: "")
            self.keyboard.add(button: &returnButton!)
        }
        
        for i in 1..<10 {
            buttons.append(MLCustomKeyboardButton(type: .alphanumeric, behaviour: .add, value: String(i)))
            self.keyboard.add(button: &buttons[i - 1])
        }
        buttons.append(MLCustomKeyboardButton(type: .alphanumeric, behaviour: .add, value: String("0")))
        self.keyboard.add(button: &buttons[buttons.count - 1])
        self.keyboard.add(button: &backButton)
        

    }
    
    public var body: some View {
        VStack {
            VStack {
                if returnButton != nil {
                    MLNumKeyButtonView(buttonModel: self.returnButton, color: Color.red, lightStyle: true)
                }
                ForEach(0..<3) { row in
                    HStack {
                        ForEach(0..<3) { col in
                            MLNumKeyButtonView(buttonModel: self.buttons[col + 3*row])
                        }
                    }
                }
                HStack {
                    MLNumKeyButtonView(buttonModel: nil)
                    MLNumKeyButtonView(buttonModel: self.buttons[self.buttons.count - 1])
                    MLNumKeyButtonView(buttonModel: self.backButton, color: Color.blue, lightStyle: true)
                }
            }
        }
    }
}

@available(iOS 13.0, *)
public struct MLNumKeyButtonView: MLKeyboardButtonViewProtocol {
    public var buttonModel: MLKeyboardButtonModel?
    var color: Color?
    var lightStyle: Bool = false
    
    public var body: some View {
        if let button = buttonModel { /// If we don't supply a button.. we create an empty Button to take it's place
            Button(action: {
                button.trigger()
            }, label: {
                HStack {
                    GeometryReader { geometry in
                        Group {
                            // TODO: - Take care of non system images
                            if button.imageName != "" {
                                Image(systemName: button.imageName)
                            } else {
                                Text(button.value)
                            }
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                            .foregroundColor(.gray)
                    }
                }
            })
            .buttonStyle( NeoButtonStyle(lightStyle: lightStyle, innerColor: color, isBeveled: true))

        } else {
            Button(action: {
            }, label: {
                HStack {
                    GeometryReader { geometry in
                        Text("")
                            .frame(width: geometry.size.width)
                            .foregroundColor(.gray)
                    }
                }
            })

        }
    }
}
