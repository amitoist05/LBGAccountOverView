//
//  UIApplicationExt.swift
//  LoginScreenTutorial
//
//  Created by 8209670 on 20/09/2020.
//  Copyright © 2020 Duy Bui. All rights reserved.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
