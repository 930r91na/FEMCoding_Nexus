import SwiftUI

struct AboutView: View {
    @State private var isButtonPressed = false

    var body: some View {
        VStack(spacing: 30) {
            ZStack {
                // Background Color Block
                LinearGradient(gradient: Gradient(colors: [.sunsetOrange, .darkPurple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .cornerRadius(15)
                    .shadow(radius: 5)

                VStack(spacing: 20) {
                    // Icon at the top
                    Image(systemName: "person.3.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)

                    // Title with flexible font size
                    Text("Acerca de nuestra aplicación")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    
                    // Carousel-style TabView
                    TabView {
                        ForEach(0..<3) { index in
                            aboutContent(for: index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .frame(height: 450)
                }
                .padding(10)
            }
            
            // "Omitir" Button outside color block
            Button(action: {
                // Action when button is pressed
                // TODO: Navigate to the main feed or execute any desired action here
            }) {
                Text("Omitir")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .foregroundColor(isButtonPressed ? Color.blue : Color.gray)
                    .cornerRadius(15)
            }
            .onLongPressGesture(minimumDuration: .infinity, pressing: { pressing in
                isButtonPressed = pressing
            }, perform: {})
        }
    }

    func aboutContent(for index: Int) -> some View {
        VStack(spacing: 15) {
            Text("Información \(index + 1)")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.white)

            Text("Nos esforzamos por brindar la mejor experiencia a nuestros usuarios. Esta aplicación está hecha con amor y dedicación, con el objetivo de ofrecer calidad e innovación.")
                .font(.body)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
        .padding(.vertical)
        .background(Color.white.opacity(0.2))
        .cornerRadius(15)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
