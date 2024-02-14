//
//  QnAView.swift
//  Nexus
//
//  Created by MacBookAir on 05/10/23.
//
import SwiftUI

struct QnAView: View {
    @State private var isAnonymous: Bool = false
    @State private var newQuestionText: String = ""
    @State private var showingDocumentPicker: Bool = false
    @State private var selectedDocumentURL: URL?
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    @State private var isInput: Bool = false
    @State private var selectedQuestion: Question? = nil
    let questions: [Question] = testQuestions
    let allComments: [Comment] = testComments

    var body: some View {
        NavigationView {
            List {
                VStack {
                    Toggle("Modo Anónimo", isOn: $isAnonymous)
                        .padding()
                        .foregroundColor(Color.customPurple)
                    HStack {
                        Button(action: {
                            isSearching.toggle()
                        }) {
                            Text("Buscar")
                                .foregroundColor(Color.customPurple)
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.customPurple)
                        }
                        .buttonStyle(BorderlessButtonStyle())

                        Spacer()

                        Button(action: {
                            isInput.toggle()
                        }) {
                            Text("Preguntar")
                                .foregroundColor(Color.customPurple)
                            Image(systemName: "plus")
                                .foregroundColor(Color.customPurple)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .padding()

                    if isSearching {
                        TextField("Buscar por tags...", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }

                    if isInput {
                        InputView(text: $newQuestionText, showingDocumentPicker: $showingDocumentPicker, selectedDocumentURL: $selectedDocumentURL, placeholderText: "¿Qué deseas preguntar?", onPublish: createQuestion)
                    }

                }

                ForEach(filteredQuestions()) { question in
                    let commentsForQuestion = allComments.filter { $0.questionId == question.id }
                    Button(action: {
                        selectedQuestion = question
                                        }) {
                                            QuestionView(question: question, allComments: commentsForQuestion)
                                        }
                }
            }
            .listStyle(PlainListStyle())
            .sheet(isPresented: $showingDocumentPicker) {
                DocumentPicker(onPick: { url in
                    self.selectedDocumentURL = url
                })
            }
            .sheet(item: $selectedQuestion) { question in
                                DetailedQuestionView(question: question, comments: allComments.filter { $0.questionId == question.id })
            }
            .navigationTitle("Q&A")
        }
    }

    private func createQuestion() {
        // Implementar lógica de creación de la pregunta
    }

    private func filteredQuestions() -> [Question] {
        if searchText.isEmpty {
            return questions
        } else {
            return questions.filter { question in
                question.tags.contains(where: { $0.lowercased().contains(searchText.lowercased()) })
            }
        }
    }
}

struct QnAView_Previews: PreviewProvider {
    static var previews: some View {
        QnAView()
    }
}


