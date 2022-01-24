//
//  AppTabView.swift
//  Password  Generator
//
//  Created by David Gajdics on 08.03.21.
//

import SwiftUI

struct AppTabView: View {
    
    var body: some View {
        TabView{
            SavedPasswordsView()
                .tabItem {
                    Image(systemName: "folder")
                    Text("Passwords")
                }
            
            ContentView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Generate")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
        }.accentColor(Color(red: 0.16, green: 0.71, blue: 0.71))
            .animation(.default)
    }
}
struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppTabView()
        }
    }
}
