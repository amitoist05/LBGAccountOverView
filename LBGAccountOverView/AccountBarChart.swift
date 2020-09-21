//
//  AccountBarChart.swift
//  LBGAccountOverView
//
//  Created by 8209670 on 21/09/2020.
//  Copyright © 2020 LBG. All rights reserved.
//

import Foundation
import SwiftUI

struct AccountBarChart: View {
  var measurements: [DayInfo]
  
  func sumPrecipitation(_ month: Int) -> Double {
    self.measurements
      .filter {
        Calendar.current.component(.month, from: $0.date) == month + 1
    }
    .reduce(0) { $0 + $1.precipitation }
  }
  
  func monthAbbreviationFromInt(_ month: Int) -> String {
    let ma = Calendar.current.shortMonthSymbols
    return ma[month]
  }
  
  var body: some View {
    // 1
    HStack {
      // 2
      ForEach(0..<12) { month in
        // 3
        VStack {
          // 4
          Spacer()
          Text("")
            .font(.footnote)
            .rotationEffect(.degrees(-90))
            .offset(y: self.sumPrecipitation(month) < 2.4 ? 0 : 35)
            .zIndex(1)
          // 5
          Rectangle()
            .fill(Color.green)
            .frame(width: 20, height: CGFloat(self.sumPrecipitation(month)) * 15.0)
          
          // 6
          Text("\(self.monthAbbreviationFromInt(month))")
            .font(.footnote)
            .frame(height: 20)
        }
      }
    }
  }
}


struct DayInfo : Identifiable {
  var date: Date
  var precipitation: Double
  var snowfall: Double
  var high: Double
  var low: Double
  
  var id: Date {
    return date
  }
  
  var dateString: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M/d/yyyy"
    return dateFormatter.string(from: date)
  }
}
