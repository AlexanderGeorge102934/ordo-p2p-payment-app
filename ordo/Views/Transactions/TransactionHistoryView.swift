//
//  TransactionHistoryView.swift
//  Ordo
//
//  Created by Alexander George on 1/17/25.
//

import SwiftUI

/// Shows the user's transaction history
struct TransactionHistoryView: View {
    @StateObject private var viewModel = TransactionHistoryModel()
    
    var body: some View {
            VStack {
                Text("Transactions")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 16)
                    .shadow(radius: 2)
                
                List {
                    ForEach(viewModel.transactions) { transaction in
                        TransactionRow(transaction: transaction)
                            .listRowBackground(Color.clear)
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
            }
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryView()
    }
}

/// Shows a single transaction Sender -> Reciever paid $X
struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    // User paid receiver
                    Text("\(transaction.sender) paid \(transaction.receiver)")
                        .fontWeight(.semibold)
                    
                    // Note
                    if let note = transaction.note, !note.isEmpty {
                        Text(note)
                            .font(.headline)
                    }
                    
                    // Timestamp
                    Text("\(transaction.timestamp.formatted(date: .numeric, time: .shortened))")
                        .font(.caption2)
                }
                
                Spacer()
                
                // Transaction amount
                Text("$\(String(format: "%.2f", transaction.amount as CVarArg))")
                    .fontWeight(.bold)
            }
            .padding()
        }
        .padding(.vertical, 4)
    }
}
