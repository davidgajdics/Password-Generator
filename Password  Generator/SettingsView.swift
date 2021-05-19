//
//  SettingsView.swift
//  Password  Generator
//
//  Created by David Gajdics on 16.03.21.
//

import SwiftUI

struct SettingsView: View {
    
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
    
    @State private var touchIdIsUnlocked = false
    @State private var showingAlert = false

var body: some View {
    NavigationView {
        ZStack{
            VStack{
                    Form{
                        Section(header: Text("Passcode").foregroundColor(.white)){
                        Toggle("Touch ID / Face ID :", isOn: $touchIdIsUnlocked)
                        }
                        Section(header: Text("Reset").foregroundColor(.white)){
                            Button("Delete all Passwords") {
                                showingAlert = true
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("Local Password Manager"), message: Text("Are you sure?"), primaryButton: .default(Text("Yes").foregroundColor(.red)), secondaryButton: .default(Text("No")))
                            }
                            .foregroundColor(.red)
                        }
                    }
                }
                .background(LinearGradient(gradient: Gradient(colors: colors),
                                            startPoint: .bottom, endPoint: .top))
                .navigationTitle("Settings")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(
                            destination: IntroduceMySelf(),
                                label: {
                                    Label("Info", systemImage: "info.circle")
                                        .foregroundColor(Color(red: 0.16, green: 0.71, blue: 0.71))
                                        .font(.title)
                        })
                    }
                }
            }
        }
    .accentColor(Color(red: 0.16, green: 0.71, blue: 0.71))
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

