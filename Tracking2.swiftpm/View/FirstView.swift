//
//  onBoarding1.swift
//  Tracking
//
//  Created by YU WONGEUN on 2023/04/17.
//

import SwiftUI

struct FirstView: View {
    
    @State private var fontSize = (UIScreen.main.bounds.width / 11)
    @State var tag: Int? = nil
    @State private var colors: [Color] = [.red, .yellow, .green, .purple]
    @State private var currentColorIndex = 0
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                
                ZStack {
                    
                    NavigationLink(destination: SecondView(), tag: 1, selection: self.$tag) { EmptyView() }
                    
                    VStack {
                        
                        Spacer()
                        
                        Text("Eyeing Art")
                            .font(.system(size: CGFloat(fontSize), weight: .bold, design: .serif))
                            .foregroundColor(.white)
                            .padding(.bottom, 300)
                        
                        Image("Munji")
                        
                        Spacer()
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [colors[currentColorIndex], colors[(currentColorIndex + 1) % colors.count]]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .opacity(0.7)
                    )
                    .animation(.easeInOut(duration: 1.0),value: currentColorIndex)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
                            currentColorIndex = (currentColorIndex + 1) % colors.count
                            fontSize = (fontSize == UIScreen.main.bounds.width / 11) ? UIScreen.main.bounds.width / 9 : UIScreen.main.bounds.width / 11
                        }
                    }
                    
                    Text("◉.◉ Touch to start")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.top, -100)
                    
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .onTapGesture {
                    self.tag = 1
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
