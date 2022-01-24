//
//  ContentView.swift
//  Password  Generator
//
//  Created by David Gajdics on 05.03.21.
//

import SwiftUI
import UIKit

let coloredNavAppearance = UINavigationBarAppearance()
class sendData: ObservableObject {
    @Published var pass = ""
}

struct ContentView: View {
 
    init() {
        coloredNavAppearance.backgroundColor = UIColor(red: 0.58, green: 0.82, blue: 0.80, alpha: 1.00)
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor(red: 0.02, green: 0.01, blue: 0.01, alpha: 1.00)]
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        UITableView.appearance().backgroundColor = .clear
        }
    
    @AppStorage ("Lower Case") private var lowerCase : Bool = true
    @AppStorage ("Upper Case") private var upperCase : Bool = true
    @AppStorage ("Numbers") private var numbers : Bool = true
    @AppStorage ("Special Symbols") private var specialSymbols : Bool = false
    @State private var copyVisible : Bool = true
    @AppStorage ("Length") public var len : Double = 8.0
    @AppStorage ("Password Generator") private var pass = "Password Generator"
    @State private var showSheet  : Bool = false
    @State public var showExample1View = false

    var body: some View {
        
        NavigationView{
            ZStack{
                VStack(){
                    Spacer(minLength: 50)
                    Group{
                        Text("\(pass)")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color.black)
                            
                        Spacer(minLength: 50)
                        
//------------------------------------------
                        // Form
//------------------------------------------
                        Form{
                            
                            Toggle("Lower Case: (a-z)", isOn: $lowerCase)
                                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.37, green: 0.67, blue: 0.66)))
                            Toggle("Upper Case: (A-Z)", isOn: $upperCase)
                                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.37, green: 0.67, blue: 0.66)))
                            Toggle("Numbers: (0-9) ", isOn: $numbers)
                                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.37, green: 0.67, blue: 0.66)))
                            Toggle("Special Symbols: (%$_§#) ", isOn: $specialSymbols)
                                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.37, green: 0.67, blue: 0.66)))
                            Slider(value: $len, in: 3...20)
                                .accentColor(Color(red: 0.58, green: 0.82, blue: 0.80))
                                .colorMultiply(Color(red: 0.37, green: 0.67, blue: 0.66))
                            HStack{
                                Text("Password Length:")
                                Spacer()
                                Text("\(Int(len))")
                                    .font(.title3)
                                }
                            }.onAppear {
                                UITableView.appearance().isScrollEnabled = false
    
                            }
                        Spacer()

//---------------------------------
                        // Generate
//---------------------------------
                    VStack{
                            Button(action: {
                                if(lowerCase && upperCase && numbers && specialSymbols == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890~`! @#$%^&*()_-+={[}]|\"'<,>.?/")
                                    for _ in (1...(Int(len))) {
                                        pass += String(chars.randomElement()!)
                                    }
                                    UIPasteboard.general.string = pass
                                }
                                else if(lowerCase && upperCase && numbers == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(lowerCase && upperCase && specialSymbols == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~`!@#$%^&*()_-+={[}]|\"'<,>.?/")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(lowerCase && numbers && specialSymbols == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("abcdefghijklmnopqrstuvwxyz1234567890~`! @#$%^&*()_-+={[}]|\"'<,>.?/")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(upperCase && numbers && specialSymbols == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890~`! @#$%^&*()_-+={[}]|\"'<,>.?/")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(lowerCase && specialSymbols == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("abcdefghijklmnopqrstuvwxyz~`! @#$%^&*()_-+={[}]|\"'<,>.?/")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(upperCase && specialSymbols == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("ABCDEFGHIJKLMNOPQRSTUVWXYZ~`! @#$%^&*()_-+={[}]|\"'<,>.?/")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(numbers && specialSymbols == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("0123456789~!@#$%^&*()_-+={[}]|\"'<,>.?/")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(lowerCase && upperCase == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(lowerCase && numbers == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("abcdefghijklmnopqrstuvwxyz1234567890")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(upperCase && numbers == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(lowerCase == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("abcdefghijklmnopqrstuvwxyz")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(upperCase == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(numbers == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("1234567890")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                else if(specialSymbols == true){
                                    copyVisible = true
                                    pass = "";
                                    let chars = ("~`! @#$%^&*()_-+={[}]|\"'<,>.?/")
                                    for _ in 1...(Int(len)) {
                                        pass += String(chars.randomElement()!)
                                    }
                                }
                                
                            }, label: {
                                HStack() {
                                    Text("Generate")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(Color.black)
                                        .padding()
                                        .frame(width: 380, height: 50, alignment: .center)
                                        .background(Color(red: 0.58, green: 0.82, blue: 0.80))
                                        .cornerRadius(8)
                                }
                            })
                        }
                                HStack{
//------------------------------------------
                                    // Copy
//------------------------------------------
                                    Button(action: {
                                         UIPasteboard.general.string = pass
                                     }, label: {
                                         Text("Copy")
                                             .font(.title3)
                                             .bold()
                                             .foregroundColor(Color.black)
                                             .padding()
                                            .frame(width: 185, height: 50, alignment: .center)
                                             .background(Color(red: 0.58, green: 0.82, blue: 0.80))
                                             .cornerRadius(8)
                                     })
//------------------------------------------
                                    // Save
//-----------------------------------------
                                    
                                    Button(action: {
                                        self.showExample1View.toggle()
                                        
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
                                        .sheet(isPresented: $showExample1View){
                                            Example1View()
                                    }
                                }
                            }
                    
                        Spacer(minLength: 50)
                    
                    }
                }.navigationTitle("Generate")
            }
        }
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}




