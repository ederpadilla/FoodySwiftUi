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
            
            ZStack {
                
                ExtractedView(orderItems: $orderItems)
                
                if orderItems.isEmpty {
                    EmptyStateView(image: "note.text",
                                   message: "Theres no orders here 🥲")
                }
            }
            .navigationTitle("Orders 🍻")
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}

struct ExtractedView: View {
    
    @Binding var orderItems: [FoodyListItemUI]
    
    var body: some View {
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
    }
    
    func deleteItem(_ indexSet: IndexSet) {
        orderItems.remove(atOffsets: indexSet)
    }
}
