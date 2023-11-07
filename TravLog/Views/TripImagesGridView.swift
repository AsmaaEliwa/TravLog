import SwiftUI



struct TripImagesGridView: View {
    var trip: Trip?
    
    var body: some View {
        if let images = trip?.images?.allObjects as? [TripImage], !images.isEmpty {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(images, id: \.id) { image in
                        //                        if let imageUrl = image.imageUrl,
                        //                           let uiImage = UIImage(contentsOfFile: imageUrl) {
                        //
                        if let imageUrl = image.imageUrl {
                            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                            let fullImageUrl = documentDirectory.appendingPathComponent(imageUrl)

                            let fileManager = FileManager.default
                            if fileManager.fileExists(atPath: fullImageUrl.path) {
                                let uiImage = UIImage(contentsOfFile: fullImageUrl.path)
                                
                                Image(uiImage: uiImage ?? UIImage())
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                            } else {
                                // Handle missing image
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                            }
                        
                        }
                    }
                }
                .padding(.horizontal, 5)
            }
        } else {
            Text("No Images")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}
