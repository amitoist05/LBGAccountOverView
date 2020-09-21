//
//  AccountUpdateStore.swift
//  LBGAccountOverView
//
//  Created by 8209670 on 20/09/2020.
//  Copyright © 2020 LBG. All rights reserved.
//

import Combine
import SwiftUI

class UpdateStore: ObservableObject {
   var willChange = PassthroughSubject<Void, Never>()

   var updates: [Update] {
      didSet {
         willChange.send()
      }
   }

   init(updates: [Update] = []) {
      self.updates = updates
   }
}
