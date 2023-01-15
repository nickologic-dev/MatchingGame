//
//  GridView.swift
//  MatchingGame
//
//  Created by Nicole Beilis on 1/14/23.
//

import SwiftUI

struct GridView: View {
    
    let height: Int
    let width: Int
//    @State var tapCounter: Int = 0
    @ObservedObject var model: GridModel
    
    var body: some View {
        VStack {
            ForEach(0..<height) { i in
                HStack {
                    ForEach(0..<width) { j in
                        CardView(location: model.grid[i][j].location, model: model)
                    }
                }
            }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded {
//                    tapCounter += 1
//                    if tapCounter >= 2 {
//                        matcher() // TODO: implement
//                        tapCounter = 0
//                    }
                }
        )
    }
    
    func matcher() -> Bool {
        return false
    }
}
