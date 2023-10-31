//
//  SignUpView.swift
//  TravLog
//
//  Created by asmaa gamal  on 31/10/2023.
//

import SwiftUI

struct SignUpView: View {
    @State var username = ""
    @State var password = ""
    @State var email = ""
    var body: some View {
        TittleView(label: "Sign Up").padding(.top)
        VStack(spacing: 30){
            Group{
                input(label: "Email", placeholder: "Enter Email", text: $email)
                input(label: "Username", placeholder: "Enter username", text: $username)
                input(label: "Password", placeholder: "Enter Password", text: $password)
                Button{
                    
                }label: {
                    Label("Sign Up", systemImage: "person.badge.plus")
                }
            }.padding()
            Spacer()
        }
    }
}

#Preview {
    SignUpView()
}
