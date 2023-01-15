//
//  ContentView.swift
//  MatchingGame
//
//  Created by Nicole Beilis on 1/14/23.
//

import SwiftUI

struct ContentView: View {

    var model: GridModel = GridModel()
    
    var body: some View {
        Button("Restart") {
            model.generateGrid()
        }
        GridView(height: 4, width: 3, model: model)
    }
}
