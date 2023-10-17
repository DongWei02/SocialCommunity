//
//  GuideView.swift
//  QCH
//
//  Created by David Dong on 2023/10/10.
//

import SwiftUI

struct GuideView: View {
    @State private var interests: [(String, Bool)] = [("Reading", false), ("Traveling", false), ("Cooking", false), ("Hiking", false), ("Photography", false), ("Painting", false), ("Swimming", false), ("Music", false), ("Gaming", false), ("Cycling", false), ("Dancing", false), ("Fishing", false), ("Reading1", false), ("Traveling2", false), ("Cooking3", false), ("Hiking4", false), ("Photography5", false), ("Painting6", false), ("Swimming7", false), ("Music8", false), ("Gaming9", false), ("Cycling10", false), ("Dancing11", false), ("Fishing12", false)]
    @State private var isNextPageActive: Bool = false
    
    var areAnyInterestsSelected: Bool {
        return !interests.contains { $0.1 }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(Array(interests.enumerated()), id: \.1.0) { (index, interest) in
                        InterestItemView(interest: $interests[index], name: interest.0)
                    }
                }
                
                Button(action: {
                    isNextPageActive = true
                }) {
                    Text("Next")
                        .padding()
                        .background(areAnyInterestsSelected ? Color.gray : Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(areAnyInterestsSelected)
            }
            .navigationBarItems(trailing: Button(action: {
                isNextPageActive = true
            }) {
                Text ("Select Your Interests")
                    .font(.title)
                    .foregroundColor(Color.black)
                    .padding()
                Text("Skip")
            })
            .navigationBarTitle("")
            .sheet(isPresented: $isNextPageActive) {
                NextPage(selectedInterests: interests)
            }
        }
    }
}

struct InterestItemView: View {
    @Binding var interest: (String, Bool)
    let name: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 80, height: 80)
                .foregroundColor(Color.white)
                .border(Color.black, width: 1)
            
            Text(name)
            
            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(interest.1 ? Color.green: Color.white)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 1)
                )
                .offset(x: 30, y: -30)
        }
        .onTapGesture {
            interest.1.toggle()
        }
    }
}

struct NextPage: View {
    var selectedInterests: [(String, Bool)]
    
    var body: some View {
        VStack {
            Text("Selected Interests:")
                .font(.title)
                .padding()
            
//            List(selectedInterests, id: \.self) { interest in
//                Text(interest)
//            }
//            .listStyle(PlainListStyle())
//            .padding()
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
