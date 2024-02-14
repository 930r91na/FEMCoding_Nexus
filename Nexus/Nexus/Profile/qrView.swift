//
//  qrView.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 12/11/23.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRView: View {

    var body: some View {
        VStack {
            
            Text(currentUser.name)
                .font(.title)
                .fontWeight(.bold)

            Image(systemName: "qrcode")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.purple) // Purple QR code placeholder
                .padding()
                // In a real scenario, replace the above Image view with a QR code generator
        }.navigationTitle("Conectemos...")
        .padding()
    }
}


struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}
