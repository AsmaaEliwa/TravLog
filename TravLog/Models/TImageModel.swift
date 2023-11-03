//
//  TImageModel.swift
//  TravLog
//
//  Created by asmaa gamal  on 03/11/2023.
//

import Foundation
import SwiftUI
class TImageMode{
    func saveImage(_ image: UIImage) -> URL? {
        let fileManager = FileManager.default
        let documentsDirectory = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        guard let directory = documentsDirectory else {
            return nil
        }
        
        let uniqueFilename = "\(Date().timeIntervalSince1970).jpg" // Unique filename
        let fileURL = directory.appendingPathComponent(uniqueFilename)
        
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            do {
                try imageData.write(to: fileURL)
                return fileURL
            } catch {
                print("Error saving image: \(error)")
                return nil
            }
        }
        return nil
    }

}
