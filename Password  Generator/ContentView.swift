//
//  ContentView.swift
//  Password  Generator
//
//  Created by David Gajdics on 05.03.21.
//

import SwiftUI
// import Security

struct ContentView: View {
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .clear
    }
    @State private var lowerCase : Bool = true
    @State private var upperCase : Bool = true
    @State private var numbers : Bool = true
    @State private var specialSymbols : Bool = false
    @State private var copyVisible : Bool = true
    let length = ["3","4","6","8","10","16","20"]
    @State public var len : Double = 8.0
    @State private var pass = "Password Generator"
    //let pass = SecCreateSharedWebCredentialPassword() as String?
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.09, green: 0.30, blue: 0.28).ignoresSafeArea()
                
                VStack(){
                    Spacer(minLength: 25)
                    Group{
                        Text("\(pass)")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color.white)
                        Spacer(minLength: 50)
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
                                        .foregroundColor(Color(.black))
                                        .padding()
                                        .frame(width: 350, height: 55, alignment: .center)
                                        .background(Color(red: 0.85, green: 0.92, blue: 0.89))
                                        .cornerRadius(10)
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
                                             .foregroundColor(Color(.black))
                                             .padding()
                                            .frame(width: 171.5, height: 55, alignment: .center)
                                             .background(Color(red: 0.85, green: 0.92, blue: 0.89))
                                             .cornerRadius(10)
                                     })
//------------------------------------------
                                    // Save
//-----------------------------------------
                                        NavigationLink(
                                            destination: SaveNewPasswordView(),
                                            label: {
                                                Text("Save")
                                             .font(.title3)
                                             .bold()
                                             .foregroundColor(Color(.black))
                                             .padding()
                                             .frame(width: 171.5, height: 55, alignment: .center)
                                             .background(Color(red: 0.85, green: 0.92, blue: 0.89))
                                             .cornerRadius(10)
                                     })
                                }
//------------------------------------------
                                    // Form
//------------------------------------------
                        Spacer()
                        Form{
                            Slider(value: $len, in: 3...20)
                                .colorMultiply(.green)
                            HStack{
                                Text("Password Length:")
                                Spacer()
                                Text("\(Int(len))")
                            }
                            Toggle("Lower Case: (a-z)", isOn: $lowerCase)
                            Toggle("Upper Case: (A-Z )", isOn: $upperCase)
                            Toggle("Numbers: (0-9) ", isOn: $numbers)
                            Toggle("Special Symbols: (%$_§#) ", isOn: $specialSymbols)
                        }
                        .onAppear {
                            UITableView.appearance().isScrollEnabled = false
                        }
                    }
                }
            }.navigationTitle("Home")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
        .preferredColorScheme(.light)
    }
}

//content view
    //save button
// settings view
    // authentication with biometrics in App.swift
    //languages
    //info era with IntroduceMySelfView.swift

