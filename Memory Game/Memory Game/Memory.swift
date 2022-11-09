import SwiftUI

class Card: Identifiable, ObservableObject {
    
    var id = UUID()
    @Published var isFaceUp = false
    @Published var isMatched = false
    var color:Color
    
    init (color:Color) {
        self.color = color
    }
    
    func turnOver() {
        self.isFaceUp.toggle()
    }
}

let cardValues:[Color] = [.blue, .red, .yellow, .green, .orange, .mint]

func creatCardList() -> [Card] {
    var cardList = [Card]()
    
    for cardValue in cardValues {
        cardList.append(Card(color: cardValue))
        cardList.append(Card(color: cardValue))
    }
    return cardList
}

let faceDownCard = Card(color: .gray)
