//
//  Questions.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 10/11/23.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    let fileNames: [String]? // Archivos adjuntos, opcional
    let user: User2? // Usuario que hace la pregunta, opcional para anonimato
    let isAnonymous: Bool
    var upvotes: Int // Contador de votos
    var voters: Set<UUID> // Conjunto de IDs de usuarios que han votado, para evitar duplicados
    let tags: [String] // Etiquetas o categorías de la pregunta

    mutating func upvote(by voter: UUID) {
        if !voters.contains(voter) {
            upvotes += 1
            voters.insert(voter)
        }
    }
}

let testQuestions: [Question] = [
    Question(title: "Explorando la Computación Cuántica", text: "¿Cómo funciona la computación cuántica?", fileNames: ["quantum.pdf"], user: testUser2, isAnonymous: false, upvotes: 10, voters: Set(), tags: ["Tecnología", "Educación"]),
    Question(title: "Debate sobre iPhone", text: "¿Cuál es el mejor modelo de iPhone hasta la fecha?", fileNames: nil, user: nil, isAnonymous: true, upvotes: 5, voters: Set(), tags: ["Apple", "Opinión"]),
    Question(title: "Viajando a Japón", text: "¿Alguien tiene recomendaciones de lugares para visitar en Japón?", fileNames: ["japan_photo.jpg"], user: testUser3, isAnonymous: false, upvotes: 8, voters: Set(), tags: ["Viajes", "Cultura"])
]
