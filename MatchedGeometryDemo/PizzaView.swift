//
//  PizzaView.swift
//  MatchedGeometryDemo
//
//  Created by Steven Lipton on 11/8/20.
//
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 13 (Q01 2021) video 08
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
//This Week:  Use the `.matchedGeometryEffect`  for move animations betwen views
//  For more code, go to http://bit.ly/AppPieGithub

// a Simple view to use as a cell in the collections. 
import SwiftUI

struct PizzaView: View {
    var size:CGFloat = 100
    var menuItem:Menu
    init(menuItem:Menu){
        self.menuItem = menuItem
    }
    var body: some View {
        ZStack {
            Image("\(menuItem.id)_100w").resizable()
            VStack {
                Text(menuItem.name)
                    .font(size > 250 ? .title : .caption)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius:5).fill(Color.secondary))
                Spacer()
            }
        }
        .frame(width: size, height: size * (2.0 / 3.0))
        .cornerRadius(size > 250 ? 20 : 10)
    }
}

struct PizzaView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaView(menuItem: Menu.huliChicken)
    }
}
