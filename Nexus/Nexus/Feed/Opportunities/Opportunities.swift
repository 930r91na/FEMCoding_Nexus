import SwiftUI

struct Opportunities: View {
    @State var showFilters = false
    @State var filterType: String = ""
    @State var filterYear: Int? = nil
    @State var filterLocation: String = ""
    @State private var showingCreateOpportunity = false // State for showing the modal

    var filteredOpportunities: [Opportunity] {
        exampleOpportunities.filter { opportunity in
            (filterType.isEmpty || opportunity.type == filterType) &&
            (filterYear == nil || opportunity.targetAudienceYear == filterYear) &&
            (filterLocation.isEmpty || opportunity.location == filterLocation)
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    // Filter Button
                    Button(action: {
                        showFilters.toggle()
                    }) {
                        HStack {
                            Text("Filtrar")
                                .foregroundColor(Color.pinkLetters)
                            Image(systemName: "line.horizontal.3.decrease.circle")
                                .foregroundColor(Color.customPurple)
                        }
                    }

                    Spacer()

                    // Create Opportunity Button - Now triggers the modal
                    Button(action: {
                        showingCreateOpportunity = true
                    }) {
                        HStack {
                            Text("Publicar oportunidad")
                                .foregroundColor(Color.pinkLetters)
                            Image(systemName: "plus")
                                .foregroundColor(Color.customPurple)
                        }
                    }
                }
                .padding()
                .background(Color.white)

                Divider()

                if showFilters {
                    // Filter UI
                    HStack {
                        TextField("Tipo", text: $filterType)
                        TextField("Fecha", value: $filterYear, formatter: NumberFormatter())
                        TextField("Locación", text: $filterLocation)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                }

                // Opportunities List
                ScrollView {
                    VStack {
                        ForEach(filteredOpportunities) { opportunity in
                            OpportunityView(opportunity: opportunity)
                        }
                    }
                }
            }
            .navigationBarTitle("Oportunidades", displayMode: .inline)
            .sheet(isPresented: $showingCreateOpportunity) {
                CreateOpportunityView()
            }
        }
    }
}

#Preview {
    Opportunities()
}
