////
////  Image.swift
////  TravLog
////
////  Created by asmaa gamal  on 02/11/2023.
////
//
//import Foundation
//import SwiftUI
//
//struct ImagePicker: UIViewControllerRepresentable {
//    @Binding var selectedImage: UIImage?
//    @Environment(\.presentationMode) private var presentationMode
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = context.coordinator
//        return imagePicker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
//        // Update the view controller if needed
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//        let parent: ImagePicker
//
//        init(_ parent: ImagePicker) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//            if let selectedImage = info[.originalImage] as? UIImage {
//                parent.selectedImage = selectedImage
//            }
//
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//    }
//}
