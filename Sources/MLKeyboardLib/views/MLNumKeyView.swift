//
//  File.swift
//  
//
//  Created by Michael Lekrans on 2021-04-16.
//

import SwiftUI

@available(iOS 13.0, *)
public struct MLNumKeyView: View {
    @ObservedObject var keyboard: MLCustomKeyboard
    
    var internalText: String = ""
    var buttons: [MLKeyboardButtonModel] = []
    
    public init(keyboard: MLNumericKeyboard?) {
        
        self.keyboard = keyboard ?? MLNumericKeyboard()
        for i in 1..<10 {
            buttons.append(MLCustomKeyboardButton(type: .alphanumeric, behaviour: .add, value: String(i)))
            self.keyboard.add(button: &buttons[i - 1])
        }
        buttons.append(MLCustomKeyboardButton(type: .alphanumeric, behaviour: .add, value: String("0")))
        self.keyboard.add(button: &buttons[buttons.count - 1])
        buttons.append(MLCustomKeyboardButton(type: .alphanumeric, behaviour: .subtract, value: String(""), imageName: "chevron.backward.2"))
        self.keyboard.add(button: &buttons[buttons.count - 1])
    }
    
    public var body: some View {
        VStack {
            VStack {
                ForEach(0..<3) { row in
                    HStack {
                        ForEach(0..<3) { col in
                            MLNumKeyButtonView(buttonModel: self.buttons[col + 3*row])
                        }
                    }
                }
                HStack {
                    MLNumKeyButtonView(buttonModel: nil)
                    MLNumKeyButtonView(buttonModel: self.buttons[self.buttons.count - 2])
                    MLNumKeyButtonView(buttonModel: self.buttons[self.buttons.count - 1], color: Color.blue, lightStyle: true)
                }
            }
        }
    }
}

@available(iOS 13.0, *)
public struct MLNumKeyButtonView: View {
    var buttonModel: MLKeyboardButtonModel?
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
