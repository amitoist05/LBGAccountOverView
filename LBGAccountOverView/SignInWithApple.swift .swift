//
//  SignInWithApple.swift .swift
//  LoginScreenTutorial
//
//  Created by 8209670 on 20/09/2020.
//  Copyright © 2020 Duy Bui. All rights reserved.
//

import Foundation
import SwiftUI
import AuthenticationServices

// 1
final class SignInWithApple: UIViewRepresentable {
  // 2
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    // 3
    return ASAuthorizationAppleIDButton()
  }
  
  // 4
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
  }
}
