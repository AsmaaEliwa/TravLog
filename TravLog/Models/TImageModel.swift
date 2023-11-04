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
           for image in images {
               let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
               let imageFileName = "\(Date().timeIntervalSince1970).jpg" // Generate a unique name
               let imageUrl = documentDirectory.appendingPathComponent(imageFileName)

               if let imageData = image?.jpegData(compressionQuality: 1.0) {
                   try? imageData.write(to: imageUrl)
                   imagePaths.append(imageUrl.path)
               }
           }
           return imagePaths
       }
    
    
    
}
