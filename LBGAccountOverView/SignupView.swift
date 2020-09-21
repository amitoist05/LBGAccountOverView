//
//  SignupView.swift
//  LBGAccountOverView
//
//  Created by 8209670 on 20/09/2020.
//  Copyright © 2020 LBG. All rights reserved.
//

import Foundation
import SwiftUI

struct SignupView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmedPassword = ""
    @State private var formOffset: CGFloat = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack() {
            Image("iosapptemplate")
                .resizable()
                .frame(width: 150, height: 150)
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
                
                SecureField("Confirm Password", text: self.$password)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {}) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding(.top, 40)
            
        }
        .onTapGesture {
                UIApplication.shared.endEditing()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
        LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
