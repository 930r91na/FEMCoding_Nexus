//
//  AuthViewModel.swift
//  Nexus
//
//  Created by Azuany Mila Cerón on 09/11/23.
//

import SwiftUI
import FirebaseAuth

final class AuthViewModel: ObservableObject {
    
    var user: User? {
        didSet {
            objectWillChange.send()
            
            if self.user?.uid != nil {
                //UserInfo.shared.fetchUser(uid: self.user!.uid)
                //MatchModel.shared.fetchUsers()
            }
        }
    }

    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
            if self.user?.uid != nil {
                UserInfo.shared.fetchUser(uid: self.user!.uid)
                    
                if UserInfo.shared.id != "" {
                    MatchModel.shared.fetchUsers()
                }
            }
        }
    }

    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("an error occured: \(error.localizedDescription)")
                return
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
            if let e = error {
                completion(e)
            } else {
                print("Login success")
                completion(nil)
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
