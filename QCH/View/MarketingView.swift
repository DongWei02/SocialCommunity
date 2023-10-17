//
//  Marketing.swift
//  QCH
//
//  Created by David Dong on 2023/10/11.
//

import Foundation
import SwiftUI

struct MenuData: Hashable {
    var name: String
    var image: String
}

struct MarketingView: View {
    @State private var menuListData: [MenuData] = [
        MenuData(name:"菜系", image: "菜系"),
        MenuData(name:"食材", image:"nbn_rou"),
        MenuData(name:"菜式", image:"堂食"),
        MenuData(name:"潮流菜", image:"特色菜系"),
        MenuData(name:"材料", image:"nbn_rou"),
        MenuData(name:"中式休闲", image:"火锅"),
        MenuData(name:"酱汁配方", image:"调料"),
        MenuData(name:"官方推荐", image:"推荐")
    ]
    @State private var marketingData: [(String, String)] = []
    
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 40)
                    .foregroundColor(.gray.opacity(0.1))
//                    .background(.gray.opacity(0.1))
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                            
                            Text("搜搜菜谱、食材、口味")
                                .frame(height: 40)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 0)
                                .foregroundColor(.gray.opacity(0.4))
                                .cornerRadius(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    )
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.white)
                    .overlay(
                        ZStack {
                            Image(systemName: "calendar")
                                .frame(width: 40, height: 40)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(20)
                            
                            Text("签到")
                                .frame(width: 36)
                                .font(.system(size: 14, weight: .regular))
                                .background(Color.orange)
                                .foregroundColor(Color.white)
                                .cornerRadius(6)
                                .offset(x: 20, y: -20)
                        }
                    )
            }
            
            GridView(columns: 4) {
                ForEach(menuListData, id: \.self) { menuData in
                    MenuView(imageName: menuData.image, text: menuData.name)
                }
            }
        }.padding(20)
    }
}


struct MenuView: View {
    var imageName: String
    var text: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
            Text(text)
                .font(.footnote)
        }
    }
}

struct NavigationButton: View {
    var imageName: String
    var text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 24))
            Text(text)
                .font(.footnote)
        }
    }
}


// 自定义GridView
struct GridView<Content>: View where Content: View {
    let columns: Int
    let content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            let columnWidth = geometry.size.width / CGFloat(columns)
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: columns), spacing: 10) {
                    ForEach(0..<columns, id: \.self) { index in
                        content()
                            .frame(width: columnWidth - 10, height: columnWidth - 10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                }
                .padding(10)
            }
        }
    }
}

struct MarketingView_Previews: PreviewProvider {
    static var previews: some View {
        MarketingView()
    }
}
