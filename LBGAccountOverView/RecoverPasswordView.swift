//
//  RecoverPasswordView.swift
//  LBGAccountOverView
//
//  Created by 8209670 on 20/09/2020.
//  Copyright © 2020 LBG. All rights reserved.
//

import Foundation
import SwiftUI

struct RecoverPasswordView: View {
    @State private var email = ""
    @Binding var presentPasswordRecoverySheet: Bool
    @State private var formOffset: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10) {
            
            Image("iosapptemplate")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10.0, x: 20, y: 10)
                .padding([.top, .bottom], 20)
                                    
            Text("Recover Password").font(.title).bold().foregroundColor(.green)
            
            VStack {
                TextField("Email", text: self.$email, onEditingChanged: { flag in
                    withAnimation {
                        self.formOffset = flag ? -150 : 0
                    }
                })
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                                
                Button(action: {}) {
                    Text("Reset Password")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding(.top, 40)
            }.padding([.leading, .trailing], 27.5)
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

struct RecoverEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RecoverPasswordView(presentPasswordRecoverySheet: .constant(false))
    }
}
