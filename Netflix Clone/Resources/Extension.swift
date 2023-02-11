//
//  Extension.swift
//  Netflix Clone
//
//  Created by Muayad El-haddad on 11/02/2023.
//

import Foundation


extension String {
    func captlizeFirstLetter()-> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
