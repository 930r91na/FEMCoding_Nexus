//
//  TabBar.swift
//  Nexus
//
//  Created by Andrea Lima Blanca on 05/10/23.
//

import SwiftUI

struct AppTabBarView: View {
    
    //@State private var viewModel = ProfileViewModel()
    
    @State private var selection: String = "profile"
    @State private var tabSelection: MainTabBarItem = .feed
    
    var body: some View {
        MainTabBarContainerView(selection: $tabSelection) {
            
            ProfileView()
                .mainTabBarItem(tab: .profile, selection: $tabSelection)
            CView()
                .mainTabBarItem(tab: .people, selection: $tabSelection)
            MainFeedView()
                .mainTabBarItem(tab: .feed, selection: $tabSelection)
            ConversationsView()
                .mainTabBarItem(tab: .chat, selection: $tabSelection)
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBarView()
            .environmentObject(AuthViewModel())
    }
}
