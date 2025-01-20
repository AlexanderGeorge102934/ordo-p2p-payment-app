//
//  PaymentViewModel.swift
//  Ordo
//
//  Created by OrdoDev on 1/17/25.
//

import SwiftUI

/// ViewModel responsible for holding and validating payment information.
@Observable class PaymentController {
    /// A short note or memo for the payment.
    var note: String = ""
    
    /// The amount of the transaction as a Decimal (more reliable than Double for currency).
    var amount: Decimal = 0
    
    /// For demonstration, we set up an NSDecimalNumberHandler to enforce 2 decimal places (cents).
    /// Adjust roundingMode or scale as needed for your currency logic.
    private let decimalHandler: NSDecimalNumberHandler = {
        NSDecimalNumberHandler(
            roundingMode: .bankers,
            scale: 2,
            raiseOnExactness: false,
            raiseOnOverflow: false,
            raiseOnUnderflow: false,
            raiseOnDivideByZero: false
        )
    }()
    
    /// Sends or requests payment. In production, you would call your secure API here.
    func sendPayment() {
        // Ensure final amount is properly rounded to 2 decimal places (if using a 2-decimal currency).
        let finalAmount = NSDecimalNumber(decimal: amount)
            .rounding(accordingToBehavior: decimalHandler)
        
        // SERVER-SIDE VALIDATION REMINDER:
        // The server must confirm the user can actually pay this amount,
        // check user balance, apply fees, etc. The client is never fully trusted.
        
        // Example action for demonstration:
        print("Sending payment of \(finalAmount) with note: \(note)")
        
        // Actual networking code to interact with your backend would go here.
        // e.g., PaymentAPI.shared.sendPayment(amount: finalAmount.decimalValue, note: note)
    }
}

