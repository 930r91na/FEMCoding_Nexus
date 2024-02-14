//
//  Opportunity.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 11/11/23.
//

import Foundation
import SwiftUI

struct Opportunity: Identifiable {
    let id = UUID()
    var title: String
    var hyperlink: URL
    var tags: [String]
    var image: Image? // Assuming this is a local image name or URL string
    var targetAudienceYear: Int
    var location: String
    var type: String // e.g., "Internship", "Conference", etc.
}


let exampleOpportunities = [
   
    Opportunity(
        title: "Unete a nuestro hackathon",
        hyperlink: URL(string: "https://example.com/hackathon")!,
        tags: ["#hackathon", "#coding"],
        image: Image("hackathon_image"),
        targetAudienceYear: 2023,
        location: "San Francisco",
        type: "Hackathon"
    ),
    Opportunity(
        title: "Vacante en el equipo de robòtica de la universidad X. Contactanos a través del siguiente link.",
        hyperlink: URL(string: "https://wa.me/897287264")!,
        tags: ["robótica", "organización estudiantil"],
        image: Image("RoboticsTeam"),
        targetAudienceYear: 2023,
        location: "Puebla",
        type: "Organización estudiantil"
    ),
    Opportunity(
        title: "Internship en XYZ Corp",
        hyperlink: URL(string: "https://example.com/internship")!,
        tags: ["#internship", "#tech"],
        image: nil,
        targetAudienceYear: 2023,
        location: "New York",
        type: "Internship"
    ),
    Opportunity(
        title: "Congreso de Mujeres en STEM",
        hyperlink: URL(string: "https://congresoWSTEM/registro/098974")!,
        tags: ["#Congreso", "#WomenInSTEM"],
        image: Image("congresoWSTEM"),
        targetAudienceYear: 2023,
        location: "Guadalajara",
        type: "Congreso"
    ),
    Opportunity(
        title: "Competencia de Capture the Flag",
        hyperlink: URL(string: "https://CTFComp/registro/898345")!,
        tags: ["#CTF", "#Competencia"],
        image: Image("CTFComp"),
        targetAudienceYear: 2023,
        location: "CDMX",
        type: "Competencia"
    ),
    Opportunity(
        title: "Conferencia anual sobre tecnología",
        hyperlink: URL(string: "https://example.com/conference")!,
        tags: ["#conference", "#networking"],
        image: Image("conference_image"),
        targetAudienceYear: 2022,
        location: "London",
        type: "Conferencia"
    )
]


