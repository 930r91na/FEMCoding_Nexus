//
//  InputView.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 11/11/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    @Binding var showingDocumentPicker: Bool
    @Binding var selectedDocumentURL: URL?
    var placeholderText: String
    var onPublish: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                TextEditor(text: $text)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 1)
                    )
                    .padding(.bottom, 8)

                if text.isEmpty {
                    Text(placeholderText)
                        .foregroundColor(.gray)
                        .padding(.all, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }

            if let url = selectedDocumentURL {
                Text(url.lastPathComponent)
                    .padding(.vertical)
            }

            HStack {
                Button(action: {
                    showingDocumentPicker = true
                }) {
                    Image(systemName: "paperclip")
                }
                .buttonStyle(PlainButtonStyle())

                Spacer()
                
                Button(action: onPublish) {
                    HStack {
                        Text("Publicar")
                        Image(systemName: "paperplane.fill")
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding()
    }
}


//struct InputView_Previews: PreviewProvider {
//    static var previews: some View {
//        InputView(text: .constant(""), showingDocumentPicker: .constant(false), selectedDocumentURL: .constant(nil), placeholderText: "Enter your text here", onPublish: <#() -> Void#>)
//    }
//}
