//
//  AccountList.swift
//  LBGAccountOverView
//
//  Created by 8209670 on 20/09/2020.
//  Copyright © 2020 LBG. All rights reserved.
//

import SwiftUI

struct AccountList: View {

    var courses = coursesData
    @State var showContent = false
    @State var showUpdate = false
   var body: some View {
      ScrollView {
         VStack {
            HStack {
               VStack(alignment: .leading) {
                  Text("Your Accounts with Lloyds")
                     .font(.title)
                     .fontWeight(.heavy)

                  Text("4 Accounts")
                     .foregroundColor(.gray)
               }
               Spacer()
            }
            .padding(.leading, 30.0)

            ScrollView(.horizontal, showsIndicators: false) {
               HStack(spacing: 30.0) {
                  ForEach(courses) { item in
                     Button(action: { self.showUpdate.toggle() }) {
                        GeometryReader { geometry in
                           CourseView(title: item.title,
                                      image: item.image,
                                      color: item.color,
                                      shadowColor: item.shadowColor)
                              .rotation3DEffect(Angle(degrees:
                                 Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
                                .sheet(isPresented: self.$showUpdate) { UpdateList() }
                        }
                        .frame(width: 246, height: 360)
                     }
                  }
               }
               .padding(.leading, 30)
               .padding(.top, 30)
               .padding(.bottom, 30)
               Spacer()
            }
            //CertificateRow()
         }
         .padding(.top, 250)
      }
   }
}

#if DEBUG
struct AccountList_Previews: PreviewProvider {
   static var previews: some View {
    AccountList()
   }
}
#endif

struct CourseView: View {

   var title = "Build an app with SwiftUI"
   var image = "Illustration1"
   var color = Color("background3")
   var shadowColor = Color("backgroundShadow3")

   var body: some View {
      return VStack(alignment: .leading) {
         Text(title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(30)
            .lineLimit(4)

         Spacer()

         Image(image)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 246, height: 150)
            .padding(.bottom, 30)
      }
      .background(color)
      .cornerRadius(30)
      .frame(width: 246, height: 360)
      .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
   }
}

struct Course: Identifiable {
   var id = UUID()
   var title: String
   var image: String
   var color: Color
   var shadowColor: Color
}

let coursesData = [
   Course(title: "Everyday Saver Account",
          image: "Illustration1",
          color: Color("background3"),
          shadowColor: Color("backgroundShadow3")),
   Course(title: "Classic Current Account",
          image: "Illustration2",
          color: Color("background4"),
          shadowColor: Color("backgroundShadow4")),
   Course(title: "Club Lloyds Platinum",
          image: "Illustration3",
          color: Color("background7"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
   Course(title: "Balance Transfer Credit Card",
          image: "Illustration4",
          color: Color("background8"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),   
]
