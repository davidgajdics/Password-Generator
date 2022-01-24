//
//  Example1View.swift
//  Password  Generator
//
//  Created by David Gajdics on 06.01.22.
//

import SwiftUI

struct Example1View: View {
    
    @State var username = "www.twitter.com"
    @State var passw = ""
    
    
    var body: some View {
        NavigationView{
            HStack{
                VStack{
                    TextField("Username or Website: ", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    TextField("Password: ", text: $passw)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    Spacer()
                }
            }
            
        }
        .navigationTitle("Twitter")
    }
}

struct Example1View_Previews: PreviewProvider {
    static var previews: some View {
        Example1View()
    }
}
