//
//  ContentView.swift
//  Password  Generator
//
//  Created by David Gajdics on 05.03.21.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct ContentView: View {
 
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
    
    @AppStorage ("Lower Case") private var lowerCase : Bool = true
    @AppStorage ("Upper Case") private var upperCase : Bool = true
    @AppStorage ("Numbers") private var numbers : Bool = true
    @AppStorage ("Special Symbols") private var specialSymbols : Bool = false
    @State private var copyVisible : Bool = true
    @AppStorage ("Length") public var len : Double = 8.0
    @AppStorage ("Password Generator") private var pass = "Password Generator"
    @State private var showSheet  : Bool = false

    var body: some View {
        NavigationView{
            ZStack{
                VStack(){
                    Spacer(minLength: 100)
                    Group{
                        Text("\(pass)")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color(red: 0.16, green: 0.71, blue: 0.71))
                            
                        Spacer(minLength: 50)
                        
//------------------------------------------                                                            // Form
//------------------------------------------
                        Form{
                            
                            Toggle("Lower Case: (a-z)", isOn: $lowerCase)
                                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.16, green: 0.71, blue: 0.71)))
                            Toggle("Upper Case: (A-Z)", isOn: $upperCase)
                                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.16, green: 0.71, blue: 0.71)))
                            Toggle("Numbers: (0-9) ", isOn: $numbers)
                                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.16, green: 0.71, blue: 0.71)))
                            Toggle("Special Symbols: (%$_§#) ", isOn: $specialSymbols)
                                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.16, green: 0.71, blue: 0.71)))
                            Slider(value: $len, in: 3...20)
                                .accentColor(Color(red: 0.16, green: 0.71, blue: 0.71))
                                .colorMultiply(Color(red: 0.56, green: 0.85, blue: 0.66))
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
                                        .foregroundColor(Color(red: 0.56, green: 0.85, blue: 0.66))
                                        .padding()
                                        .frame(width: 380, height: 50, alignment: .center)
                                        .background(Color(red: 0.29, green: 0.47, blue: 0.55))
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
                                             .foregroundColor(Color(red: 0.56, green: 0.85, blue: 0.66))
                                             .padding()
                                            .frame(width: 185, height: 50, alignment: .center)
                                             .background(Color(red: 0.29, green: 0.47, blue: 0.55))
                                             .cornerRadius(8)
                                     })
//------------------------------------------
                                    // Save
//-----------------------------------------
                                    Button(action: {
                                        self.showSheet = true
                                    }, label: {
                                        Text("Save")
                                     .font(.title3)
                                     .bold()
                                     .foregroundColor(Color(red: 0.56, green: 0.85, blue: 0.66))
                                     .padding()
                                     .frame(width: 185, height: 50, alignment: .center)
                                     .background(Color(red: 0.29, green: 0.47, blue: 0.55))
                                     .cornerRadius(8)
                                    })
                                    .sheet(isPresented: $showSheet){
                                        NewPassword(onDismiss: {
                                            self.showSheet = false
                                        })
                                    }
                        }
                        Spacer(minLength: 50)
                    }
                }
                .background(LinearGradient(gradient: Gradient(colors: colors),
                   startPoint: .bottom, endPoint: .top))
                Spacer()
            }.navigationTitle("Home")
        }
    }
}

//------------------------------------------
                        // Upcoming window
//-----------------------------------------


struct NewPassword : View {
    
    var onDismiss: () -> ()
    
    @AppStorage("website") private var website : String = ""
    @AppStorage("username") private var username : String = ""
    @State private var password : String = "\([UIPasteboard.general.string])"
    @State private var notes : String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                
            
            VStack(){
                Spacer()
                    Form{
                        TextField("Website: example.com", text: $website)
                        TextField("Username: user / ID", text: $username)
                        TextField("Passwor: Hello World", text: $password)
                        TextField("Notes:", text: $notes)
                    }
                
                Button(action: {
                    self.onDismiss()
                    // stortage data
                }, label: {
                    Text("Save")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(red: 0.56, green: 0.85, blue: 0.66))
                        .padding()
                        .frame(width: 350, height: 55, alignment: .center)
                        .background(Color(red: 0.29, green: 0.47, blue: 0.55))
                        .cornerRadius(10)
                })
                Spacer()
            }
                    }
            .navigationTitle("Add new Password")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "fr"))
    }
}




