//
//  CardView.swift
//  MatchingGame
//
//  Created by Nicole Beilis on 1/14/23.
//

import SwiftUI

struct CardFrontView: View {
    
    let imgName: String
    @Binding var degree: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 0, green: 45/255, blue: 121/255))
            Image(imgName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
