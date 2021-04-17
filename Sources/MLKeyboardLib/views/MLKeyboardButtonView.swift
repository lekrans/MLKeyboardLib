//
//  MLKeyboardButtonView.swift
//  MLKeyboard
//
//  Created by Michael Lekrans on 2021-04-12.
//

import SwiftUI

/// You can easily create a custom keyboard like this


//struct ContentView: View {
//    @ObservedObject var keyboard: MLCustomKeyboard = MLNumericKeyboard()
//    private var buttons: [MLKeyboardButton] = []
//
//    var body: some View {
//        VStack {
//            Text(keyboard.text)
//            HStack {
//                MLKeyboardButtonView(value: "a", keyboard: keyboard)
//                MLKeyboardButtonView(value: "b", keyboard: keyboard)
//                MLKeyboardButtonView(value: "c", keyboard: keyboard)
//            }
//            HStack {
//                MLKeyboardButtonView(value: "d", keyboard: keyboard)
//                MLKeyboardButtonView(value: "e", keyboard: keyboard)
//                MLKeyboardButtonView(value: "f", keyboard: keyboard)
//            }
//        }
//    }
//}



/// Simple view for a MLKeyboardButtonModel. It is locked to the .add behaviour
/// For a more dynamic behaving view see:

public protocol MLKeyboardButtonViewProtocol: View {
    var buttonModel: MLKeyboardButtonModel? { get set }
}


@available(iOS 13.0, *)
public struct MLKeyboardButtonView: MLKeyboardButtonViewProtocol {
    public var buttonModel: MLKeyboardButtonModel?
    
    public init(value: String, keyboard: MLCustomKeyboard) {
        self.buttonModel = MLCustomKeyboardButton(type: .alphanumeric, behaviour: .add, value: value)
        keyboard.add(button: &self.buttonModel!)
    }
    
    public var body: some View {
        Button(action: {
            self.buttonModel?.trigger()
        }, label: {
            HStack {
            GeometryReader { geometry in
                Text(buttonModel!.value)
                    .padding()
                    .frame(width: geometry.size.width, height: 60)
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 14))
                }
            }.frame(height: 60)
        })
    }
}




