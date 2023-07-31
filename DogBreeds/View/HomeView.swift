//
//  HomeView.swift
//  DogBreed
//
//  Created by Jordan Isac on 06/07/2023.
//

import SwiftUI

struct HomeView: View {
    //MARK: - PROPERTIES
    @State private var pulsateAnimation: Bool = false
    
    var body: some View {
        VStack {
            
            Image("Ow")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400, height: 400, alignment: .center)
                .shadow(color: Color.black, radius: 12, x: 0, y: 8)
//                .scaleEffect(self.pulsateAnimation ? 1 : 0.9)
//                .opacity(self.pulsateAnimation ? 1 : 0.9)
//                .animation(Animation.easeOut(duration: 1.5).repeatForever(autoreverses: true))
                .offset(y: pulsateAnimation ? 35 : -35)
                .animation(.easeOut(duration: 4)
                    .repeatForever(), value: pulsateAnimation)
            
            VStack {
                Text("Dogs".uppercased())
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(Color.brown)
                    .padding()
                    .shadow(color: Color.black, radius: 4, x: 0, y: 4)
                
                Text("""
All dogs are wonderful, no matter their breed. But you might discover that some breeds suit you, your family and your circumstances a bit better than others. Get to know the most popular breeds.
""")
                .lineLimit(nil)
                .font(.system(.headline, design: .serif))
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth: 640, maxHeight: 120)
                .padding()
                
                PaymentButtonView()
                
                Text("Please click to donate to our charity")
                    .lineLimit(nil)
                    .font(.system(.headline, design: .serif))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
            }
            .padding()
            Spacer()
            
          
           // Spacer()
        }//VSTACK
        .background(
        Image("pap")
            .resizable()
            .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            self.pulsateAnimation.toggle()
        })

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
