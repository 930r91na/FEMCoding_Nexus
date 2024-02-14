//
//  Comments.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 11/11/23.
//

import Foundation

struct Comment: Identifiable {
    let id = UUID()
    let questionId: UUID
    let user: User2? // Opcional para permitir respuestas anónimas
    let isAnonymous: Bool
    let content: String
    let attachedFileURL: URL? // URL del archivo adjunto, opcional
    var likes: Int // Contador de "likes"
}

let testComments: [Comment] = [
    Comment(questionId: testQuestions[0].id, user: testUser, isAnonymous: false, content: "La computación cuántica es fascinante por sus principios de superposición y entrelazamiento.", attachedFileURL: nil, likes: 15),
    Comment(questionId: testQuestions[0].id, user: testUser2, isAnonymous: false, content: "Hay mucho por descubrir en el campo cuántico, especialmente en la criptografía.", attachedFileURL: URL(string: "file.pdf"), likes: 10),
    Comment(questionId: testQuestions[1].id, user: nil, isAnonymous: true, content: "Creo que el iPhone 12 ha sido un gran salto tecnológico.", attachedFileURL: nil, likes: 8),
    Comment(questionId: testQuestions[1].id, user: testUser3, isAnonymous: false, content: "El iPhone 11 sigue siendo mi favorito en términos de equilibrio costo-beneficio.", attachedFileURL: nil, likes: 5),
    Comment(questionId: testQuestions[2].id, user: testUser, isAnonymous: false, content: "No te pierdas visitar Kioto y sus hermosos templos.", attachedFileURL: nil, likes: 20),
    Comment(questionId: testQuestions[2].id, user: nil, isAnonymous: true, content: "Tokio es increíble, especialmente Shinjuku y Shibuya.", attachedFileURL: URL(string: "tokyo_guide.pdf"), likes: 12)
]
