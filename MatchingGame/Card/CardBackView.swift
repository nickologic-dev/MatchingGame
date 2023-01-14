//
//  CardBackView.swift
//  MatchingGame
//
//  Created by Nicole Beilis on 1/14/23.
//

import SwiftUI

struct CardBackView: View {
    
    @Binding var degree: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
