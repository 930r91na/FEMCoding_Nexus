//
//  Notifications.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 12/11/23.
//

import Foundation

struct NotificationItem: Identifiable {
    let id = UUID()
    var content: String
    var isInformative: Bool
    var action: (() -> Void)?
}

var notifications: [NotificationItem] = [
    
        NotificationItem(content: "Bienvenido a Nexus!", isInformative: true),
        NotificationItem(content: "Tu contraseña ha sido reseteada", isInformative: false),
        NotificationItem(content: "TU solicitud de mentoría ha sido acptada!", isInformative: true),
        NotificationItem(content: "Solicitud de mentoría", isInformative: false),
    ]
