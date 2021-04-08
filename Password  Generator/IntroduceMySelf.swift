//
//  IntroduceMySelf.swift
//  Password  Generator
//
//  Created by David Gajdics on 06.03.21.
//

import SwiftUI

struct IntroduceMySelf: View {
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
              }
    
    var body: some View {
        NavigationView{
        ZStack{
            Color(red: 0.09, green: 0.30, blue: 0.28).ignoresSafeArea()
            VStack{
                Spacer()
                Image("davidgajdics")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Text("David Gajdics")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundColor(.white)
                Text("Junior iOS Developer")
                    .font(.footnote)
                    .foregroundColor(.white)

                        Spacer()
                Button(action: {
                    // action
                }) {
                    Text("gajdics.david@hotmail.com")
                        .bold()
                        .foregroundColor(Color(red: 0.07, green: 0.2, blue: 0.37))
                        .padding()
                        .background(Color(red: 0.83, green: 0.88, blue: 0.92))
                        .cornerRadius(1.0)
                }
                Button(action: {
                    // action
                }) {
                    Text("www.davidgajdics.com")
                        .bold()
                        .foregroundColor(Color(red: 0.07, green: 0.2, blue: 0.37))
                        .padding()
                        .background(Color(red: 0.83, green: 0.88, blue: 0.92))
                        .cornerRadius(1.0)
                }
                Spacer()
                    }
                Spacer()
                }.navigationBarTitle("Contact")
        }
    }
}
struct IntroduceMySelf_Previews: PreviewProvider {
    static var previews: some View {
        IntroduceMySelf()
    }
}
