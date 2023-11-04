//
//  TripView.swift
//  TravLog
//
//  Created by asmaa gamal  on 04/11/2023.
//

import SwiftUI

struct TripView: View {
    var trip: Trip?
 
    @State private var isDeleted = false
    var body: some View {
     
            VStack {
                HStack{
                    Text(trip?.title ?? "Untitled Trip")
                        .font(.title)
                        .foregroundColor(.primary)
                    Spacer()
                    Button{
                        TripModel().deleteTrip(user: trip?.user ?? User() , trip: trip ?? Trip())
                        isDeleted = true
                        
                    }label: {
                        Label("Delete", systemImage: "trash").foregroundColor(.red)
                    }
                    
                }
                Text(trip?.details ?? "")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text("Date: \(formattedDate)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                //            if let images = trip?.images?.allObjects as? [Image] {
                TripImagesGridView(trip: trip)
                //            }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 3)
            .padding(.horizontal, 5)
        }
        
        var formattedDate: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy"
            return dateFormatter.string(from: trip?.date ?? Date())
        }
    }

//struct TripView_Previews: PreviewProvider {
//    static var previews: some View {
//        let context = PersistenceController.preview.container.viewContext
//        let trip = Trip(context: context)
//        trip.title = "Awesome Trip"
//        trip.details = "An amazing adventure"
//        trip.date = Date()
//
//        return TripView(trip: trip)
//    }
//}
