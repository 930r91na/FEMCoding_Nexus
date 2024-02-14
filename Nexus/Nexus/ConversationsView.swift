//
//  ConversationsView.swift
//  Nexus
//
//  Created by Andrea Lima Blanca on 30/10/23.
//

import SwiftUI
import Firebase

struct ConversationsView: View {
    @State private var conversations = [Conversation]()
    
    var body: some View {
        NavigationView {
            List(conversations) { conversation in
                NavigationLink(destination: ChatView(conversationId: conversation.id)) {
                    VStack(alignment: .leading) {
                        Text("Conversación con: \(conversation.userNames.joined(separator: ", "))") // Aquí deberías reemplazar esto con el nombre del usuario
                        Text(conversation.lastMessage)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .onAppear(perform: loadConversations)
            .navigationTitle("Chats")
        }
    }
    
    func loadConversations() {
        // let ref = Database.database().reference()
        // let userId = UserInfo.shared.id
        
        /*ref.child("conversations").queryOrdered(byChild: userId).queryEqual(toValue: true).observe(.childAdded) { snapshot in
            if let dict = snapshot.value as? [String: Any],
               let lastMessage = dict["lastMessage"] as? String,
               let timestamp = dict["timestamp"] as? TimeInterval {
                
                let userIds = Array(dict.keys).filter { $0 != "lastMessage" && $0 != "timestamp" }
                let conversation = Conversation(id: snapshot.key, userIds: userIds, lastMessage: lastMessage, timestamp: timestamp)
                conversations.append(conversation)
            }
        }*/
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
