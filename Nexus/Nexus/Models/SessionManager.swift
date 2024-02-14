//
//  SessionManager.swift
//  Nexus
//
//  Created by Azuany Mila Cerón on 06/11/23.
//

import Foundation

class UserSessionManager: ObservableObject {
    
    enum CurrentState {
        case loggedIn
        case loggedOut
    }
    
    @Published private(set) var currentState: CurrentState?
    
    func signIn() {
        currentState = .loggedIn
    }
    
    func signOut() {
        currentState = .loggedOut
    }
}

