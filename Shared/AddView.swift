//
//  AddView.swift
//  iExpense
//
//  Created by Luthfi Khan on 25/05/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject  var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business","Personal "]
    
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Expense name: ", text: $name)
                
                Picker("Expense type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar{
                Button("Add"){
                    let item = expenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
