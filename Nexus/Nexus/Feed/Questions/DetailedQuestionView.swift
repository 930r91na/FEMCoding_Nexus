//
//  DetailedQuestionView.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 11/11/23.
//

import SwiftUI

struct DetailedQuestionView: View {
    let question: Question
    let comments: [Comment]
    @State private var newQuestionText: String = ""
    @State private var showingDocumentPicker: Bool = false
    @State private var selectedDocumentURL: URL?
    @State private var isResponding: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Encabezado de la pregunta
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        if let user = question.user, !question.isAnonymous {
                            // Foto del usuario
                            user.profileImage
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)
                            
                            }
                        } else {
                            Image(systemName: "person.crop.circle.fill.badge.questionmark")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text("Anónimo")
                                .font(.headline)
                        }
                    }
                    

                    Text(question.title)
                        .font(.title)
                        .fontWeight(.bold)

                    Text(question.text)
                        .font(.body)
                    
                    if let fileNames = question.fileNames {
                        ForEach(fileNames, id: \.self) { fileName in
                            Text("Archivo adjunto: \(fileName)")
                                .font(.caption)
                                .foregroundColor(Color.customPurple)
                                .padding(.bottom, 2)
                        }
                    }
                }
                .padding()
                .background(Color.customPurple.opacity(0.2))
                .cornerRadius(10)
                .frame(maxWidth: .infinity)

               

                Divider()

                // Mostrar comentarios completos
                ForEach(comments) { comment in
                    VStack(alignment: .leading) {
                        HStack {
                            if let user = comment.user, !comment.isAnonymous {
                                 user.profileImage
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())

                                Text(user.name)
                                    .font(.subheadline)
                            } else {
                                Image(systemName: "person.crop.circle.fill.badge.questionmark")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("Anónimo")
                                    .font(.subheadline)
                            }
                        }

                        Text(comment.content)
                            .font(.body)
                            .padding(.vertical, 4)

                        if let attachedFileURL = comment.attachedFileURL {
                            Text("Archivo adjunto: \(attachedFileURL.lastPathComponent)")
                                .font(.caption)
                                .foregroundColor(Color.customPurple)
                        }

                        Text("Likes: \(comment.likes)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity)
                }

                Divider()

                Button("Responder") {
                    isResponding.toggle()
                }
                .font(.headline)
                .padding()
                .foregroundColor(Color.customPurple)
                
                if isResponding {
                    InputView(text: $newQuestionText, showingDocumentPicker: $showingDocumentPicker, selectedDocumentURL: $selectedDocumentURL, placeholderText: "Escribe tu respuesta aquí", onPublish: postAnswer)
                }
                Spacer()
            }
        }
        .navigationTitle("Detalle de Pregunta")
        .padding()
        .sheet(isPresented: $showingDocumentPicker) {
                    DocumentPicker(onPick: { url in
                        self.selectedDocumentURL = url
                    })
                }
    }
}
func postAnswer(){
    
}

struct DetailedQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedQuestionView(question: testQuestions[0], comments: testComments.filter { $0.questionId == testQuestions[0].id })
    }
}

