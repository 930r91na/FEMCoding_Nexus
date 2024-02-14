//
//  HomeView.swift
//  Nexus
//
//  Created by Azuany Mila Cerón on 06/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    
    var body: some View {
        Group {
            
            AppTabBarView()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthViewModel())
}
