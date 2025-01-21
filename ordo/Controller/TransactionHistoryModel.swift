//
//  TransactionHistoryModel.swift
//  Ordo
//
//  Created by Alexander George on 1/17/25.
//

import SwiftUI
import Combine

@Observable class TransactionHistoryModel {
    var transactions: [TransactionModel] = []
    
    init() {
        // Placeholder data for demonstration
        self.transactions = [
            TransactionModel(
                id: UUID(),
                sender: "Alice",
                receiver: "Bob",
                amount: 25.00,
                timestamp: Date(),
                note: "Groceries"
            ),
            TransactionModel(
                id: UUID(),
                sender: "Charlie",
                receiver: "Alice",
                amount: 10.00,
                timestamp: Date(),
                note: "Some groceries and weed"
            ),
            TransactionModel(
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
