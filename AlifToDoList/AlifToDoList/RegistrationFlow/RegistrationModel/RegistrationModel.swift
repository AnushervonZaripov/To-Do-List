//
//  RegistrationViewModel.swift
//  Anush-To-Do-List
//
//  Created by Anushervon Zaripov on 20/09/24.
//

import KeychainSwift

protocol RegistrationViewModelProtocol {
    func registerUser(login: String, password: String) -> Bool
    func authUser(login: String, password: String) -> Bool
}

class RegistrationViewModel: RegistrationViewModelProtocol{
    
    let keychain = KeychainSwift()
    
    func registerUser(login: String, password: String) -> Bool {
        keychain.set(login, forKey: "username")
        keychain.set(password, forKey: "password")
        print("User saved in Keychain")
        return true
    }
    
    func authUser(login: String, password: String) -> Bool {
        guard let storedLogin = keychain.get("username"),
              let storedPassword = keychain.get("password") else {
            print("No user found")
            return false
        }
        if storedLogin == login && storedPassword == password {
            print("Authentication successful")
            return true
        } else {
            print("Authentication failed")
            return false
        }
    }
}

