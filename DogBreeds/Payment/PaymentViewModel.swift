//
//  PaymentViewModel.swift
//  DogBreed
//
//  Created by Jordan Isac on 21/07/2023.
//

import Foundation
import SwiftUI
import PassKit

typealias PaymentCompletionHandler = (Bool) -> Void

class PaymentHandler: NSObject {

var paymentController: PKPaymentAuthorizationController?
var paymentSummaryItems = [PKPaymentSummaryItem]()
var paymentStatus = PKPaymentAuthorizationStatus.failure
var completionHandler: PaymentCompletionHandler?

    func startPayment(completion: @escaping PaymentCompletionHandler) {
        
        completionHandler = completion
        
        // Create our payment request
        let paymentRequest = PKPaymentRequest()
        
        
        
        paymentRequest.merchantIdentifier = "merchant.app1.DogBreeds"
        
        paymentRequest.supportedNetworks = [.masterCard,.visa,.amex]
            paymentRequest.supportedCountries = ["GB", "US", "IN"]
            paymentRequest.merchantCapabilities = .capability3DS
            
            paymentRequest.countryCode = "GB"
            paymentRequest.currencyCode = "GBP"
            
           // paymentRequest.requiredShippingContactFields =
            //[.phoneNumber,.emailAddress,.name,.postalAddress]
            
            paymentRequest.paymentSummaryItems = [PKPaymentSummaryItem(label: "Donate", amount: 5)]

            // Display our payment request
            paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
            paymentController?.delegate = self
            paymentController?.present(completion: { (presented: Bool) in
                if presented {
                    NSLog("Presented payment controller")
                } else {
                    NSLog("Failed to present payment controller")
                    self.completionHandler!(false)
                 }
             })
          }
        }

        extension PaymentHandler: PKPaymentAuthorizationControllerDelegate {

        func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {

            // Perform some very basic validation on the provided contact information
            if payment.shippingContact?.emailAddress == nil || payment.shippingContact?.phoneNumber == nil {
                paymentStatus = .failure
            } else {
                // Here you would send the payment token to your server or payment provid
                // Once processed, return an appropriate status in the completion handler (success, failure, etc)
                       paymentStatus = .success
                   }

                   completion(paymentStatus)
               }

               func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
                   controller.dismiss {
                       DispatchQueue.main.async {
                           if self.paymentStatus == .success {
                               self.completionHandler!(true)
                           } else {
                               self.completionHandler!(false)
                           }
                       }
                   }
               }

               }




