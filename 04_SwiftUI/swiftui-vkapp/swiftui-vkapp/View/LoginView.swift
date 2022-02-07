//
//  ContentView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 25.01.2022.
//

import SwiftUI

struct LoginView: View {
    @State private var login = "bar"
    @State private var password = "foo"
    @State private var showIncorrentCredentialsWarning = false
    @State private var logoTapped = false
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        if isLoggedIn {
            ContentView()
        } else {
            mainView
        }
    }
}

// MARK: - Login View ext
private extension LoginView {
    
    var mainView: some View {
        ZStack(alignment: .top) {
            backgroundImage
            ScrollView {
                VStack {
                    logoButton
                    loginStack
                    passwordStack
                    loginButton
                }
                .frame(maxWidth: 250)
            }
        }
    }
    
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
    
    var logoButton: some View {
        Button(action: { logoTapped = true }) {
            logo
        }.alert(isPresented: $logoTapped) {
            Alert(title: Text("Sorry"),
                  message: Text("This is not the button you need"),
                  dismissButton: Alert.Button.default(Text("OK"),
                                                      action: { logoTapped = false }))
        }
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
    
    private func verifyLoginData() {
        if login == "bar" && password == "foo" {
            isLoggedIn.toggle()
        } else {
            showIncorrentCredentialsWarning = true
        }
        password = ""
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
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: false)
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
