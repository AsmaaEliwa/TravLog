//
//  TImageModel.swift
//  TravLog
//
//  Created by asmaa gamal  on 03/11/2023.
//

import Foundation
import SwiftUI
class TImageMode{


    func saveImagesToFile(_ images: [UIImage?]) -> [String] {
        var imagePaths: [String] = []
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

        for image in images {
            let imageFileName = "\(Date().timeIntervalSince1970).jpg" // Generate a unique name
            let imageUrl = documentDirectory.appendingPathComponent(imageFileName)

            if let imageData = image?.jpegData(compressionQuality: 1.0) {
                do {
                    try imageData.write(to: imageUrl)
                    imagePaths.append(imageFileName) // Store the file name instead of the full path
                } catch {
                    print("Error saving image: \(error)")
                }
            }
        }
        return imagePaths
    }
    
    
    
}
