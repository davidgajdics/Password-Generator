//
//  Generator.swift
//  Password  Generator
//
//  Created by David Gajdics on 07.03.21.
//

import SwiftUI

var lenghtOfPassword = 6
var passwordCharacters  = Array("qwertzuiopasdfghjklyxcvbnmQWERTZUIOPASDFGHJKLYXCVBNM1234567890/!§$%&()=[]")
var renderNewPassword = String((4...lenghtOfPassword).map{ _ in passwordCharacters[Int(arc4random_uniform(UInt32(passwordCharacters.count)))]})

print(renderNewPassword)
        
        
