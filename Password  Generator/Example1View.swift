//
//  Example1View.swift
//  Password  Generator
//
//  Created by David Gajdics on 06.01.22.
//

import SwiftUI
import CryptoKit

struct Example1View: View {
    
    @State private var username = ""
    @State var generatedPassword : String = ContentView().pass
    @State private var hidden : Bool = true
    var letters = ContentView()
    @AppStorage ("STRING_KEY") var savedUser = ""
    @AppStorage ("STRING_KEY") var hash = ""

    var body: some View {
        NavigationView{
            HStack{
                Spacer(minLength: 30)
                VStack{
                    Spacer()
                        TextField("Username or Website: ", text: $username)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(red: 0.58, green: 0.82, blue: 0.80), lineWidth: 2))
                            .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.9/255))
                            .disableAutocorrection(true)
                            .onChange(of: username) { text in
                                self.savedUser = username
                            }
                            .onAppear {
                                self.username = savedUser
                                
                            }
                    Spacer()
                        .frame(minHeight: 10, maxHeight: 15)
                    ZStack{
                        HStack{
                            
                            if self.hidden {
                                SecureField("Password: ", text: $generatedPassword)
                                  //  .frame(width: UIScreen.main.bounds.width - 34)
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(red: 0.58, green: 0.82, blue: 0.80), lineWidth: 2))
                                    .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.9/255))
                                   
                                    
                            }else{
                                TextField("Password: ", text: $generatedPassword)
                                   // .frame(width: UIScreen.main.bounds.width)
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(red: 0.58, green: 0.82, blue: 0.80), lineWidth: 2))
                                    .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.9/255))
                                    
                                    
                            }
                            
                            Button(action: {
                                self.hidden.toggle()
                            }){
                                Image(systemName: self.hidden ? "eye.fill" : "eye.slash.fill")
                                    .frame(width: 52, height: 52, alignment: .center)
                                    .background((self.hidden == false) ?
                                                     Color(red: 0.58, green: 0.82, blue: 0.80) : Color(red: 0.58, green: 0.82, blue: 0.80))
                                    .foregroundColor(.black)
                                    .cornerRadius(5)
                                    
                            }
                        }
                    }

                    Spacer()
                        .frame(minHeight: 10, maxHeight: 25)
                    let pwLength = generatedPassword.count
                    
                    VStack{
                            if(pwLength < 8){
                                HStack{
                                    Text("Weak")
                                        .frame(width: 105, height: 20, alignment: .center)
                                        .background(Color(.red))
                                        .foregroundColor(.white)
                                        .cornerRadius(5)
                                    Spacer()
                                    Text("")
                                        .frame(width: 105, height: 20, alignment: .center)
                                        .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.9/255))
                                        .cornerRadius(5)
                                    Spacer()
                                    Text("")
                                        .frame(width: 105, height: 20, alignment: .center)
                                        .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.9/255))
                                        .cornerRadius(5)
                                }
                            }else if(pwLength < 16){
                                HStack{
                                    Text("")
                                        .frame(width: 105, height: 20, alignment: .center)
                                        .background(Color(.red))
                                        .cornerRadius(5)
                                    Spacer()
                                    Text("Medium")
                                        .frame(width: 105, height: 20, alignment: .center)
                                        .background(Color(.orange))
                                        .cornerRadius(5)
                                    Spacer()
                                    Text("")
                                        .frame(width: 105, height: 20, alignment: .center)
                                        .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.9/255))
                                        .cornerRadius(5)
                                }
                                
                            }else if(pwLength <= 20){
                                HStack{
                                    Text("")
                                        .frame(width: 105, height: 20, alignment: .center)
                                        .background(Color(.red))
                                        .cornerRadius(5)
                                    Spacer()
                                    Text("")
                                        .frame(width: 105, height: 20, alignment: .center)
                                        .background(Color(.orange))
                                        .cornerRadius(5)
                                    Spacer()
                                    Text("Strong")
                                        .frame(width: 105, height: 20, alignment: .center)
                                        .background(Color(.green))
                                        .cornerRadius(5)
                                }
                            }
                        
                        Spacer()
                            .frame(minHeight: 10, maxHeight: 50)
                        
                        Group{
                            if (letters.lowerCase == true){
                                HStack{
                                    Image(systemName: "checkmark.square.fill")
                                        .foregroundColor(.green)
                                    Text("Lower Case")
                                        .foregroundColor(.green)
                                        .bold()
                                    Spacer()
                                }
                                
                            }else{
                                HStack{
                                    Image(systemName: "x.square.fill")
                                        .foregroundColor(.red)
                                    Text("Lower Case")
                                        .foregroundColor(.red)
                                        .bold()
                                    Spacer()
                                }
                            }
                            
                            if (letters.upperCase == true){
                                HStack{
                                    Image(systemName: "checkmark.square.fill")
                                        .foregroundColor(.green)
                                    Text("Upper Case")
                                        .foregroundColor(.green)
                                        .bold()
                                    Spacer()
                                }
                            }else{
                                HStack{
                                    Image(systemName: "x.square.fill")
                                        .foregroundColor(.red)
                                    Text("Upper Case")
                                        .foregroundColor(.red)
                                        .bold()
                                    Spacer()
                                }
                            }
                            
                            if (letters.numbers == true){
                                HStack{
                                    Image(systemName: "checkmark.square.fill")
                                        .foregroundColor(.green)
                                    Text("Numbers")
                                        .foregroundColor(.green)
                                        .bold()
                                    Spacer()
                                }
                            }else{
                                HStack{
                                    Image(systemName: "x.square.fill")
                                        .foregroundColor(.red)
                                    Text("Numbers")
                                        .foregroundColor(.red)
                                        .bold()
                                    Spacer()
                                }
                            }
                            
                            if (letters.specialSymbols == true){
                                HStack{
                                    Image(systemName: "checkmark.square.fill")
                                        .foregroundColor(.green)
                                    Text("Special Charanters")
                                        .foregroundColor(.green)
                                        .bold()
                                    Spacer()
                                }
                            }else{
                                HStack{
                                    Image(systemName: "x.square.fill")
                                        .foregroundColor(.red)
                                    Text("Special Charanters")
                                        .foregroundColor(.red)
                                        .bold()
                                    Spacer()
                                }
                            }
                        }
                    }
                    
                    Spacer()
                           
                    Button(action: {
                        // some action
                    }, label: {
                        Text("Save")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color.black)
                            .padding()
                            .frame(width: 185, height: 50, alignment: .center)
                            .background(Color(red: 0.58, green: 0.82, blue: 0.80))
                            .cornerRadius(8)
                           })
                    
                    Spacer()
                    }
                
                Spacer(minLength: 30)
                }
            .navigationTitle("Add password")
        }
    }
}

struct Example1View_Previews: PreviewProvider {
    static var previews: some View {
        Example1View()
    }
}
