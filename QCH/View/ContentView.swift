//
//  ContentView.swift
//  QCH
//
//  Created by David Dong on 2023/10/16.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State var selectIndex = 0
    
    var body: some View {
        TabView(selection: $selectIndex) {
            GuideView()
                .tabItem {
                    Image("tab_home")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Guide")
                }
                .tag(0)
            MineView()
                .tabItem {
                    Image("朋友圈")
                        .renderingMode(.template)
                    Text("朋友圈")
                }
            MarketingView()
                .tabItem {
                    Image("tab_category")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("Mall")
                }
                .tag(1)
            MineView()
                .tabItem {
                    Image("tab_me")
                        .renderingMode(.template)
                    Text("Me")
                }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
