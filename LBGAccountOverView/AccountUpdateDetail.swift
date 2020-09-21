//
//  AccountUpdateDetail.swift
//  LBGAccountOverView
//
//  Created by 8209670 on 20/09/2020.
//  Copyright © 2020 LBG. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {

   var title = "SwiftUI"
   var text = "Loading..."
   var image = "Illustration1"

   var body: some View {
      VStack(spacing: 20.0) {
         Text("Account Overview for 2020")
            .font(.title)
            .fontWeight(.semibold)
                  
        BarChartView(data: TestData.values ,
                     title: "Account Overview",
                     legend: "Yearly",
                     valueSpecifier: "%.0f")
                 
         Text(text)
            .lineLimit(nil)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

         Spacer()
      }
      .padding(30.0)
   }
}

#if DEBUG
struct UpdateDetail_Previews: PreviewProvider {
   static var previews: some View {
      UpdateDetail()
   }
}
#endif
