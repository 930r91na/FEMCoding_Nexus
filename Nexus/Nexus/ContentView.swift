//
//  ContentView.swift
//  Nexus
//
//  Created by Azuany Mila Cerón on 08/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        
        Group {
            
            if authModel.user != nil {
                HomeView()
            } else {
                LaunchView()
            }
        }.onAppear {
            authModel.signOut()
            authModel.listenToAuthState()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
