//
//  CarouselView.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 11/11/23.
//

import SwiftUI

let testUserIds = [testUser.id, testUser2.id, testUser3.id]

struct CarouselView: View {
    var ids: [String]

    func fetchUser(by id: String) -> User2? {
        return allUsers.first(where: { $0.id == id })
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(ids.compactMap(fetchUser), id: \.id) { person in
                    VStack {
                        person.profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        NavigationLink(destination: ChatView(conversationId: person.id )) {
                            Text(person.name)
                                .lineLimit(1)
                                .truncationMode(.tail)
                                .foregroundColor(Color.customPurple)
                        }
                    }
                }
            }.padding(.horizontal)
            .background(Color.white)
            .cornerRadius(10) 
        }
    }
}






#Preview {
    CarouselView(ids: testUserIds)
}
