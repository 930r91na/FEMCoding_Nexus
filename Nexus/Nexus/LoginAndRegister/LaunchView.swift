//
//  LaunchView.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 04/11/23.
//


import SwiftUI

struct LaunchView: View {
    @State private var isActive=false
    @State private var size=0.8
    var body: some View {
        NavigationView {
            ZStack {
                if isActive {
                    PostLaunch()
                } else {
                    VStack(spacing: 0) {
                        
                        Image("Nexus")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .padding(20)
                        
                        Text("Nexus")
                            .font(.system(size: 80))
                            .bold()
                            .foregroundColor(Color.customPurple)
                        
                        
                    }
                    .navigationBarBackButtonHidden(true)
                    .scaleEffect(size)
                    .onAppear {
                        withAnimation(.easeIn(duration: 3)) {
                            self.size=0.5
                        }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()+2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
