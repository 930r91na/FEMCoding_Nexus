//
//  FeedTabBarView.swift
//  appFCC3
//
//  Created by MacBookAir on 05/10/23.
//

import SwiftUI

enum FeedTabs: Int{
    case feed = 0
    case qna = 1
}

struct FeedTabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    var tabList: [String] = ["Feed", "Q&A"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 50){
                ForEach(Array (zip(self.tabList.indices, self.tabList)),
                        id: \.0,
                        content:{
                    index, name in FeedTabBarItem(currentTab: self.$currentTab, namespace: namespace.self, tabBarItemName: name, tab: index)
                })
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        .frame(height: 100)
        .edgesIgnoringSafeArea(.all)
    }
}
