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
    @State var showValidationAlert = false
    func reset(){
        email = ""
        password = ""
        username = ""
    }
    var body: some View {
        
        TittleView(label: "Sign Up").padding(.top)
//        testSwiftUIView()
        VStack(){
            Group{
                input(label: "Email", placeholder: "Enter Email", text: $email)
                input(label: "Username", placeholder: "Enter username", text: $username)
                input(label: "Password", placeholder: "Enter Password", text: $password)
                Button{
                    if username.isEmpty || password.isEmpty || email.isEmpty{
                        showValidationAlert = true
                    }else{
                        DataManger.shared.addUser(username: username, email: email, password: password)
                        reset()
                    }
                    
                }label: {
                    Label("Sign Up", systemImage: "person.badge.plus")
                }
            }.padding()
            Spacer()
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

#Preview {
    SignUpView()
}
