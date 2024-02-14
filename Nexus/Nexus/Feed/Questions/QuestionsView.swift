//
//  QuuestionsView.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 10/11/23.
//

import SwiftUI

struct QuestionView: View {
    @State private var isAnonymous: Bool = false
    @State private var newQuestionText: String = ""
    @State private var showingDocumentPicker: Bool = false
    @State private var selectedDocumentURL: URL?
    let question: Question
    let allComments: [Comment]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Mostrar texto de la pregunta
            Text(question.title)
                .font(.headline)
                .padding(.bottom, 2)
                .foregroundColor(Color.customPurple)
            
            Text(question.text)
                .font(.caption)
                .padding(.bottom, 2)

            // Mostrar información del usuario si no es anónima
            if let user = question.user, !question.isAnonymous {
                Text("Pregunta hecha por: \(user.name)")
                    .font(.caption2)
                    .foregroundColor(.gray)
            } else {
                Text("Pregunta Anónima")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }

            // Mostrar etiquetas
            HStack {
                ForEach(question.tags, id: \.self) { tag in
                    Text("#\(tag)")
                        .font(.caption)
                        .foregroundColor(Color.customPurple)
                }
            }

            // Mostrar contador de votos
            HStack {
                Image(systemName: "hand.thumbsup")
                Text("\(question.upvotes)")
            }
            .font(.caption)
            .foregroundColor(.gray)
            let topCommentsForQuestion = topComments(forQuestionId: question.id, from: allComments)
                        ForEach(topCommentsForQuestion, id: \.id) { comment in
                            CommentView(comment: comment)
                        }
        }
        .padding()
    }
}

func topComments(forQuestionId questionId: UUID, from comments: [Comment]) -> [Comment] {
    return comments.filter { $0.questionId == questionId }
                   .sorted { $0.likes > $1.likes }
                   .prefix(3)
                   .map { $0 }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: testQuestions[0], allComments: testComments)
    }
}
