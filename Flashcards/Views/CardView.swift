//
//  CardView.swift
//  Flashcards
//
//  Created by Jonathan Heinzman on 6/17/26.
//
import SwiftUI

struct CardView: View {
    let cards = flashcards
    
    @State private var cardIndex = 0
    @State private var isFlipped = false
    
    var body: some View {
        
        let currentCard = cards[cardIndex]
        
        VStack(spacing: 30) {
            
            Text("Flashcards")
                .font(.largeTitle)
                .bold()
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: isFlipped
                                ? [.purple, .pink]
                            : [.indigo, .teal],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 350, height: 200)
                    
                Text(isFlipped ? currentCard.answer : currentCard.question)
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .id(isFlipped)
                    .rotation3DEffect(
                        .degrees(isFlipped ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
            }
            .overlay(alignment: .topLeading) {
                Text(isFlipped ? "Answer" : "Question")
                    .font(.subheadline.bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.white.opacity(0.9))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding()
                    .rotation3DEffect(
                        .degrees(isFlipped ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
            }
            .rotation3DEffect(
                .degrees(isFlipped ? 180 : 0),
                axis: (x: 0, y: 1, z: 0)
            )
            .animation(.easeInOut(duration: 0.6), value: isFlipped)
            .onTapGesture {
                withAnimation {
                    isFlipped.toggle()
                }
            }
            
            HStack(spacing: 20) {
                Button("Previous") {
                    withAnimation {
                        cardIndex = cardIndex > 0 ? cardIndex - 1 : cards.count - 1
                        isFlipped = false
                    }
                }
                
                Button("Next") {
                    withAnimation {
                        cardIndex = cardIndex < cards.count - 1 ? cardIndex + 1 : 0
                        isFlipped = false
                    }
                }
            }
            .buttonStyle(.bordered)
            .tint(.indigo)
            
            
            Text("Card \(cardIndex + 1) of \(cards.count)")
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    CardView()
}
