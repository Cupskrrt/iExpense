//
//  ContentView.swift
//  Shared
//
//  Created by Luthfi Khan on 25/05/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showAddExpenses = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items, id: \.id){item in
                    HStack(){
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button{
                    showAddExpenses = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddExpenses){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
