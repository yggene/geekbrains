//
//  ContentView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 25.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geometry in
                Image("pattern-28")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: geometry.size.width)
                    .opacity(0.05)
            }
            
            ScrollView {
                VStack {
                    Image("app_logo_x3")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: 250.0, height: 80.0, alignment: .center)
                        .padding([.top, .bottom], 50)
                    
                    HStack {
                        Text("Login")
                        Spacer()
                        TextField("", text: $login)
                            .frame(maxWidth: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack {
                        Text("Password")
                        Spacer()
                        SecureField("", text: $password)
                            .frame(maxWidth: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.bottom, 50)
                    
                    Button(action: { print("Button pressed") }) {
                        Text("Log in")
                    }
                    .buttonStyle(LoginButton())
                    .disabled(login.isEmpty || password.isEmpty)
                }.frame(maxWidth: 250)
            }
        }
    }
}

// MARK: - Login Button style
struct LoginButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding([.leading, .trailing], 50)
            .padding([.top, .bottom], 20)
            .background(Color(red: 13/255, green: 112/255, blue: 247/255))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
