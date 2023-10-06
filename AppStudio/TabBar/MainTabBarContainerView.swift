//
//  MainTabBarContainerView.swift
//  appFCC3
//
//  Created by MacBookAir on 04/10/23.
//

import SwiftUI



struct MainTabBarContainerView<Content:View>: View {
    
    @Binding var selection: MainTabBarItem
    let content: Content
    @State private var tabs: [MainTabBarItem] = []
    
    
    init(selection: Binding<MainTabBarItem>, @ViewBuilder content: () -> Content){
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack (spacing: 0) {
            ZStack{
                content
            }
            MainTabBarView(tabs: tabs, tabSelection: $selection, localSelection: selection)
            
        }
        .onPreferenceChange( MainTabBarsItemsPreferenceKey.self, perform: {value in self.tabs = value})
    }
}

struct MainTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [MainTabBarItem] = []
    
    static var previews: some View {
        MainTabBarContainerView(selection: .constant(tabs.first!)){
        }
    }
}
