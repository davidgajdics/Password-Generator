//
//  IntroduceMySelf.swift
//  Password  Generator
//
//  Created by David Gajdics on 06.03.21.
//

import SwiftUI

struct IntroduceMySelf: View {
    
    init() {
        
            coloredNavAppearance.configureWithOpaqueBackground()
            coloredNavAppearance.backgroundColor = UIColor(red: 0.29, green: 0.47, blue: 0.55, alpha: 1.00)
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor(red: 0.56, green: 0.85, blue: 0.66, alpha: 1.00)]
            coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 0.16, green: 0.71, blue: 0.71, alpha: 1.00)]

        
            UINavigationBar.appearance().standardAppearance = coloredNavAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
            UITableView.appearance().backgroundColor = .clear
        }

    private let colors = [
            Color(red: 0.00, green: 0.00, blue: 0.00),
            Color(red: 0.29, green: 0.47, blue: 0.55)
        ]

            let screenSize = UIScreen.main.bounds

var body: some View {
    NavigationView {
        ZStack{
            VStack{
                Image(systemName: "davidgajdics")
                    Form{
                        
                }
                .background(LinearGradient(gradient: Gradient(colors: colors),
                                            startPoint: .bottom, endPoint: .top))
                .navigationTitle("Contact")
            }
        }
    .accentColor(Color(red: 0.16, green: 0.71, blue: 0.71))
    }
    }
}
struct IntroduceMySelf_Previews: PreviewProvider {
    static var previews: some View {
        IntroduceMySelf()
    }
}
