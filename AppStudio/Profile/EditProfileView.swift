//
//  EditProfileView.swift
//  AppStudio
//
//  Created by Georgina Zeron Cabrera on 18/10/23.
//

import SwiftUI

struct MockData {
    static var profile: [String: Any] = [
        "biography": "This is a sample biography.",
        "basicInfo": "Sample basic info.",
        "languages": ["English", "Spanish"],
        "otherAccounts": ["Twitter": "@sampleUser", "Instagram": "@instaSample"]
    ]
    
    static func fetchProfileData(completion: @escaping ([String: Any]) -> Void) {
        // Simulating a network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            completion(profile)
        }
    }
}

struct EditProfileView: View {
    @State private var profileData: [String: Any] = [:]
    @State private var interests: [String] = ["Interest 1", "Interest 2"]
    @State private var media: [Image] = [Image("SampleImage"),Image("petra")]  // To hold added photos/videos as Image views
    @State private var isEditingField: Bool = false
    @State private var currentEditingField: String?
    @State private var newInterest: String = ""

    func loadProfileData() {
        MockData.fetchProfileData { data in
            self.profileData = data
        }
    }
    
    
    func editableSection(title: String, content: String) -> some View {
        AnyView(
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.headline)
                    Text(content)
                        .foregroundColor(.customPurple)
                        .padding(.all, 8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .overlay(
                            Image(systemName: "pencil")
                                .position(x: 300, y: 10)
                                .foregroundColor(.gray)
                        )
                        .onTapGesture {
                            self.currentEditingField = title
                            self.isEditingField = true
                        }
                }
                Spacer()
            }
        )
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Edit Profile")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // Media previews (shows up to the first 4 images)
                if media.count > 0 {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0..<min(media.count, 4)) { index in
                                media[index]
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .cornerRadius(8)
                            }
                        }
                        .padding()
                    }
                }
                
                // Add Photo from Gallery Button
                Button(action: {
                    self.media.append(Image("sampleImage")) // Append the sample image to the media array
                }) {
                    Text("Add Photo from Gallery")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.customPurple)
                        .cornerRadius(8)
                }
                

                // Profile Details
                editableSection(title: "Biografía:", content: profileData["biography"] as? String ?? "")
                
                Group {
                    Text("Información básica:")
                        .font(.headline)
                    
                    editableSection(title: "Género:", content: profileData["gender"] as? String ?? "")
                    editableSection(title: "Trabajo:", content: profileData["work"] as? String ?? "")
                    editableSection(title: "Educación:", content: profileData["education"] as? String ?? "")
                    editableSection(title: "Ubicación:", content: profileData["location"] as? String ?? "")
                    editableSection(title: "Ciudad natal:", content: profileData["natalCity"] as? String ?? "")
            
                    
                    Text("Languages:")
                        .font(.headline)
                    ForEach((profileData["languages"] as? [String] ?? []), id: \.self) { language in
                        Text(language)
                            .foregroundColor(.customPurple)
                    }
                    .padding(.bottom, 10)
                    
                    Text("Other Accounts:")
                        .font(.headline)
                    ForEach((profileData["otherAccounts"] as? [String: String] ?? [:]).map { ($0.key, $0.value) }, id: \.0) { key, value in
                        Text("\(key): \(value)")
                            .foregroundColor(.customPurple)
                    }
                    .padding(.bottom, 10)
                    
                    Text("Interests:")
                        .font(.headline)
                    WrapLayout(data: interests) { interest in
                        Text(interest)
                            .padding()
                            .background(Color.customPurple)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        TextField("Nuevo Interés", text: $newInterest)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        Button(action: {
                            if !newInterest.isEmpty {
                                interests.append(newInterest)
                                newInterest = ""
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.customPurple)
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear(perform: loadProfileData)
        .blur(radius: isEditingField ? 3.0 : 0)

        if isEditingField {
            EditFieldView(currentField: $currentEditingField, isEditing: $isEditingField, profileData: $profileData)
        }
    }
}



struct EditFieldView: View {
    @Binding var currentField: String?
    @Binding var isEditing: Bool
    @Binding var profileData: [String: Any]
    @State private var editedText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Editing \(currentField ?? "")")
                .font(.headline)
                .padding()

            TextField("Enter new value", text: $editedText)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 3)
            
            Button("Save") {
                if let field = currentField {
                    profileData[field] = editedText
                    isEditing = false
                }
            }
            .padding()
            .background(Color.customPurple)
            .foregroundColor(.white)
            .cornerRadius(8)

            Button("Cancel") {
                isEditing = false
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: 300)
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
        .onAppear {
            if let field = currentField, let value = profileData[field] as? String {
                editedText = value
            }
        }
    }
}


struct WrapLayout<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    private var data: Data
    private var content: (Data.Element) -> Content
    
    init(data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width: CGFloat = 0
        var height: CGFloat = 0

        return ZStack(alignment: .topLeading) {
            ForEach(self.data, id: \.self) { item in
                self.content(item)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > geometry.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if item == self.data.last! {
                            width = 0
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        if item == self.data.last! {
                            height = 0
                        }
                        return result
                    })
            }
        }
    }
}
#Preview {
    EditProfileView()
}
