//
//  OrderView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import SwiftUI

struct OrdersView: View {
    
    @State private var orderItems = MockData.foodysUi
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(orderItems) { foody in
                        FoodyItemView(foodyListItemUI: foody)
                    }
                    .onDelete(perform: deleteItem)
                }
                .listStyle(GroupedListStyle())
                
                Button {
                    print("🚀🚀🚀")
                } label: {
                    Label("Place Order",
                          systemImage: "takeoutbag.and.cup.and.straw")
                    .frame(maxWidth: .infinity)
                }
                .padding(.bottom, 30)
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Orders 🍻")
        }
    }
    
    func deleteItem(_ indexSet: IndexSet) {
        orderItems.remove(atOffsets: indexSet)
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
