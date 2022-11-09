import SwiftUI

struct CardView: View {
    
    @ObservedObject var card:Card = creatCardList().first!
    @Binding var MatchingCards:[Card]
    @Binding var PlayerChoises:[Card]
    
    var body: some View {
        if card.isFaceUp || MatchingCards.contains(where: {$0.id == card.id}){
            Button { } label: {
                RoundedRectangle(cornerRadius: 4.0)
                    .aspectRatio(1.0, contentMode: ContentMode.fit)
                    .foregroundColor(card.color)
            }.buttonStyle(.plain)
        }
        else{
            Button {
                if PlayerChoises.count < 1 {
                    card.turnOver()
                    PlayerChoises.append(card)
                }
                else
                {
                    card.turnOver()
                    PlayerChoises.append(card)
                    withAnimation(Animation.linear.delay(1)){
                        for thisCard in PlayerChoises {
                            thisCard.turnOver()
                        }
                    }
                    checkForMatch()
                }
            } label: {
                RoundedRectangle(cornerRadius: 4.0)
                    .aspectRatio(1.0, contentMode: ContentMode.fit)
                    .foregroundColor(.gray)
            }.buttonStyle(.plain)
        }
    }
    
    func checkForMatch (){
        if PlayerChoises[0].color == PlayerChoises[1].color {
            MatchingCards.append(PlayerChoises[0])
            MatchingCards.append(PlayerChoises[1])
        }
        PlayerChoises.removeAll()
    }
}
