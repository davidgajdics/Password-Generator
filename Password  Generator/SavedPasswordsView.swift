//
//  SavedPasswordsView.swift
//  Password  Generator
//
//  Created by David Gajdics on 12.04.21.
//

import SwiftUI

struct SavedPasswordsView: View {
    
    init() {
            coloredNavAppearance.backgroundColor = UIColor(red: 0.37, green: 0.67, blue: 0.66, alpha: 1.00)
        
            UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
            UITableView.appearance().backgroundColor = .clear
        }

            let screenSize = UIScreen.main.bounds
    
    @State private var search : String = ""
    @State private var isEditing = false
    @State private var delete = true
    
    var body: some View {
        NavigationView{
            ZStack{
                
                VStack{
                    Spacer(minLength: 15)
                    Group{
//--------------------------------
                    //Search bar
//--------------------------------
                        HStack{
                            
                            TextField("Search" ,text: $search )
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 10)
                                .onTapGesture {
                                    self.isEditing = true
                                }
                            
                            if isEditing {
                                    Button(action: {
                                        self.search = ""
                                    }) {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                }
                            }
                            if isEditing {
                                
                                Button(action: {
                                    self.isEditing = false
                                    self.search = ""
                 
                                }) {
                                    Text("Cancel")
                                        .foregroundColor(.black)
                                        .bold()
                                        .font(.title3)
                                        
                                }
                                .padding(.trailing, 10)
                                .transition(.move(edge: .trailing))
                                .animation(.default)
                            }
                            
                            Spacer()
                            
                        }
                        
                        //--------------------------------
                            //DataObject
                        //--------------------------------
                        Form{
                            NavigationLink(destination: Example1View()){
                                Text("Twitter")
                                    .padding()
                            }
                            NavigationLink(destination: Example1View()){
                                Text("Clubhouse")
                                    .padding()
                            }
                            NavigationLink(destination: Example1View()){
                                Text("LinkedIn")
                                    .padding()
                            }
                            NavigationLink(destination: Example1View()){
                                Text("Duolingo")
                                    .padding()
                            }
                            NavigationLink(destination: Example1View()){
                                Text("Twitch")
                                    .padding()
                            }
                        }
                    }
                }
                Spacer()
                .navigationTitle("Passwords")
            }
        }
    }
}
struct SavedPasswordsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedPasswordsView()
    }
}
