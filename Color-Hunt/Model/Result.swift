//
//  Result.swift
//  Color-Hunt
//
//  Created by Christopher Nathanael Tessy on 26/04/24.
//

import Foundation
import PhotosUI

struct Result: Identifiable, Hashable {
    var id: UUID
    var playerName: String
    var image: UIImage
    
    init(playerName: String, image: UIImage) {
        self.id = UUID()
        self.playerName = playerName
        self.image = image
    }
}
