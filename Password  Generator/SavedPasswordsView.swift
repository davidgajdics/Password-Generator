//
//  SavedPasswordsView.swift
//  Password  Generator
//
//  Created by David Gajdics on 12.04.21.
//

import SwiftUI

struct SavedPasswordsView: View {
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .clear
    }
    
    @State private var search : String = ""
    @State private var isEditing = false
    @State private var delete = true
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.09, green: 0.30, blue: 0.28).ignoresSafeArea()
                
                VStack{
                    
                    Group{
//--------------------------------
                    //Search bar
//--------------------------------
                        HStack{
                            TextField("Search" ,text: $search )
                                .padding(8)
                                .padding(.horizontal, 20)
                                .background(Color(.white))
                                .cornerRadius(8)
                                .padding(.horizontal, 15)
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
                                        .foregroundColor(.white)
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
                            VStack{
                                Section(header: Text("")){
                                    HStack{
                                        Text("Website:")
                                            Spacer()
                                        Text("davdevstory.com")
                                            .foregroundColor(.gray)
                                            .padding()
                                    }
                                    Divider()
                                    HStack{
                                        Text("Username:")
                                        Spacer()
                                        Text("LMA-7165")
                                            .foregroundColor(.gray)
                                            .padding()
                                    }
                                    Divider()
                                    Button(action: {
                                        
                                    }, label: {
                                        Text("details")
                                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(.pink)
                                    })
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Passwords")
        }
    }
}
struct SavedPasswordsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedPasswordsView()
    }
}
