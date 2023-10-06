//
//  MainTabBarItemsPreferenceKey.swift
//  AppStudio
//
//  Created by Andrea Lima Blanca on 05/10/23.
//

import Foundation
import SwiftUI


struct MainTabBarsItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [MainTabBarItem] = []
    
    static func reduce(value: inout [MainTabBarItem], nextValue: () -> [MainTabBarItem]) {
        value += nextValue()
    }
}

struct MainTabBarItemViewModifier: ViewModifier {
    let tab: MainTabBarItem
    @Binding var selection: MainTabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0: 0.0)
            .preference(key: MainTabBarsItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    func mainTabBarItem (tab: MainTabBarItem, selection: Binding<MainTabBarItem>) -> some View {
        self
            .modifier(MainTabBarItemViewModifier(tab: tab, selection: selection))
    }
}

