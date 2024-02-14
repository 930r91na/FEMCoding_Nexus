//
//  UserModel.swift
//  Nexus
//
//  Created by Azuany Mila Cerón on 10/11/23.
//

import Foundation
import FirebaseFirestore

final class UserInfo {
    
    static var shared = UserInfo()
    
    var id: String = ""
    var username: String = ""
    var bio: String = ""
    var location: String = ""
    var career: String = ""
    var semester: Int = 0
    var age: Int = 0
    var ig: String = ""
    var tw: String = ""
    var about: String = ""
    var institution: String = ""
    var interests0: String = ""
    var interests1: String = ""
    var interests2: String = ""
    var gender: String = ""
    var mentor: Bool = false
    var profileImage: String = ""
    var extraImages: [String] = []
    var mentorees: [String] = [] // id's of mentorees
    var mentees: [String] = [] // id's of mentees
    
    
    func fetchUser(uid: String) {
        
        /*Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if error != nil {
                print("Error retrieving information \(error?.localizedDescription ?? "")")
            }
            else {
                self.id = snapshot!.get("id") as! String
                self.username = snapshot?.get("name") as! String
                self.bio = snapshot?.get("bio") as! String
                self.location = snapshot?.get("location") as! String
                self.career = snapshot?.get("career") as! String
                self.semester = snapshot?.get("semester") as! Int
                self.age = snapshot?.get("age") as! Int
                self.ig = snapshot?.get("ig") as! String
                self.tw = snapshot?.get("tw") as! String
                self.about = snapshot?.get("about") as! String
                self.institution = snapshot?.get("institution") as! String
                self.interests0 = snapshot?.get("interests0") as! String
                self.interests1 = snapshot?.get("interests1") as! String
                self.interests2 = snapshot?.get("interests2") as! String
                self.gender = snapshot?.get("gender") as! String
                self.profileImage = snapshot?.get("profileImageUrl") as! String
                self.mentor = snapshot?.get("mentor") as! Bool
            }
        }*/
        
        Firestore.firestore().collection("users").document(uid).addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            guard let data = document.data() else {
                print("Document data was empty.")
                return
            }
            print("Current data: \(data)")
            
            self.id = data["id"] as! String
            self.username = data["name"] as! String
            self.bio = data["bio"] as! String
            self.location = data["location"] as! String
            self.career = data["career"] as! String
            self.semester = data["semester"] as! Int
            self.age = data["age"] as! Int
            self.ig = data["ig"] as! String
            self.tw = data["tw"] as! String
            self.about = data["about"] as! String
            self.institution = data["institution"] as! String
            self.interests0 = data["interests0"] as! String
            self.interests1 = data["interests1"] as! String
            self.interests2 = data["interests2"] as! String
            self.gender = data["gender"] as! String
            self.profileImage = data["profileImageUrl"] as! String
            self.mentor = data["mentor"] as! Bool
            
            if let mentoreesArray = data["mentorees"] as? [String] {
                    self.mentorees = mentoreesArray
            } else {
                print("Error: mentorees is not an array of strings or is missing.")
                       self.mentorees = [] // or handle the error appropriately
            }

            if let menteesArray = data["mentees"] as? [String] {
                       self.mentees = menteesArray
            } else {
                print("Error: mentees is not an array of strings or is missing.")
                       self.mentees = [] // or handle the error appropriately
            }
        }
    }
}
