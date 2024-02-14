//
//  User.swift
//  AppStudio
//
//  Created by Azuany Mila Cerón on 04/11/23.
//

import SwiftData
import SwiftUI

struct User2 : Identifiable {
    @Attribute(.unique) var id: String
    var email: String
    var password: String
    var name: String
    var bio: String
    var location: String
    var about: String
    var gender: String
    var ig: String
    var tw: String
    var institution: String
    var interests0: String
    var interests1: String
    var interests2: String
    var semester: Int
    var age: Int
    var mentor: Bool
    var profileImage: Image
    var career : String
    var images: [UIImage]
    
    init(email: String, password: String, name: String, bio: String, location: String, about: String, gender: String, ig: String, tw: String, institution: String, interest0: String, interest1: String, interest2: String, semester: Int, age: Int, mentor: Bool, profileImage: Image, career: String, images: [UIImage]) {
        self.id = UUID().uuidString
        self.email = email
        self.password = password
        self.name = name
        self.bio = bio
        self.location = location
        self.about = about
        self.gender = gender
        self.ig = ig
        self.tw = tw
        self.institution = institution
        self.interests0 = interest0
        self.interests1 = interest1
        self.interests2 = interest2
        self.semester = semester
        self.age = age
        self.mentor = mentor
        self.profileImage = profileImage
        self.career =  career
        self.images = images
    }
}

let allUsers = [testUser, testUser2,testUser3]

var currentUser = User2(email: "", password: "", name: "", bio: "", location: "", about: "", gender: "", ig: "", tw: "", institution: "", interest0: "", interest1: "", interest2: "", semester: 0, age: 0, mentor: false, profileImage: Image("persona"), career: "", images: [])


let testUser = User2(email: "aurora@gmail.com", password: "password", name: "Aurora", bio: "Hola, soy Aurora, una apasionada estudiante de tercer semestre en Sistemas Computacionales en la UDLAP. Me fascina explorar el vasto mundo de la computación cuántica y tengo un especial interés en todo lo relacionado con Apple y la cultura japonesa. En mi tiempo libre, me encanta sumergirme en proyectos creativos y estar activa en redes sociales.", location: "Puebla, México", about: "Soy estudiante de sistemas computacionales", gender: "Femenino", ig: "azurora", tw: "aurora", institution: "UDLAP", interest0: "Computación cuántica", interest1: "Apple", interest2: "Japón", semester: 3, age: 19, mentor: false, profileImage: Image( "persona1"), career: "Sistemas Computacionales", images: [])

let testUser2 = User2(email: "amalia@gmail.com", password: "password", name: "Amalia", bio: "Soy Amalia, una estudiante de tercer semestre en Sistemas Computacionales en la prestigiosa UDLAP. A mis 19 años, he desarrollado un fuerte interés en la computación cuántica, admirando la innovación constante de Apple y encontrando inspiración en la rica cultura de Japón. Aunque joven, soy ambiciosa y siempre busco formas de aplicar mi aprendizaje en situaciones reales. ", location: "Puebla, México", about: "Soy estudiante de sistemas computacionales", gender: "Femenino", ig: "amalia", tw: "amalia", institution: "UDLAP", interest0: "Computación cuántica", interest1: "Apple", interest2: "Japón", semester: 3, age: 19, mentor: false, profileImage: Image( "persona111"), career: "Sistemas Computacionales", images: [])

let testUser3 = User2(email: "berenice@gmail.com", password: "password", name: "Berenice", bio: "Me llamo Berenice, una entusiasta estudiante de Sistemas Computacionales en la BUAP, actualmente cursando mi tercer semestre", location: "Puebla, México", about: "Soy estudiante de sistemas computacionales", gender: "Femenino", ig: "berenice", tw: "berenice", institution: "BUAP", interest0: "Computación cuántica", interest1: "Mecanica", interest2: "Japón", semester: 3, age: 19, mentor: false, profileImage: Image( "persona22"), career: "Sistemas Computacionales", images: [])
