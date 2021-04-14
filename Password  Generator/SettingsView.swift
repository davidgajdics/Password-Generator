//
//  SettingsView.swift
//  Password  Generator
//
//  Created by David Gajdics on 16.03.21.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var touchIdIsUnlocked = true
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.09, green: 0.30, blue: 0.28).ignoresSafeArea()
                VStack{
                    Form{
                        Toggle(isOn: $touchIdIsUnlocked) {
                            Text("Touch ID / Face ID")
                            
                            }
                        if touchIdIsUnlocked {
                            TouchID()
                            }
                        Section{
                            
                        }
                        }
                    }
                }
            .navigationBarTitle("Settings")
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
