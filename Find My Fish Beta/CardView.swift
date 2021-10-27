//
//  CardView.swift
//  Find My Fish Beta
//
//  Created by NMI Capstone on 9/28/21.
//

import SwiftUI

struct CardView: View {
    
    @Environment(\.presentationMode) var presentationMode // for custom back button
    var fish: Fish
    var num: Int
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color ("Blueish"), Color("Greenish")]), startPoint: .topTrailing, endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                ZStack (alignment: .center) {
                    GeometryReader { geo in
                        ZStack (alignment: .center) {
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(alignment: .center)
                                {
                                    // Spacer for resizable positioning
                                    Spacer()
                                        .frame(height: geo.size.height/8)
                                    
                                    
                                    // custom sizing for fish common name
                                    Text(fish.common)
                                        .font(Font.custom("Montserrat-SemiBold", size: geo.size.height > geo.size.width ? geo.size.width * 0.1: geo.size.height * 0.09))
                                        .multilineTextAlignment(.center)
                                        .padding(5)
                                        .foregroundColor(Color ("BW"))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(3)
                                        .minimumScaleFactor(0.5)
                                    
                                    // custom font for fish scientific name
                                    Text(fish.scientific)
                                        .font(Font.custom("Montserrat-Regular", size: geo.size.height > geo.size.width ? geo.size.width * 0.06: geo.size.height * 0.09))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color ("BW"))
                                        .lineLimit(3)
                                        .minimumScaleFactor(0.5)
                                    
                                    
                                    // Spacer for resizable positioning
                                    Spacer()
                                        .frame(height: geo.size.height/20)
                                    
                                    ZStack {
                                        Image("NotFound")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxHeight: 200)
                                        
                                        Image(fish.photo)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                            .padding(5)
                                            .shadow(color: .black, radius: 5, x: 4, y: 8)
                                    }
                                    
                                    // Spacer for resizable positioning
                                    Spacer()
                                        .frame(height: geo.size.height/30)
                                    
                                    Text("Found in: " + fish.marine)
                                        .font(Font.custom("Montserrat-Regular", size: geo.size.height > geo.size.width ? geo.size.width * 0.06: geo.size.height * 0.09))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color ("BW"))
                                        .minimumScaleFactor(0.5)
                                    
                                    // custom font for fish distribution
                                    Text(fish.distribution)
                                        .font(Font.custom("Montserrat-Regular", size: geo.size.height > geo.size.width ? geo.size.width * 0.06: geo.size.height * 0.09))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color ("BW"))
                                        .minimumScaleFactor(0.5)
                                        .padding(10)
                                    
                                    // Spacer for resizable positioning
                                    Spacer()
                                        .frame(height: geo.size.height/20)
                                    
                                    // image that shrinks and darkens when paused
                                    // Image("map" + String(Int.random(in: 1..<5)))
                                    ZStack {
                                        Image("NotFound")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxHeight: 200)
                                        
                                        Image(fish.map)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                            .padding(5)
                                            .shadow(color: .black, radius: 5, x: 4, y: 4)
                                    }
                                }
                            }
                        }
                    }
                }
                    .edgesIgnoringSafeArea(.top) // because of custom nav button
                    .navigationBarBackButtonHidden(true)
                // the custom back button
                    .navigationBarItems(leading:
                                            Button(action: {
                                                self.presentationMode.wrappedValue.dismiss()
                                            }, label: {
                                                Image(systemName: "chevron.left.circle.fill")
                                                    .font(.title)
                                                    .foregroundColor(Color ("Blueish").opacity(0.9))
                                                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 3.3, x: 0, y: 0)
                                                
                                            })
                                       )
            )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(fish: ReadData().fishes[32], num: 1)
    }
}
