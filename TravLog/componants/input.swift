//
//  input.swift
//  TravLog
//
//  Created by asmaa gamal  on 31/10/2023.
//

import SwiftUI

struct input: View {
    var label: String
    var placeholder: String
    @Binding var text:String
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                   .font(.headline)
                   .padding(.leading)
                   .foregroundColor(.blue)
               
            TextField(placeholder, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
             
        }
    }
}


struct Input_Previews: PreviewProvider {
    @State static var text = ""

    static var previews: some View {
        input(label: "User Name", placeholder: "Enter User Name", text: $text)
    }
}
