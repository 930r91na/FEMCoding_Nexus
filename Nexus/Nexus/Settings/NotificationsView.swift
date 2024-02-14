//
//  Notifications.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 08/11/23.
//

import SwiftUI

struct NotificationsView: View {

    var body: some View {
        NavigationView {
            if notifications.isEmpty {
                Text("No Notificaciones")
                    .foregroundColor(.secondary)
                    .font(.title)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List {
                    ForEach(notifications) { notification in
                        NotificationRow(notification: notification)
                            .swipeActions {
                                Button(role: .destructive) {
                                    withAnimation {
                                        notifications.removeAll { $0.id == notification.id }
                                    }
                                } label: {
                                    Label("Eliminar", systemImage: "Basura")
                                }
                            }
                    }
                }
                .navigationTitle("Notificaciones")
            }
        }
    }
}

struct NotificationRow: View {
    var notification: NotificationItem

    var body: some View {
        HStack {
            Text(notification.content)
            Spacer()
            if !notification.isInformative {
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.gray)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            notification.action?()
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
