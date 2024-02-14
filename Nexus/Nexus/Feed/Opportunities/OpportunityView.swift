//
//  OpportunityView.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 11/11/23.
//
import SwiftUI

struct OpportunityView: View {
    let opportunity: Opportunity

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Title
            Text(opportunity.title)
                .font(.headline)
                .foregroundColor(Color.black)
                .onTapGesture {
                    openLink(opportunity.hyperlink)
                }
            
            // Tags
            HStack {
                ForEach(opportunity.tags, id: \.self) { tag in
                    Text(tag)
                        .padding(5)
                        .background(.white)
                        .foregroundColor(Color.pinkLetters)
                        .cornerRadius(5)
                }
            }
            
            // Image
            if (opportunity.image != nil){
                opportunity.image?
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 200)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }

    private func openLink(_ url: URL) {
        UIApplication.shared.open(url)
    }
}



struct OpportunityView_Previews: PreviewProvider {
    static var previews: some View {
        OpportunityView(opportunity: exampleOpportunities[0])
    }
}


