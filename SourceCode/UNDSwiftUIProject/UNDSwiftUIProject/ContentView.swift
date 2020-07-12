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
            
            VStack {
                List {
                    Text("Course")
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 30)
                    ForEach(0 ..< 200) { item in
                        GeometryReader { geometry in
                            CardView(infoY: UNDViewYInfo(minY: geometry.frame(in: .global).minY, maxY: geometry.frame(in: .global).maxY))
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 440)
                    }
                }
                .listRowBackground(Color.clear)
                .background(Color.clear)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct UNDViewYInfo {
    var minY : CGFloat
    var maxY : CGFloat
}

struct CardView: View {
    @State var show = false
    var scaleEfffectValue: CGFloat = 1
    var scaleAnchor : UnitPoint = .top
    var rotationAngle: Double = 0
    var infoY : UNDViewYInfo 
    
    init(infoY: UNDViewYInfo) {
        self.infoY = infoY
        let screenHeight = UIScreen.main.bounds.size.height
        if infoY.minY < 0 {
            scaleEfffectValue = infoY.minY / 1000 + 1
            rotationAngle = Double( -infoY.minY / 10)
            scaleAnchor = .bottom
        } else if infoY.maxY > screenHeight {
            scaleEfffectValue = (screenHeight - infoY.maxY ) / 1000 + 1
            rotationAngle = Double( (screenHeight - infoY.maxY) / 10)
            scaleAnchor = .top
        } else {
            scaleEfffectValue = 1
            rotationAngle = 0
        }
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: #imageLiteral(resourceName: "Content")).shadow(color: Color(#colorLiteral(red: 0.3176470696926117, green: 0.1568627506494522, blue: 0.7450980544090271, alpha: 0.20000000298023224)), radius:40, x:0, y:20)
                .offset(x: show ? 50 : 0)
                .animation(Animation.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0).delay(0.1))
            Image(uiImage: #imageLiteral(resourceName: "Card1")).shadow(color: Color(#colorLiteral(red: 0.3176470696926117, green: 0.1568627506494522, blue: 0.7450980544090271, alpha: 0.20000000298023224)), radius:40, x:0, y:20)
                .offset(x: show ? -300 : 0)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0))
        }
        .opacity(Double(scaleEfffectValue))
        .frame(maxWidth: .infinity)
        .scaleEffect( scaleEfffectValue, anchor: scaleAnchor)
        .rotation3DEffect(Angle(degrees: rotationAngle), axis: (x: 10, y: 0, z: 0))
        .onTapGesture {
            self.show.toggle()
        }
    }
}
