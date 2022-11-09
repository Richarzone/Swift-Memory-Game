import SwiftUI

struct ContentView: View {
    
    let columnLayout = Array(repeating: GridItem(), count: 3)
    @State var cards = creatCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var PlayerChoises = [Card]()
    
    var body: some View {
        VStack {
            Text("Memory Game")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(10)
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(cards) { card in
                        CardView(card: card,
                                 MatchingCards: $MatchedCards,
                                 PlayerChoises: $PlayerChoises
                        )
                    }
                }
            }
        }
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
