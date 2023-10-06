//
//  FeedTabBarItem.swift
//  appFCC3
//
//  Created by MacBookAir on 05/10/23.
//

import SwiftUI

struct FeedTabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View{
        Button {
            self.currentTab = tab
        } label: {
            VStack{
                Spacer()
                Text(tabBarItemName)
                    .font(.title2)
                if currentTab == tab {
                    Color.customPurple
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "underline", in: namespace , properties: .frame)
                } else{
                    Color.clear.frame(height: 2)
                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}
