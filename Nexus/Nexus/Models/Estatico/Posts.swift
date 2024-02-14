//
//  Posts.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 09/11/23.
//

import Foundation
import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let text: String
    let imageName: String? // Optional, since not all posts may have images
    let user: User2
}


let examplePosts: [Post] = [
    Post(text: "Les comparto el resultado de la práctica de laboratorio de hoy. Estoy muy orgullosa de mi equipo", imageName: "Project", user: testUser),
    Post(text: "La frase del día es: 'Science and everyday life cannot and should not be separated' - Rosalind Franklin", imageName: nil, user: testUser3),
    Post(text: "Hola, estoy creando un grupo para la clase de Cálculo III. Las reuniones serán todos los Jueves a las 4:30 en la biblioteca. Las interesadas mandenme DM :)", imageName: nil, user: testUser2),
    Post(text: "Estoy enormemente agradecida con mi tutora de tésis la Dra.L por siempre brindarme ayuda y consejos", imageName: "withTutor", user: testUser3),
    Post(text: "Como todas sabrán ya, balancear el aspecto académico con el personal no es broma! Mi más grande tip es: dedicarle una hora cada día a algo que amen que no esté relacionado con académico.", imageName: nil, user: testUser),
    Post(text: "Bienvenido al feed!", imageName: "Image", user: testUser2),
    Post(text: "Checa esta foto!", imageName: "Image1", user: testUser),
    Post(text: "Hoy es un hermoso día para estudiar.", imageName: nil, user: testUser3)
]



