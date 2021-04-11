//
//  SaveNewPasswordView.swift
//  Password  Generator
//
//  Created by David Gajdics on 09.03.21.
//

import SwiftUI

struct SaveNewPasswordView: View {
    
/*init() {
    let navBarAppearance = UINavigationBar.appearance()
    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
}*/
    @State private var search : String = ""
    var pass : String = " "
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.09, green: 0.30, blue: 0.28).ignoresSafeArea()
                VStack(alignment: .leading){
                    Text("Save")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(.black))
                        .padding()
                        .frame(width: 171.5, height: 55, alignment: .center)
                        .background(Color(red: 0.85, green: 0.92, blue: 0.89))
                        .cornerRadius(10)
                }
            }
        }.navigationBarTitle("Save")
    }
}

struct SaveNewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SaveNewPasswordView()
    }
}
