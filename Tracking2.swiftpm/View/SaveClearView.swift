//
//  SaveClear.swift
//  Tracking
//
//  Created by YU WONGEUN on 2023/04/15.
//

import SwiftUI

struct SaveClearView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                
                HStack(spacing: 150) {
                    
                    VStack (spacing: 0){
                        Image("Draw")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                        Text("Draw")
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                        Text("Jaw Open")
                            .font(.callout)
                            .foregroundColor(.black)
                    }
                    
                    VStack (spacing: 0){
                        Image("Clear")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                        Text("Clear")
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                        Text("Frown")
                            .font(.callout)
                            .foregroundColor(.black)
                    }
                    
                    VStack (spacing: 0){
                        Image("Save")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                        Text("Save")
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                        Text("Tongue Out")
                            .font(.callout)
                            .foregroundColor(.black)
                    }
                }
                .frame(height: geo.size.height / 8)
            }.frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct SaveClearView_Previews: PreviewProvider {
    static var previews: some View {
        SaveClearView()
    }
}
