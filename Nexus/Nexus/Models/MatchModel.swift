//
//  MatchModel.swift
//  Nexus
//
//  Created by Azuany Mila Cerón on 10/11/23.
//

import SwiftUI
import FirebaseFirestore

struct OtherUser : Identifiable {
    var id: String
    var name: String
    var bio: String
    var location: String
    var career: String
    var semester: Int
    var age: Int
    var ig: String
    var tw: String
    var about: String
    var institution: String
    var interests0: String
    var interests1: String
    var interests2: String
    var gender: String
    var mentor: Bool
    var profileImage: String
}


final class MatchModel {
    
    static var shared = MatchModel()
    
    var matchedUsers : [OtherUser] = []
    
    let db = Firestore.firestore()
    
    func fetchUsers() {
        
        let query = db.collection("users").whereField("id", isNotEqualTo: UserInfo.shared.id).whereFilter(Filter.orFilter([
            Filter.whereField("institution", isEqualTo: UserInfo.shared.institution),
            Filter.whereField("location", isEqualTo: UserInfo.shared.location)
        ]))
            query.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                      
                    
                    let id = document.get("id") as! String
                    let name = document.get("name") as! String
                    let bio = document.get("bio") as! String
                    let location = document.get("location") as! String
                    let career = document.get("career") as! String
                    let semester = document.get("semester") as! Int
                    let age = document.get("age") as! Int
                    let ig = document.get("ig") as! String
                    let tw = document.get("tw") as! String
                    let about = document.get("about") as! String
                    let institution = document.get("institution") as! String
                    let interests0 = document.get("interests0") as! String
                    let interests1 = document.get("interests1") as! String
                    let interests2 = document.get("interests2") as! String
                    let gender = document.get("gender") as! String
                    let profileImage = document.get("profileImageUrl") as! String
                    let mentor = document.get("mentor") as! Bool

                    self.matchedUsers.append(OtherUser(id: id, name: name, bio: bio, location: location, career: career, semester: semester, age: age, ig: ig, tw: tw, about: about, institution: institution, interests0: interests0, interests1: interests1, interests2: interests2, gender: gender, mentor: mentor, profileImage: profileImage))
              }
            }
          }
        
        
        
    }
    
    
    
}

