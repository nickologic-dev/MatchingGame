//
//  GridView.swift
//  MatchingGame
//
//  Created by Nicole Beilis on 1/14/23.
//

import SwiftUI

struct CardView: View {
    
    var location: CardLocation
    @State private var flipped: Bool = false
    @State private var frontDegree: Double = -90.0
    @State private var backDegree: Double = 0.0
    @StateObject var model: GridModel
    
    var body: some View {
        ZStack {
            CardFrontView(imgName: model.grid[location.row][location.col].image, degree: $frontDegree)
            CardBackView(degree: $backDegree)
        }
        .opacity(model.grid[location.row][location.col].matched ? 0 : 100)
        .onTapGesture() {
            if !model.grid[location.row][location.col].matched {
                model.selected.append(model.grid[location.row][location.col])
                model.matching()
                if !model.grid[location.row][location.col].matched {
                    flipCard()
                }
            }
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
    
    // source for flipping card: https://betterprogramming.pub/card-flip-animation-in-swiftui-45d8b8210a00

}
