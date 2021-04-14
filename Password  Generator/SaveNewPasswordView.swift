//
//  SaveNewPasswordView.swift
//  Password  Generator
//
//  Created by David Gajdics on 09.03.21.
//

import SwiftUI

struct SaveNewPasswordView: View {
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .clear
    }
    
    @State private var website : String = ""
    @State private var username : String = ""
    @State private var password : String = "\([UIPasteboard.general.string])"
    @State private var notes : String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.09, green: 0.30, blue: 0.28).ignoresSafeArea()
                VStack{
                    // Some animation or photo
                    Form{
                        TextField("Website: example.com", text: $website)
                        TextField("Username: user / ID", text: $username)
                        SecureField("Password: password", text: $password)
                            .font(.title2)
                        TextField("Notes: ", text: $notes)
                            .padding(30)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Save")
                                .position(CGPoint(x: 165, y: 15))
                                .accentColor(.green)
                        })
                    }
                }
            }
            
        }.navigationTitle("Add new Password")
    }
}
struct SaveNewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SaveNewPasswordView()
    }
}
