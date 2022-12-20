//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Aliaksei Mikhailouski on 20/12/2022.
//

import SwiftUI
import Firebase

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
        
    var body: some View {
        VStack {
            Text("navbar")
            Text("Create your profile")
            Form {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
//                DatePicker("Birth date", selection: $birthDate, displayedComponents: .date)
            }
            Button(action: {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    print(authResult)
                    if error != nil {
                        print(error)
                    }
                }
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
