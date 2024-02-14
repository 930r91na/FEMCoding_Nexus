//
//  Message.swift
//  Nexus
//
//  Created by Azuany Mila Cerón on 07/11/23.
//

import SwiftUI

struct Message: Identifiable {
    var id: String
    var senderId: String
    var receiverId: String
    var text: String
    var date: Date
}


var allMessages : [Message] = [message1, message2, message3]

let message1 = Message(id: UUID().uuidString, senderId: testUser.id, receiverId: currentUser.id, text: "Hola", date: Date())

let message2 = Message(id: UUID().uuidString, senderId: currentUser.id, receiverId: testUser.id, text: "Hola", date: Date())

let message3 = Message(id: UUID().uuidString, senderId: testUser.id, receiverId: currentUser.id, text: "¿Cómo estás?", date: Date())


struct Conversation: Identifiable {
    var id: String
    var userNames: [String]
    var lastMessage: String
    var date: Date
}


var allConversations : [Conversation] = [conversation1, conversation2, conversation3]

let conversation1 = Conversation(id: UUID().uuidString, userNames: [testUser.name, currentUser.name], lastMessage: "Hola", date: Date())

let conversation2 = Conversation(id: UUID().uuidString, userNames: [testUser2.name, currentUser.name], lastMessage: "Hola", date: Date())

let conversation3 = Conversation(id: UUID().uuidString, userNames: [testUser3.name, currentUser.name], lastMessage: "¿Cómo estás?", date: Date())

