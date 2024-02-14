//
//  CustomTextField.swift
//  Nexus
//
//  Created by Azuany Mila Cerón on 04/11/23.
//

import SwiftUI

// Extensión y CustomTextField mantienen su definición
struct CustomTextfield: View {
    var placeHolder: String
    var imageName: String
    var bColor: Color
    @Binding var value: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.white)
            TextField(placeHolder, text: $value)
                .padding()
                .foregroundColor(.white)
                .background(bColor.opacity(0.2))  // Opacidad reducida
                .cornerRadius(10)
                .frame(width: UIScreen.main.bounds.width - 60)
        }
        .padding(.horizontal, 20)
    }
}

struct CustomTextfield2: View {
    var placeHolder: String
    var bColor: Color
    @Binding var value: String
    
    var body: some View {
        HStack {
            TextField(placeHolder, text: $value)
                .padding()
                .foregroundColor(.black)
                .background(bColor.opacity(0.2))  // Opacidad reducida
                .cornerRadius(10)
                .frame(width: UIScreen.main.bounds.width - 60)
        }
        .padding(.horizontal, 20)
    }
}

struct CustomTextfieldLowercased: View {
    var placeHolder: String
    var imageName: String
    var bColor: Color
    @Binding var value: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.white)
            TextField(placeHolder, text: $value)
                .textInputAutocapitalization(.never)
                .padding()
                .foregroundColor(.white)
                .background(bColor.opacity(0.2))  // Opacidad reducida
                .cornerRadius(10)
                .frame(width: UIScreen.main.bounds.width - 60)
        }
        .padding(.horizontal, 20)
    }
}

struct CustomSecurefield: View {
    var placeHolder: String
    var imageName: String
    var bColor: Color
    @Binding var value: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.white)
            SecureField(placeHolder, text: $value)
                .padding()
                .foregroundColor(.white)
                .background(bColor.opacity(0.2))  // Opacidad reducida
                .cornerRadius(10)
                .frame(width: UIScreen.main.bounds.width - 60)
        }
        .padding(.horizontal, 20)
    }
}

