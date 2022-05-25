//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Luthfi Khan on 25/05/22.
//

import Foundation

struct expenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
