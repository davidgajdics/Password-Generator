//
//  SavedPasswordsView.swift
//  Password  Generator
//
//  Created by David Gajdics on 12.04.21.
//

import SwiftUI

struct SavedPasswordsView: View {
    
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
    
    @State private var search : String = ""
    @State private var isEditing = false
    @State private var delete = true
    
    var body: some View {
        NavigationView{
            ZStack{
                //Color(red: 0.09, green: 0.30, blue: 0.28).ignoresSafeArea()
                
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
                }.background(LinearGradient(gradient: Gradient(colors: colors),
                                            startPoint: .bottom, endPoint: .top))
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
