import SwiftUI

struct TripImagesGridView: View {
    var trip: Trip?

    var body: some View {
        if let images = trip?.images?.allObjects as? [TripImage], !images.isEmpty {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(images, id: \.self) { image in
                        if let imageUrl = image.imageUrl,
                           let uiImage = UIImage(contentsOfFile: imageUrl) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
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

struct TripImagesGridView_Previews: PreviewProvider {
    static var previews: some View {
        TripImagesGridView(trip: nil)
    }
}
