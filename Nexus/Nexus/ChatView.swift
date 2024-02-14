//
//  ChatView.swift
//  Nexus
//
//  Created by MacBookAir on 05/10/23.
//

import SwiftUI
import Firebase

struct ChatView: View {
    var conversationId: String
    @State private var messageText = ""
    @State private var messages = [Message]()
    
    let receiverId = "userId2" // ID del usuario con el que estás chateando
    
    var body: some View {
        ZStack{
            VStack {
                Text("Chat")
                    .font(.title)
                List(messages) { message in
                    HStack {
                        if message.senderId == UserInfo.shared.id {
                            Spacer()
                            Text(message.text)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        } else {
                            Text(message.text)
                                .padding()
                                .background(Color.gray)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                }
                .onAppear(perform: loadMessages)
                
                HStack {
                    TextField("Escribe un mensaje...", text: $messageText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: sendMessage) {
                        Text("Enviar")
                    }
                }
                .padding()
            }
        }
    }
    
    func loadMessages() {
       /* let ref = Database.database().reference()
                ref.child("messages").child(conversationId).observe(.childAdded) { snapshot in
            if let dict = snapshot.value as? [String: Any],
               let senderId = dict["senderId"] as? String,
               let receiverId = dict["receiverId"] as? String,
               let text = dict["text"] as? String,
               let timestamp = dict["timestamp"] as? TimeInterval {
                
                let message = Message(id: snapshot.key, senderId: senderId, receiverId: receiverId, text: text, timestamp: timestamp)
                messages.append(message)
            }
        }*/
    }
    
    func sendMessage() {
        guard !messageText.isEmpty else { return }
        
        let ref = Database.database().reference()
        let senderId = Auth.auth().currentUser?.uid ?? ""
        let timestamp = Date().timeIntervalSince1970
        
        let message = [
            "senderId": senderId,
            "receiverId": receiverId,
            "text": messageText,
            "timestamp": timestamp
        ] as [String : Any]
        
        ref.child("messages").childByAutoId().setValue(message)
        messageText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(conversationId: "exampleConversationId")
    }
}
