//
//  NewRegisterView.swift
//  AppStudio
//
//  Created by Andrea Lima Blanca on 14/10/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

/*
var currentUser : User = User(email: "", password: "", name: "", bio: "", location: "", about: "", gender: "", ig: "", tw: "", institution: "", interest0: "", interest1: "", interest2: "", semester: 0, age: 0, mentor: false, profileImage: Image(systemName: "person.circle.fill"), career: "")

struct User: Identifiable {
    var id: UUID
    var email: String
    var password: String
    var name: String
    var bio: String
    var location: String
    var about: String
    var gender: String
    var ig: String
    var tw: String
    var institution: String
    var interests0: String
    var interests1: String
    var interests2: String
    var semester: Int
    var age: Int
    var mentor: Bool
    var profileImage: Image
    var career: String
    
    init(email: String, password: String, name: String, bio: String, location: String, about: String, gender: String, ig: String, tw: String, institution: String, interest0: String, interest1: String, interest2: String, semester: Int, age: Int, mentor: Bool, profileImage: Image, career: String) {
        self.id = UUID()
        self.email = email
        self.password = password
        self.name = name
        self.bio = bio
        self.location = location
        self.about = about
        self.gender = gender
        self.ig = ig
        self.tw = tw
        self.institution = institution
        self.interests0 = interest0
        self.interests1 = interest1
        self.interests2 = interest2
        self.semester = semester
        self.age = age
        self.mentor = mentor
        self.profileImage = profileImage
        self.career =  career
    }
}

*/

struct RegisterView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    
    @State private var isLoading = false
    @State private var registered = false
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        
        if registered == false {
            NavigationView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(hex: "c1246b"), Color(hex: "e13661")]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 30) {
                        ZStack {
                            Ellipse()
                                .frame(width: 530, height: 498)
                                .padding(.leading, -200)
                                .foregroundColor(.white)
                                .opacity(0.1)
                                .padding(.top, -200)
                            
                            Ellipse()
                                .frame(width: 478, height: 440)
                                .padding(.trailing, -400)
                                .foregroundColor(.white)
                                .opacity(0.1)
                                .padding(.top, -320)
                            
                            Text("Hola, ¿eres nuev@?")
                                .foregroundColor(Color.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.top, -100)
                            Text("Regístrate")
                                .foregroundColor(Color.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top, -40)
                            
                        }
                        
                        VStack(spacing: 10) {
                            Image(systemName: "person.3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220, height: 220)
                                .foregroundColor(.white)
                                .padding(.top, -200)
                        }
                        VStack(alignment: .center, spacing: 15) {
                            
                            CustomTextfield(placeHolder: "Nombre", imageName: "person", bColor: Color(.white), value: $name)
                            CustomTextfieldLowercased(placeHolder: "Correo", imageName: "envelope", bColor: Color(.white), value: $email)
                            CustomSecurefield(placeHolder: "Contraseña", imageName: "lock", bColor: Color(.white), value: $password)
                        }
                        
                        VStack(spacing: 20) {
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                Button(action: {
                                    isLoading = true
                                    
                                    authModel.signUp(email: email, password: password)

                                    isLoading = false
                                }) {
                                    Text("Registrarse")
                                        .fontWeight(.bold)
                                        .font(.headline)
                                        .foregroundColor(Color(hex: "c1246b"))
                                        .padding(.horizontal, 50)
                                        .padding(.vertical, 15)
                                        .background(Color.white)
                                        .cornerRadius(12)
                                }
                                .padding(.horizontal, 20)
                                
                                NavigationLink {
                                    LoginView()
                                } label: {
                                    Text("¿Ya tienes una cuenta?")
                                        .foregroundColor(.white)
                                    
                                }
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                            }
                        }
                        .padding(.top, 20)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .navigationBarBackButtonHidden()
            
        } else {
            //NewUser()
        }
    }
    
    func register(email: String, password: String, name: String) {

        authModel.signUp(email: email, password: password)

    }
}


#Preview {
    RegisterView()
}
