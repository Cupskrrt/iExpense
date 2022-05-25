//
//  Expenses.swift
//  iExpense
//
//  Created by Luthfi Khan on 25/05/22.
//

import Foundation

class Expenses: ObservableObject{
    @Published var items = [expenseItem](){
        didSet{
            let encoder = JSONEncoder()
            
            //buat ngesave data
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        //buat ngebaca data
        if let saveItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([expenseItem].self, from: saveItems){
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
