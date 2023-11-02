//
//  DateInput.swift
//  TravLog
//
//  Created by asmaa gamal  on 02/11/2023.
//

import SwiftUI

struct DateInput: View {
    var label: String
    var placeholder: String
    @Binding var text:Date
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                   .font(.headline)
                   .padding(.leading)
                   .foregroundColor(.blue)
               
            DatePicker(placeholder, selection: $text, displayedComponents: .date).foregroundColor(.blue)
                           .datePickerStyle(DefaultDatePickerStyle()) // You can customize the style as needed
                           .padding()
             
        }
        
    }
}

//struct DateInput_Previews: PreviewProvider {
//    @State  var text:Date
//
//    static var previews: some View {
//        input(label: "User Name", placeholder: "Enter User Name", text: $text)
//    }
//}
