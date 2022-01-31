//
//  ContentView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 25.01.2022.
//

import SwiftUI

struct MainView: View {
    @State private var login = "bar"
    @State private var password = "foo"
    @State private var showIncorrentCredentialsWarning = false
    @State private var easterEgg = false
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            backgroundImage
            ScrollView {
                VStack {
                    Button(action: { easterEgg = true }) {
                        logo
                    }.alert(isPresented: $easterEgg) {
                        Alert(title: Text("Sorry"),
                              message: Text("This is not the button you need"),
                              dismissButton: Alert.Button.default(Text("OK"),
                                                                  action: { easterEgg = false }))
                    }
                    loginStack
                    passwordStack
                    loginButton
                }
                .frame(maxWidth: 250)
            }
        }
    }
    
    private func verifyLoginData() {
        if login == "bar" && password == "foo" {
            isLoggedIn = true
        } else {
            showIncorrentCredentialsWarning = true
        }
        password = ""
    }
}


// MARK: - Login View ext
private extension MainView {
    var backgroundImage: some View {
        GeometryReader { geometry in
            Image("pattern-28")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
                .frame(maxWidth: geometry.size.width)
                .opacity(0.12)
        }
    }
    
    var logo: some View {
        Image("app_logo_x3")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .frame(width: 270.0,
                   height: 85.0,
                   alignment: .center)
            .padding([.top, .bottom], 30)
    }
    
    var loginStack: some View {
        HStack {
            Text("Login")
            Spacer()
            TextField("", text: $login)
                .modifier(MainViewTextFieldModifier())
        }
    }
    
    var passwordStack: some View {
        HStack {
            Text("Password")
            Spacer()
            SecureField("", text: $password)
                .modifier(MainViewTextFieldModifier())
        }
        .padding(.bottom, 30)
    }
    
    var loginButton: some View {
        Button(action: verifyLoginData) {
            Text("Log in")
        }
        .buttonStyle(LoginButton())
        .disabled(login.isEmpty || password.isEmpty)
        .alert(isPresented: $showIncorrentCredentialsWarning) {
            Alert(
                title: Text("Error"),
                message: Text("Incorrect Login/Password"),
                dismissButton: .cancel(Text("OK")))
        }
    }
}

// MARK: - Login Button style
struct LoginButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding([.leading, .trailing], 48)
            .padding([.top, .bottom], 18)
            .background(configuration.isPressed
                        ? Color.mainButtonPressedColor
                        : Color.mainButtonColor)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.easeOut(duration: 0.2),
                       value: configuration.isPressed)
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(isLoggedIn: .constant(false))
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
