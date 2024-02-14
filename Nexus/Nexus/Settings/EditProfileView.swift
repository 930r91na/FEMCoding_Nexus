//
//  EditProfileView.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 08/11/23.
//

import SwiftUI

struct EditProfileView: View {
    @State private var editingField: String? // Tracks which field is being edited
    @State private var user: User2 = currentUser // Local copy of user data
    @State private var showingSuccessAlert = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    private let maxPhotos = 5

    var body: some View {
        NavigationView {
            Form {
                // Photo Picker View
                Section(header: Text("Fotos de perfil").foregroundColor(Color.pinkLetters)) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(currentUser.images.indices, id: \.self) { index in
                                Image(uiImage: currentUser.images[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .cornerRadius(10)
                            }
                            
                            if currentUser.images.count < maxPhotos {
                                Button(action: {
                                    showingImagePicker = true
                                }) {
                                    Image(systemName: "plus")
                                        .frame(width: 100, height: 100)
                                        .background(Color.pinkBtn.opacity(0.5))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                }
                
                Section(header: Text("Información personal").foregroundColor(Color.pinkLetters)) {
                                    EditableTextField(text: $user.bio, label: "Biografía", editingField: $editingField)
                                    EditableTextField(text: $user.location, label: "Ubicación", editingField: $editingField)
                                    EditableTextField(text: $user.about, label: "Sobre mí", editingField: $editingField)
                                    EditableTextField(text: $user.gender, label: "Genero", editingField: $editingField)
                                }
                Section(header: Text("Redes Sociales").foregroundColor(Color.pinkLetters)) {
                                    EditableTextField(text: $user.ig, label: "Instagram", editingField: $editingField)
                                    EditableTextField(text: $user.tw, label: "Twitter", editingField: $editingField)
                                }
                Section(header: Text("Intereses").foregroundColor(Color.pinkLetters)) {
                                    EditableTextField(text: $user.interests0, label: "Interes 1", editingField: $editingField)
                                    EditableTextField(text: $user.interests1, label: "Interes 2", editingField: $editingField)
                                    EditableTextField(text: $user.interests2, label: "Interes 3", editingField: $editingField)
                                }
                Section(header: Text("Información Academica").foregroundColor(Color.pinkLetters)) {
                    EditableTextField(text: $user.institution, label: "Institución", editingField: $editingField)
                    EditableTextField(text: $user.career, label: "Carrera", editingField: $editingField)
                                    if editingField == "Semestre" {
                                        Picker("Semestre", selection: $user.semester) {
                                            ForEach(1...10, id: \.self) { number in
                                                Text("\(number)").tag(number)
                                            }
                                        }
                                    } else {
                                        HStack {
                                            Text("Semestre: \(user.semester)")
                                            Spacer()
                                            EditButton(label: "Semestre", editingField: $editingField)
                                        }
                                    }
                    
                    if editingField == "Edad" {
                        Picker("Edad", selection: $user.age) {
                            ForEach(18...100, id: \.self) { number in
                                Text("\(number)").tag(number)
                            }
                        }
                    } else {
                        HStack {
                            Text("Edad: \(user.age)")
                            Spacer()
                            EditButton(label: "Edad", editingField: $editingField)
                        }
                    }
                    
                    Toggle("Mentor", isOn: $user.mentor)
                }
                
                Section {
                    Button("Guardar Cambios") {
                        // Implement the save action to persist changes
                        currentUser = user
                        editingField = nil // Exit edit mode
                        showingSuccessAlert = true // Show success alert
                    }
                    .disabled(editingField != nil) // Disable save button if any field is in edit mode
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pinkBtn)
                    .cornerRadius(8)
                }
            }
            .navigationTitle("Editar Perfil")
            .alert(isPresented: $showingSuccessAlert) {
                Alert(title: Text("Éxito"), message: Text("Tus cambios han sido guardados con éxito"), dismissButton: .default(Text("OK")))
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        currentUser.images.append(inputImage)
    }
}

struct EditableTextField: View {
    @Binding var text: String
    var label: String
    @Binding var editingField: String?
    
    var isEditing: Bool {
        editingField == label
    }
    
    var body: some View {
        HStack {
            if isEditing {
                TextField(label, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.vertical, 10)
            } else {
                Text(text)
                    .padding(.vertical, 10)
            }
            Spacer()
            EditButton(label: label, editingField: $editingField)
        }
    }
}

struct EditButton: View {
    var label: String
    @Binding var editingField: String?
    
    var body: some View {
        Button(action: {
            if editingField == label {
                editingField = nil // Save the field and close the editor
            } else {
                editingField = label // Open the editor for this field
            }
        }) {
            Image(systemName: editingField == label ? "checkmark.circle.fill" : "pencil.circle.fill")
                .foregroundColor(editingField == label ? Color.customOrange : Color.gray)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

// Usage of the EditProfileView in a preview or as part of your appa
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

