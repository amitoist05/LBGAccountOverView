//
//  More.swift
//  LBGAccountOverView
//
//  Created by 8209670 on 21/09/2020.
//  Copyright © 2020 LBG. All rights reserved.
//

import Foundation
import SwiftUI

struct Home : View {
    
    @State var show = false
    
    var body : some View{
        
        ZStack{
            
            VStack(spacing: 20){
                HStack{
                    
                    Text("Services").foregroundColor(Color("Color"))
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("filter").renderingMode(.original)
                    }
                    
                }.padding(.top)
                
                Row1().padding(.top)
                
                Row2()
                
                Spacer(minLength: 0)
                
            }.padding([.horizontal,.top])
                                   
        }.animation(.default)
    }
}

struct Row1 : View {
    
    var body : some View{
        
        HStack(alignment: .top){
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r11").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    
                    Text("Send Money")
                    .frame(width: 55)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r12").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    
                    Text("Receive Money")
                    .frame(width: 55)
                    .font(.caption)
                        .foregroundColor(Color.black.opacity(0.5))
                        .multilineTextAlignment(.center)
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r13").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    
                    Text("Mobile Prepaid")
                    .frame(width: 55)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r14").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    
                    Text("Eletric Bill")
                    .frame(width: 55)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct Row2 : View {
    
    var body : some View{
        
        HStack(alignment: .top){
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r21").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    
                    Text("Cashback Offer")
                    .frame(width: 55)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r22").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    
                    Text("Movie Tickets")
                    .frame(width: 55)
                    .font(.caption)
                        .foregroundColor(Color.black.opacity(0.5))
                        .multilineTextAlignment(.center)
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r23").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    
                    Text("Flight Tickets")
                    .frame(width: 55)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
            }) {
                
                VStack(spacing: 8){
                    
                    VStack{
                        
                        Image("r24").renderingMode(.original)
                        
                    }.padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    
                    Text("More Options")
                    .frame(width: 55)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                }
            }
        }
    }
}



var names = ["Steve","John","David","Tim"]

