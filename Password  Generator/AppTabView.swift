//
//  AppTabView.swift
//  Password  Generator
//
//  Created by David Gajdics on 08.03.21.
//

import SwiftUI

struct AppTabView: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            SavedPasswordsView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Add")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
        }
    
        .accentColor(Color(red: 0.16, green: 0.71, blue: 0.71))
        .animation(.easeInOut)
    }
}
struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppTabView()
        }
    }
}
