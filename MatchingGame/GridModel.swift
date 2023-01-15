//
//  MatchingModel.swift
//  MatchingGame
//
//  Created by Nicole Beilis on 1/14/23.
//

import Foundation

public class GridModel: ObservableObject {
    
    let height: Int = 4
    let width: Int = 3
    @Published var grid : [[Card]] = []
    var selected: [Card] = []
//    private let images: [String] = ["seal", "scribble.variable", "paperplane.fill", "trash.square.fill", "questionmark.folder.fill", "square.and.arrow.up.fill"].shuffled()
    private let images: [String] = ["matcha_1", "matcha_2", "matcha_3", "matcha_4", "matcha_5", "matcha_6"].shuffled()
    
    init() {
        generateGrid()
    }
    
    func generateGrid() {
        // generate grid of cards with images
        let imagesUsed = selectImages()
        for i in 0..<height {
            var arr = [Card]()
            for j in 0..<width {
                arr.append(Card(id: UUID(), matched: false, image: imagesUsed[i*width + j], location: CardLocation(row: i, col: j)))
            }
            grid.append(arr)
        }
    }
    
    func selectImages() -> [String] {
        // shuffle which images used and put 2 of each in the array for matching
        var imagesUsed = Array(images[0..<height*width/2])
        imagesUsed.append(contentsOf: images)
        return imagesUsed.shuffled()
    }
    
    func matching() {
        if selected.count == 2 {
            if selected[0].image == selected[1].image {
                grid[selected[0].location.row][selected[0].location.col].matched = true
                grid[selected[1].location.row][selected[1].location.col].matched = true
            } else {
                // TODO: flip cards back
            }
            selected = []
        }
    }
    
}

struct Card: Identifiable {
    
    var id: UUID
    var matched: Bool
    var image: String
    var location: CardLocation
    
}

struct CardLocation {
    
    var row: Int
    var col: Int
    
}
