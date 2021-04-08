//
//  SettingsView.swift
//  Password  Generator
//
//  Created by David Gajdics on 16.03.21.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var touchIdIsUnlocked = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.00, green: 0.46, blue: 0.50).ignoresSafeArea()
                VStack{
                    Form{
                        Toggle(isOn: $touchIdIsUnlocked) {
                            Text("TouchID / FaceID")
                            }
                        if touchIdIsUnlocked {
                            TouchID()
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
