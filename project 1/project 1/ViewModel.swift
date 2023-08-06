//
//  ViewModel.swift
//  project 1
//
//  Created by Alanoud  on 18/01/1445 AH.
//

import Foundation
import SwiftUI

@MainActor class ViewModel: ObservableObject{
    @Published var array : [remaider] = []
    @AppStorage("textFildeTitle") var textFildeTitle:String = ""
    @AppStorage("textFildeNotes") var textFildeNotes: String = ""
    
    func addtoList(titel: String , notes: String){
        let addToArray = remaider(title: titel, notes: notes)
        array.append(addToArray)
    }
}

