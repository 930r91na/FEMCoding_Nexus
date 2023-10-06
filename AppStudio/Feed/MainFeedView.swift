//
//  MainFeedView.swift
//  appFCC3
//
//  Created by MacBookAir on 05/10/23.
//

import SwiftUI

//MAYBE THIS SHOULD BE A CONTAINER FOR THE TWO DIFFERENT VIEWS?

struct MainFeedView: View {
    @State var currentTab: Int = 0
    @State var feedTabSelection: FeedTabs = .feed
    
    var body: some View {
        VStack{
            ZStack (alignment: .top){
                TabView(selection: self.$currentTab){
                    FeedView().tag(0)
                    QnAView().tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                
                FeedTabBarView(currentTab: self.$currentTab)
                    .offset(y: 0)
                    .offset(x: 100)
            }
        }
    }
}

struct MainFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MainFeedView()
    }
}

