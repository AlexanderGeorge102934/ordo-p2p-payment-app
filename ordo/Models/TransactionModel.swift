//
//  TransactionModel.swift
//  Ordo
//
//  Created by Alexander George on 1/17/25.
//

import Foundation

// Model for a transaction
struct TransactionModel: Identifiable {
    let id: UUID
    let sender: String
    let receiver: String
    let amount: Double
    let timestamp: Date
    let note: String?
}
