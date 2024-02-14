//
//  CommentView.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 10/11/23.
//
import SwiftUI

struct CommentView: View {
    let comment: Comment

    var body: some View {
        HStack {
            Text(comment.content)
                .lineLimit(1)
                .truncationMode(.tail)
                .font(.caption)
                .foregroundColor(.secondary)

            Spacer()

            if !comment.isAnonymous, let user = comment.user {
                Text("- \(user.name)")
                    .font(.caption2)
                    .foregroundColor(.gray)
            } else {
                Text("- Anónimo")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: testComments[0])
    }
}
