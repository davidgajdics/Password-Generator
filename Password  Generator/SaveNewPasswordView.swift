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
}
    @State private var search : String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.09, green: 0.30, blue: 0.28).ignoresSafeArea()
                
                VStack(alignment: .leading){
                    TextField("Search", text: $search)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Spacer()
                }.padding()
                
            }.navigationBarTitle("Passwords")
        }
    }
}

struct SaveNewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SaveNewPasswordView()
    }
}
