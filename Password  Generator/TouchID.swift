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
            }else{
                Image("lock")
            }
        }
        .onAppear(perform: autitencate)
    }
    func autitencate(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "We need unlock your data."
            
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
