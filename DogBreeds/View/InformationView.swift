//
//  InformationView.swift
//  DogBreed
//
//  Created by Jordan Isac on 19/07/2023.
//

import SwiftUI

struct InformationView: View {
    //MARK: - PROPERTIES
    
    @State private var enableNotification: Bool = true
    @State private var backGroundfresh: Bool = false
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .center, spacing: 5) {
                Image("Ow")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: Color("ColorBlackTTTransparentLight"), radius: 8, x: 0, y: 4)
                
                Text("Dog Breeds".uppercased())
                    .font(.system(.title,design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color.teal)
            }//VSTACK
            .padding()
            
            Form{
                //MARK: - SECTION #1
                Section(header: Text("General setting")){
                    Toggle(isOn: $enableNotification) {
                        Text("Enable notification")
                    }
                    
                    Toggle(isOn: $backGroundfresh) {
                        Text("Backgrounf refresh")
                    }
                }
                
                Section(header: Text("Application")){
                    if enableNotification {
                        HStack {
                            Text("Product").foregroundColor(Color.gray)
                            Spacer()
                            Text("Dog Breeds")
                        }
                        HStack {
                            Text("Contacts").foregroundColor(Color.gray)
                            Spacer()
                            Text("Phone & Email")
                        }
                        HStack {
                            Text("Email").foregroundColor(Color.gray)
                            Spacer()
                            Text("dogs.breed@bark.co.uk")
                        }
                        HStack {
                            Text("Phone").foregroundColor(Color.gray)
                            Spacer()
                            Text("+447123456789")
                        }
                        HStack {
                            Text("Website").foregroundColor(Color.gray)
                            Spacer()
                            Text("dogbreeds.com")
                        }
                        HStack {
                            Text("Version").foregroundColor(Color.gray)
                            Spacer()
                            Text("1.0.0")
                        }
                    } else {
                        HStack{
                            Text("Personal message").foregroundColor(Color.gray)
                            Spacer()
                            Text("Find a friend in a dog!")
                        }
                    }
                    
                }
            }
        }
        .frame(maxWidth: 640)
        .background(Color.background2)
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
