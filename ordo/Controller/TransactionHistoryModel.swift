//
//  TransactionHistoryModel.swift
//  Ordo
//
//  Created by Alexander George on 1/17/25.
//

import SwiftUI
import Combine

class TransactionHistoryModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    init() {
        // Placeholder data for demonstration
        self.transactions = [
            Transaction(
                id: UUID(),
                sender: "Alice",
                receiver: "Bob",
                amount: 25.00,
                timestamp: Date(),
                note: "Groceries"
            ),
            Transaction(
                id: UUID(),
                sender: "Charlie",
                receiver: "Alice",
                amount: 10.00,
                timestamp: Date(),
                note: "Some groceries and weed"
            ),
            Transaction(
                id: UUID(),
                sender: "Bob",
                receiver: "Alice",
                amount: 40.00,
                timestamp: Date(),
                note: nil
            )
        ]
    }
}
