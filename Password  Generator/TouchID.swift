//
//  TouchID.swift
//  Password  Generator
//
//  Created by David Gajdics on 16.03.21.
//

import LocalAuthentication
import SwiftUI

struct TouchID: View {
    
    @State private var isUnlocked = false
    
    var body: some View {
        VStack{
            if self.isUnlocked{
                Image("lock.open.fill")
                    .foregroundColor(.black)
                Text("Welcome!")
            }else{
                Image("lock")
                    .foregroundColor(.black)
                Text("Please try again!")
            }
        }
        .onAppear(perform: autitencate)
    }
    func autitencate(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Verify fingerprint to access Password Manager"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, autheticationError in
                DispatchQueue.main.async {
                    if success{
                        self.isUnlocked = true
                    }else{
                        self.isUnlocked = false
                        }
                    }
                }
                // no
            }else{
            // this device has no biometric idetificator
        }
    }
}
