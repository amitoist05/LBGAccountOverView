//
//  LoginView.swift
//  LBGAccountOverView
//
//  Created by 8209670 on 20/09/2020.
//  Copyright © 2020 LBG. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Propertiers
    @State private var email = ""
    @State private var password = ""
    @State private var formOffset: CGFloat = 0
    
    @State private var presentPasswordRecoverySheet = false
    @State private var presentSignupSheet = false
    @State private var willMoveToNextScreen = true
    
    // MARK: - View
    var body: some View {
        NavigationView {
            VStack() {
                Image("iosapptemplate")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .padding([.top, .bottom], 20)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("User ID", text: self.$email, onEditingChanged: { flag in
                        withAnimation {
                            self.formOffset = flag ? -150 : 0
                        }
                    })
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    
                    
                    Button(action: {
                        self.presentPasswordRecoverySheet.toggle()
                    }) {
                        Text("Forgot Password?")
                            .font(.headline)
                            .foregroundColor(Color.green)
                    }.sheet(isPresented: self.$presentPasswordRecoverySheet) {
                        RecoverPasswordView(presentPasswordRecoverySheet: self.$presentPasswordRecoverySheet)
                    }
                    
                    
                }.padding([.leading, .trailing], 27.5)
                
                
                Button(action: {}) {
                    Text("LOGIN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding(.top, 40)
                //.navigate(to: SignupView(), when: $willMoveToNextScreen)
                
                Spacer()
                SignInWithApple()
                    .frame(width: 300, height: 60)
                    .padding(.bottom, 40)
                    .onTapGesture(perform: showAppleLogin)
                
                HStack(spacing: 0) {
                    Text("New to Lloyds Bank? ")
                    Button(action: {
                        self.presentSignupSheet.toggle()
                    }) {
                        Text("GET STARTED")
                            .font(.headline)
                            .foregroundColor(Color.green)
                    }.sheet(isPresented: self.$presentSignupSheet){
                        SignupView()
                    }
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
        
    }
    
    // Apple Login
    private func showAppleLogin() {
        // 1
        //let request = ASAuthorizationAppleIDProvider().createRequest()
        
        // 2
        //request.requestedScopes = [.fullName, .email]
        
        // 3
        //let controller = ASAuthorizationController(authorizationRequests: [request])
    }
}

extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
    
    static var themeSignUp: Color {
        return Color(red: 56.0/255.0, green: 100.0/255.0, blue: 45.0/255.0, opacity: 1.0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
