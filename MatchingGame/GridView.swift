//
//  GridView.swift
//  MatchingGame
//
//  Created by Nicole Beilis on 1/14/23.
//

import SwiftUI

struct GridView: View {
    
    var height: Int
    var width: Int
    
    var body: some View {
        VStack {
            ForEach(0..<height) { i in
                HStack {
                    ForEach(0..<width) { i in
                        CardView()
                    }
                }
            }
        }
    }
}
