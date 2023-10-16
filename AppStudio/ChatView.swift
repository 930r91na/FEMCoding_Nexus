import SwiftUI

struct Chat: Identifiable {
    var id = UUID()
    var name: String
    var lastMessage: String
    var lastMessageDate: String
    var avatar: String
}

struct ChatMessage {
    var sender: String
    var text: String
    var isSender: Bool
}

struct ChatView: View {
    let chats: [Chat] = [
        Chat(name: "Justin", lastMessage: "Hey! Wanna catch up for a movie?", lastMessageDate: "2 hours ago", avatar: "person.fill"),
        // ... more chat previews
    ]
    
    var body: some View {
        NavigationView {
            List(chats) { chat in
                NavigationLink(destination: DetailedChatView(name: chat.name)) {
                    HStack {
                        Image(systemName: chat.avatar)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(chat.name)
                                .font(.headline)
                            Text(chat.lastMessage)
                                .font(.subheadline)
                        }
                        Spacer()
                        Text(chat.lastMessageDate)
                            .font(.caption)
                    }
                }
            }
            .navigationBarTitle("Messages", displayMode: .large)
        }
    }
}

struct DetailedChatView: View {
    var name: String
    @State private var messageText: String = ""
    
    var messages: [ChatMessage] = [
        ChatMessage(sender: "Justin", text: "Hey! Wanna catch up for a movie?", isSender: false),
        // ... add more detailed messages
    ]
    
    var body: some View {
        VStack {
            List(messages, id: \.text) { msg in
                HStack {
                    if msg.isSender {
                        Spacer()
                        Text(msg.text)
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(Color.darkPurple)
                            .cornerRadius(15)
                    } else {
                        Text(msg.text)
                            .padding(10)
                            .foregroundColor(Color.darkPurple)
                            .background(Color.sunsetOrange.opacity(0.3))
                            .cornerRadius(15)
                        Spacer()
                    }
                }
            }
            
            HStack {
                TextField("Type your message...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    // TODO: Send the message
                }) {
                    Image(systemName: "paperplane.fill")
                }
            }
            .padding()
        }
        .navigationBarTitle(name, displayMode: .inline)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
