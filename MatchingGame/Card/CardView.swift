//
//  GridView.swift
//  MatchingGame
//
//  Created by Nicole Beilis on 1/14/23.
//

import SwiftUI

struct CardView: View {
    
    @State private var flipped: Bool = false
    @State private var frontDegree: Double = -90.0
    @State private var backDegree: Double = 0.0
    
    var body: some View {
        ZStack {
            CardFrontView(degree: $frontDegree)
            CardBackView(degree: $backDegree)
        }
        .onTapGesture() {
            flipCard()
        }
    }
    
    func flipCard() {
        flipped.toggle()
        if flipped {
            withAnimation(.linear(duration: 0.3)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: 0.3).delay(0.3)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: 0.3)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: 0.3).delay(0.3)){
                backDegree = 0
            }
        }
    }
    
    // source for help: https://betterprogramming.pub/card-flip-animation-in-swiftui-45d8b8210a00

}
