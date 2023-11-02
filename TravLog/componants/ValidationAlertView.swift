//
//  ValidationAlertView.swift
//  TravLog
//
//  Created by asmaa gamal  on 02/11/2023.
//

import SwiftUI

struct ValidationAlertView: View {
    @Binding var showValidationAlert:Bool
    var body: some View {
        VStack{
            
            Text("Error")
        .alert(isPresented: $showValidationAlert) {
               Alert(
                   title: Text("Validation Error"),
                   message: Text("please fill out the requirments" +
                                   "the username or password is not correct.")
               )
           }
    }
    }
}

//#Preview {
//    ValidationAlertView($showValidationAlert: true)
//}
