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
            let imageFileName = "\(Date().timeIntervalSince1970).jpg"
            let imageUrl = documentDirectory.appendingPathComponent(imageFileName)

            if let imageData = image?.jpegData(compressionQuality: 1.0) {
                do {
                    try imageData.write(to: imageUrl)
                    imagePaths.append(imageFileName) // ------->  Store the file name instead of the full path
                } catch {
                    print("Error saving image: \(error)")
                }
            }
        }
        return imagePaths
    }
    
    
//    
//    func saveImageToFile(_ imageUrl: String) -> String? {
//        guard let url = URL(string: imageUrl) else {
//            // Handle invalid URL
//            return nil
//        }
//
//        do {
//            let imageData = try Data(contentsOf: url)
//            let imageFileName = "\(Date().timeIntervalSince1970).jpg"
//            let imageUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageFileName)
//
//            try imageData.write(to: imageUrl)
//            return imageFileName
//        } catch {
//            print("Error saving image: \(error)")
//            return nil
//        }
//    }
//    
    
    
    
    
    
    
    
    func saveImageToFile(_ imageUrl: String) async throws -> String? {
        guard let url = URL(string: imageUrl) else {
            return nil
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let imageFileName = "\(Date().timeIntervalSince1970).jpg"
            let imageUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageFileName)

            try data.write(to: imageUrl)
            return imageFileName
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
    
    
    
    

    
    
}
