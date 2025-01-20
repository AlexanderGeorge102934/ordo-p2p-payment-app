//
//  PaymentView.swift
//  Ordo
//
//  Created by Alexander George on 1/17/25.
//

import SwiftUI

struct PaymentView: View {
    @State private var amountString: String = "0"      // Initial UI display
    @State private var payment = PaymentController()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // Amount Input (UI Logic)
            HStack(spacing: 2) {
                Text("$")
                    .font(.system(size: 70, weight: .bold))
                
                TextField("", text: $amountString)
                    .font(.system(size: 70, weight: .bold))
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.leading)
                    .fixedSize()
                    .onChange(of: amountString) { newValue in
                        // 1. Filter out non-digit characters
                        let digitsOnly = newValue.filter { $0.isNumber }
                        
                        // 2. Reset to "0" if all digits are removed
                        if digitsOnly.isEmpty {
                            amountString = "0"
                            payment.amount = 0
                            return
                        }
                        
                        // 3. Remove leading zeros if more than one digit
                        var processedInput = digitsOnly
                        while processedInput.count > 1 && processedInput.first == "0" {
                            processedInput.removeFirst()
                        }
                        
                        // 4. (Optional) Enforce a max length or value. Here we limit to 3 digits.
                        let limitedDigits = String(processedInput.prefix(3))
                        
                        // 5. Update the text field
                        amountString = limitedDigits
                        
                        // 6. Convert to Decimal; fallback to 0 if conversion fails
                        if let decimalValue = Decimal(string: limitedDigits) {
                            payment.amount = decimalValue
                        } else {
                            payment.amount = 0
                        }
                    }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            
            Spacer()
            
            // Note Input
            TextField("What's this for?", text: $payment.note)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            // Action Buttons
            HStack(spacing: 20) {
                Button(action: {
                    payment.sendPayment()
                }) {
                    Text("Request")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.primaryAccent)
                        .cornerRadius(30)
                }
                
                Button(action: {
                    payment.sendPayment()
                }) {
                    Text("Pay")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.primaryAccent)
                        .foregroundColor(.black)
                        .cornerRadius(30)
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
