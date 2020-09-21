//
//  DetailsView.swift
//  LBGAccountOverView
//
//  Created by 8209670 on 21/09/2020.
//  Copyright © 2020 LBG. All rights reserved.
//

import Foundation
import SwiftUI

let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
let screen = UIScreen.main.bounds

struct DetailsView: View {
    var body: some View {
        TabView {
           HomeView()
             .tabItem {
                Image("IconHome")
                Text("Home")
             }.tag(1)

            InvestView()
             .tabItem {
                Image("IconCards")
                Text("Invest")
              }.tag(2)
            
            PayTransferView()
              .tabItem {
                 Image("IconCards")
                 Text("Pay & Transfer")
               }.tag(3)
            
            MoreItemsView()
              .tabItem {
                 Image("IconSettings")
                 Text("More")
               }.tag(4)
        }
    }
}

struct HomeView: View {
    
    @State var show = false
    @State var showProfile = false

    var body: some View {
       ZStack(alignment: .top) {
          
        AccountList()
           .blur(radius: show ? 20 : 0)
           .scaleEffect(showProfile ? 0.95 : 1)
           .animation(.default)
        
          HStack {
              MenuButton(show: $show)
                 .offset(x: -40)
                  Spacer()
            
            HStack {
                VStack {
                    Image("profile")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10.0, x: 20, y: 10)
                        .offset(y: 0)
                    
                    Text("Lloyds Banking Group")
                        .font(.body)
                        .foregroundColor(.gray)
                        .offset(y: 0)
                }.padding(0)
                Spacer()
                
                
            }.padding([.leading], 20.0)
          }
          .offset(y: showProfile ? statusBarHeight : 80)
          .animation(.spring())
        
          MenuView(show: $show)
       }
       //.background(Color("background"))
       .background(Color(.white))
       .edgesIgnoringSafeArea(.all)
    }
 }

struct InvestView: View {
    var body: some View {
        Text("In Progress for LLoyds Banking Group...")
    }
}

struct PayTransferView: View {
    var body: some View {
        
        ZStack{
        VStack(spacing: 20){
            HStack{
                
                Text("Send Money").foregroundColor(Color("Color"))
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("scan").renderingMode(.original)
                }
                
            }.padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("add").renderingMode(.original)
                    }
                    
                    ForEach(payeeNames,id: \.self){i in
                        
                        VStack(spacing: 10){
                            
                            Image("person")
                            
                            Text(i).foregroundColor(Color.black.opacity(0.5))
                            
                        }.frame(width: 100)
                        .padding(.vertical)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    }
                }.padding(.leading)
                
            }.padding(.top,18)
        }
    }.animation(.default)
    }
}


struct MoreItemsView: View {
    var body: some View {
        Home()
    }
}

struct MoreItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreItemsView()
    }
}

struct ProfileImage: View {
    var body: some View {
        VStack {
            Image("profile")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}

struct MenuRow: View {

   var image = "creditcard"
   var text = "Accounts"

   var body: some View {
      return HStack {
         Image(systemName: image)
            .imageScale(.large)
            .foregroundColor(Color("icons"))
            .frame(width: 32, height: 32)

         Text(text)
            .font(.headline)
            .foregroundColor(.primary)

         Spacer()
      }
   }
}

struct Menu: Identifiable {
   var id = UUID()
   var title: String
   var icon: String
}

let menuData = [
   Menu(title: "Accounts", icon: "person.crop.circle"),
   Menu(title: "Loans", icon: "gear"),
   Menu(title: "Cards", icon: "creditcard"),
   Menu(title: "Insure", icon: "person.2"),
   Menu(title: "Sign out", icon: "arrow.uturn.down")
]

struct MenuView: View {

   var menu = menuData
   @Binding var show: Bool
   @State var showSettings = false

   var body: some View {
      return HStack {
         VStack(alignment: .leading) {
            ForEach(menu) { item in
               if item.title == "Settings" {
                  Button(action: { self.showSettings.toggle() }) {
                     MenuRow(image: item.icon, text: item.title)
                        //.sheet(isPresented: self.$showSettings) { Settings() }
                  }
               } else {
                  MenuRow(image: item.icon, text: item.title)
               }
            }
            Spacer()
         }
         .padding(.top, 20)
         .padding(30)
         .frame(minWidth: 0, maxWidth: 360)
         .background(Color("button"))
         .cornerRadius(30)
         .padding(.trailing, 60)
         .shadow(radius: 20)
         .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
         .animation(.default)
         .offset(x: show ? 0 : -UIScreen.main.bounds.width)
         .onTapGesture {
            self.show.toggle()
         }
         Spacer()
      }
      .padding(.top, statusBarHeight)
   }
}

struct CircleButton: View {

   var icon = "person.crop.circle"

   var body: some View {
      return HStack {
         Image(systemName: icon)
            .foregroundColor(.primary)
      }
      .frame(width: 44, height: 44)
      .background(Color("button"))
      .cornerRadius(30)
      .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
   }
}

struct MenuButton: View {
   @Binding var show: Bool

   var body: some View {
      return ZStack(alignment: .topLeading) {
         Button(action: { self.show.toggle() }) {
            HStack {
               Spacer()

               Image(systemName: "list.dash")
                  .foregroundColor(.primary)
            }
            .padding(.trailing, 18)
            .frame(width: 90, height: 60)
            .background(Color("button"))
            .cornerRadius(30)
            .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
         }
         Spacer()
      }
   }
}

struct MenuRight: View {

   @Binding var show: Bool
   @State var showUpdate = false

   var body: some View {
      return ZStack(alignment: .topTrailing) {
         HStack {
            Button(action: { self.show.toggle() }) {
               CircleButton(icon: "person.crop.circle")
            }
            Button(action: { self.showUpdate.toggle() }) {
               CircleButton(icon: "bell")
                  //.sheet(isPresented: self.$showUpdate) { UpdateList() }
            }
         }
         Spacer()
      }
   }
}

var payeeNames = ["Steve","John","David","Tim"]
