//
//  OrderView.swift
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

import SwiftUI

struct OrderView: View {
    let columns = Array(repeating:GridItem(spacing:1),count:3)
    let menu = Menu.fullMenu
    @State private var selectedIDs: Set<Menu.ID> = []
    @State private var switched: Bool = true
//MARK:- Main Body
    //Uses computed variables for the views.
    var body: some View {
        VStack {
            titleView
            gridView
            Divider()
            Spacer()
            selectedView
        }
    }
 //MARK:- Actions
    func selectedItem(id:Int){
        selectedIDs.insert(id)
    }
    func deselectedItem(id:Int){
        selectedIDs.remove(id)
    }
    
//MARK: - Subviews
    var titleView: some View{
        HStack{
            if switched{
                Text("Pizza Order").font(.title)
                RoundedRectangle(cornerRadius:15).frame(height:60)
                    .foregroundColor(.green)
                    
            } else {
                RoundedRectangle(cornerRadius:15).frame(height:100)
                    .foregroundColor(.blue)
                    
                Text("Pizza Order").font(.title)
            }
        }.onTapGesture{
            
                switched.toggle()
            
        }
    }
    
    
    var gridView: some View{
        LazyVGrid(columns:columns){
            ForEach( Menu.fullMenu.filter { !selectedIDs.contains($0.id) }){ item in
                Button(action:{
                        
                            selectedItem(id: item.id)
                        
                })
                {
                    PizzaView(menuItem: item)
                }
                
            }
        }
    }
    
    var selectedView: some View{
        ScrollView(.horizontal){
            HStack{
                ForEach( Menu.fullMenu.filter { selectedIDs.contains($0.id) }){ item in
                    Button(action:{
                        
                            deselectedItem(id: item.id)
                        
                    })
                    {
                        PizzaView(menuItem: item)
                    }
                    
                }
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
