//
//  CheckboxView.swift
//  AppStudio
//
//  Created by Andrea Lima Blanca on 06/10/23.
//

import SwiftUI

struct CheckBoxView: View {
    @State private var isChecked: Bool = false

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack(spacing: 10) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(isChecked ? Color.white : Color.white)
                
                Text("Mantener la sesión iniciada")
                    .font(.body)
                    .foregroundColor(Color.white)
            }
            .foregroundColor(.primary)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CheckBoxView()
}
