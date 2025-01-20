//
//  TransactionHistoryView.swift
//  Ordo
//
//  Created by OrdoDev on 1/17/25.
//

import SwiftUI

struct TransactionHistoryView: View {
    @StateObject private var viewModel = TransactionHistoryViewModel()
    
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

struct TransactionRow: View {
    let transaction: TransactionModel
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(transaction.sender) paid \(transaction.receiver)")
                        .fontWeight(.semibold)
                    
                    if let note = transaction.note, !note.isEmpty {
                        Text(note)
                            .font(.headline)
                    }
                    
                    Text("\(transaction.timestamp.formatted(date: .numeric, time: .shortened))")
                        .font(.caption2)
                }
                Spacer()
                Text("$\(String(format: "%.2f", transaction.amount))")
                    .fontWeight(.bold)
            }
            .padding()
        }
        .padding(.vertical, 4)
    }
}
