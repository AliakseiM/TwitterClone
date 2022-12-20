//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Aliaksei Mikhailouski on 20/12/2022.
//

import SwiftUI

struct RegistrationView: View {
    @State var name = ""
    @State var email = ""
    @State var birthDate = Date()
        
    var body: some View {
        VStack {
            Text("navbar")
            Text("Create your profile")
            Form {
                TextField("Name", text: $name)
                TextField("Email", text: $email) 
                DatePicker("Birth date", selection: $birthDate, displayedComponents: .date)
            }
            Button(action: {
                
            }) {
                Text("Register")
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
        
    static var previews: some View {
        RegistrationView()
    }
}
