//
//  MineView.swift
//  QCH
//
//  Created by David Dong on 2023/10/16.
//

import Foundation
import SwiftUI

struct MineView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: GuideView()) {
                        Text("My Favorite")
                    }
                }
                Section {
                    HStack {
                        Text("Clear Cache")
                        Spacer()
                    }
                }
                Section {
                    Text("意见反馈")
                    Text("点个赞")
                    HStack {
                        Text("版本")
                        Spacer()
                    }
                }
                Section {
                    Text("推荐给好友")
                }
            }
            .listStyle(GroupedListStyle())
            .listRowInsets(EdgeInsets())
            .navigationBarTitle("Me", displayMode: .inline)
        }
        .onAppear {
            
        }
    }
}

struct MineView_previews: PreviewProvider {
    static var previews: some View {
        MineView()
    }
}
