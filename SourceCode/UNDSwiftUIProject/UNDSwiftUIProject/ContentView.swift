//
//  ContentView.swift
//  UNDSwiftUIProject
//
//  Created by UNDaniel on 9/7/20.
//  Copyright © 2020 UNDaniel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Text("Course")
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 30)
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        CardView()
                    }
                    Spacer() // Use all Space in the screen.
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Image(uiImage: #imageLiteral(resourceName: "Content")).shadow(color: Color(#colorLiteral(red: 0.3176470696926117, green: 0.1568627506494522, blue: 0.7450980544090271, alpha: 0.20000000298023224)), radius:40, x:0, y:20)
                .offset(x: show ? 50 : 0)
                .rotation3DEffect(Angle(degrees: show ? 0 : 10), axis: (x: 0, y: 10, z: 0))
                .animation(Animation.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0).delay(0.1))
            Image(uiImage: #imageLiteral(resourceName: "Card1")).shadow(color: Color(#colorLiteral(red: 0.3176470696926117, green: 0.1568627506494522, blue: 0.7450980544090271, alpha: 0.20000000298023224)), radius:40, x:0, y:20)
                .offset(x: show ? -300 : 0)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0))
        }.onTapGesture {
            self.show.toggle()
        }
    }
}
