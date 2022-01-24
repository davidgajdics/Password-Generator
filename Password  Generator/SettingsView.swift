//
//  SettingsView.swift
//  Password  Generator
//
//  Created by David Gajdics on 16.03.21.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage ("Biometrics") private var touchIdIsUnlocked = false
    @State private var showingAlert = false
    var languages = ["English","Deutsch","Magyar"]
    @AppStorage ("Language") private var language = "English"
    @AppStorage ("DarkMode") private var isDarkModeEnable = false

var body: some View {
    NavigationView {
        ZStack{
            VStack{
                    Form{
                        Section(header: Text("Passcode").foregroundColor(.white)){
                        Toggle("Touch ID / Face ID :", isOn: $touchIdIsUnlocked)
                        }
                        Section(header: Text("Darkmode").foregroundColor(.white)){
                            Toggle("Preferated Mode: ", isOn: $isDarkModeEnable)
                        }
                        Section(header: Text("Language").foregroundColor(.white)){
                            Picker("Language: ", selection: $language){
                                ForEach(languages, id: \.self){
                                    Text($0)
                                }
                            }
                        }
                        
                        Section(header: Text("Reset").foregroundColor(.white)){
                            Button("Delete all Passwords") {
                                showingAlert = true
                                //remove all content from json
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("Local Password Manager"), message: Text("Are you sure?"), primaryButton: .default(Text("Yes").foregroundColor(.red)), secondaryButton: .default(Text("No")))
                            }
                            .foregroundColor(.red)
                        }
                        
                        
                    }
                }
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

