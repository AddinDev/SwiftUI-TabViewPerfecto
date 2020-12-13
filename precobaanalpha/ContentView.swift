//
//  ContentView.swift
//  precobaanalpha
//
//  Created by addjn on 04/12/20.
//

import SwiftUI

struct ContentView: View {
    @State var a = 0
    var body: some View {
        TabBar(a: $a)

    }
}

struct Home: View {
    @Binding var a: Int
    var body: some View {
        Text("A").onAppear{
            a = a + 1
            if a == 1 {print("A")}
            print(a)}
    }
}

struct TabBar: View {
    @Binding var a: Int
    @State var currentTab = "house"
    @Namespace var animation
//    init() {
//
//        // hiding default tab bar...
//        UITabBar.appearance().isHidden = true
//    }
    // safe area values...
    @State var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
    var body: some View {
        
//        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
        VStack() {

            TabView(selection: $currentTab) {
                
                Home(a: $a)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[0])
                    .background(Color("bg").ignoresSafeArea())
                
                Text("Booking")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[1])
                    .background(Color("bg").ignoresSafeArea())
                
                Text("Favourites")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[2])
                    .background(Color("bg").ignoresSafeArea())
                
                Text("Settings")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[3])
                    .background(Color("bg").ignoresSafeArea())
            }
            
            // Custom Tab Bar...
            
            HStack(spacing: 35) {
                
//                ForEach(tabs,id: \.self) { image in

                    TabButton(image: tabs[0], selected: $currentTab, animation: animation)
                TabButton(image: tabs[1], selected: $currentTab, animation: animation)
                Button(action: {
                    // changing tab..
                    print("ehhe")
                }) {
                    
                    VStack(spacing: 12) {
                        
                        Image(systemName: "plus.square")
                            .font(.system(size: 25))
                        ZStack {
                            
                            Circle()
                                .fill(Color.clear)
                                .frame(width: 8, height: 8)
                            
                           
                        }
                    }}
                TabButton(image: tabs[2], selected: $currentTab, animation: animation)
                TabButton(image: tabs[3], selected: $currentTab, animation: animation)

                    
//                }
            }
            .onAppear {
                        UITabBar.appearance().isHidden = true

            }
            .padding(.horizontal, 35)
            .padding(.top)
            .padding(.bottom, safeArea?.bottom == 0 ? safeArea?.bottom : 15)
            .background(
                LinearGradient(gradient: .init(colors: [Color("g1"), Color("g2")]), startPoint: .top, endPoint: .bottom)
            )
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
var tabs = ["house", "book", "suit.heart", "person"]

struct TabButton: View {
    var image: String
    @Binding var selected : String
    var animation: Namespace.ID
    var body: some View {
        
        Button(action: {
            // changing tab..
            withAnimation(.spring()) {selected = image}
        }) {
            
            VStack(spacing: 12) {
                
                Image(systemName: image)
                    .font(.system(size: 25))
                    .foregroundColor(selected == image ? .white : .gray)
                
                ZStack {
                    
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 8, height: 8)
                    
                    if selected == image {
                        
                        Circle()
                            .fill(Color.white)
                            // smooth slide animasi...
                            .matchedGeometryEffect(id: "Tab", in: animation)
                            .frame(width: 8, height: 8)
                        
                    }
                }
            }
        }
    }
}
