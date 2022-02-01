//
//  ViewModifiers.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 29.01.2022.
//

import SwiftUI

struct MainViewTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 160)
            .textFieldStyle(.roundedBorder)
            .border(Color.frameColor)
    }
}
