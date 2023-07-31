//
//  PaymentButtonView.swift
//  DogBreed
//
//  Created by Jordan Isac on 21/07/2023.
//

import SwiftUI

struct PaymentButtonView: View {
//MARK: - PROPERTIES
    let paymentHandler = PaymentHandler()
    
    //MARK: - BODY
    var body: some View {
        VStack{
            Button {
                self.paymentHandler.startPayment{ success in
                    if success{
                        print("Success")
                    } else {
                        print("Failed")
                    }
                }
                
            } label: {
                Text("Donate with Pay")
                    .font(Font.custom("HelveticaNeue-Bold", size: 16))
                    .padding(10)
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .background(Color.brown)
                    .cornerRadius(10)
            }//BUTTON
          
        }//VSTACK
    }
}
struct PaymentButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentButtonView()
    }
}
