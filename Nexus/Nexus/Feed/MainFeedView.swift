//
//  MainFeedView.swift
//  Nexus
//
//  Created by MacBookAir on 05/10/23.
//

import SwiftUI

struct MainFeedView: View {
    @State var currentTab: Int = 0
    @State var feedTabSelectauthion: FeedTabs = .feed
    
    var body: some View {
        ZStack {
            VStack{
                ZStack(alignment: .top) {
                    TabView(selection: self.$currentTab) {
                        FeedTabBarView(currentTab: $currentTab)
                                        .padding(.top)
                        
                        FeedView(posts: examplePosts)
                            .tag(0)
                        
                        QnAView()
                            .tag(1)
                        
                        Opportunities()
                            .tag(2)
                    }
                    //.tabViewStyle(.page(indexDisplayMode: .never))
                    .edgesIgnoringSafeArea(.all)
                    
                    FeedTabBarView(currentTab: self.$currentTab)
                        .offset(y: 0)
                        .offset(x: 15)
                    
                    
                    
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
        
}

struct MainFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MainFeedView()
    }
}
