//
//  SecondView.swift
//  Tracking
//
//  Created by YU WONGEUN on 2023/04/18.
//

import SwiftUI
import ARKit

struct SecondView: View {
    
    @State private var colors: [Color] = [.red, .yellow]
    @State private var currentColorIndex = 0
    @State var tag: Int? = nil
    
    var body: some View {
        GeometryReader { geo in
            
            
            TabView {
                Frame1View()
                    .frame(width: geo.size.width / 1.15, height: geo.size.height / 1.1)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                
                Frame2View()
                    .frame(width: geo.size.width / 1.15, height: geo.size.height / 1.1)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                
                Frame3View()
                    .frame(width: geo.size.width / 1.15, height: geo.size.height / 1.1)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                
                Frame4View()
                    .frame(width: geo.size.width / 1.15, height: geo.size.height / 1.1)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                
                Frame5View()
                    .frame(width: geo.size.width / 1.15, height: geo.size.height / 1.1)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .background(
            LinearGradient(
                gradient: Gradient(colors: [colors[currentColorIndex], colors[(currentColorIndex + 1) % colors.count]]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .opacity(0.7)
        )
        .navigationBarBackButtonHidden()
        
    }
}

struct Frame1View: View {
    var body: some View {
        VStack (alignment: .leading){
            
            Text("Why I made")
                .font(.system(size: UIScreen.main.bounds.width / 14, weight: .bold))
                .foregroundColor(.white)
                .padding(50)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Text("Watching Apple's \"The Greatest\" commercial video, I was inspired by the warm emotions and values of life held by the physically disabled. The video shows people with disabilities enjoying various cultural activities in their lives, as well as touching scenes of spending time together feeling respect and warmth.")
                .font(.system(size: UIScreen.main.bounds.width / 42, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("However, in fact, people with physical disabilities often have difficulty fully immersing themselves in cultural life in their lifestyles. It was a pity that even my close people could not enjoy art creation when they were physically uncomfortable. Through this, I realized how important it is to provide cultural activities that anyone can enjoy regardless of physical disability.")
                .font(.system(size: UIScreen.main.bounds.width / 42, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("So I found a way to solve this problem and created art content that disabled people can enjoy. It is called Eyeing Art.")
                .font(.system(size: UIScreen.main.bounds.width / 42, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("Eyeing Art is an app that helps people draw using eye movements and facial expressions. Through Eyeing Art, disabled people can enjoy drawing with only their eyes and facial expressions. I want to make it easier for people with physical disabilities to enjoy art creation activities.")
                .font(.system(size: UIScreen.main.bounds.width / 42, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("I hope loved ones and people with physical disabilities will have a good time drawing various pictures through Eyeing Art. And with my app, I hope to have a positive impact on their lives.")
                .font(.system(size: UIScreen.main.bounds.width / 42, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("But it's not just about making apps. Through this, I aim to create a warmer, more diverse and inclusive world. I will continue to work hard to create apps that can help someone and be a catalyst for a better world.")
                .font(.system(size: UIScreen.main.bounds.width / 42, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Spacer()
            
        }
    }
}

struct Frame2View: View {
    var body: some View {
        VStack (alignment: .leading){
            
            Text("Setting")
                .font(.system(size: UIScreen.main.bounds.width / 14, weight: .bold))
                .foregroundColor(.white)
                .padding(50)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Text("1. The recommended device to run this app is iPad and it works on real devices, not simulators.")
                .font(.system(size: UIScreen.main.bounds.width / 30, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom, 50)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("2. To use Eye Tracking, camera permissions must be made accessible.")
                .font(.system(size: UIScreen.main.bounds.width / 30, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom, 50)                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("3. Use vertical mode for more accurate eye tracking.")
                .font(.system(size: UIScreen.main.bounds.width / 30, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom, 100)                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("To use this app, we recommend 11-inch iPad Pro.")
                .font(.system(size: UIScreen.main.bounds.width / 30, weight: .bold))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom, 50)                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Spacer()
            
        }
    }
}

struct Frame3View: View {
    var body: some View {
        VStack (alignment: .leading){
            
            Text("How To Use")
                .font(.system(size: UIScreen.main.bounds.width / 14, weight: .bold))
                .foregroundColor(.white)
                .padding(50)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Text("Step 1.  Maintain a minimum distance of 30cm from the device.")
                .font(.system(size: UIScreen.main.bounds.width / 32, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom, 30)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("Step 2.  Focus the cursor by placing the camera equal to or slightly higher than the eye level.")
                .font(.system(size: UIScreen.main.bounds.width / 32, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom, 30)                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("Step 3.  Align the device to the distance and height and secure it without shaking.")
                .font(.system(size: UIScreen.main.bounds.width / 32, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom, 30)                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("Step 4.  Move your eyes rather than turn your head")
                .font(.system(size: UIScreen.main.bounds.width / 32, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom, 30)                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("Step 5.  If your eyes are focused, move your eyes and open your mouth to start drawing.")
                .font(.system(size: UIScreen.main.bounds.width / 32, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom, 30)                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("Step 6.  To erase the picture, frown and erase it.")
                .font(.system(size: UIScreen.main.bounds.width / 32, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom, 30)                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("Step 7.  To save a picture, stick out your tongue and capture and save the picture.")
                .font(.system(size: UIScreen.main.bounds.width / 32, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom, 30)                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text("Step 8.  If the screen freezes frequently or is slow, press the Back button or re-run the app")
                .font(.system(size: UIScreen.main.bounds.width / 32, weight: .medium))
                .foregroundColor(.white)
                .padding([.trailing,.leading],40)
                .padding(.bottom, 30)                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            
            Spacer()
            
        }
    }
}

struct Frame4View: View {
    var body: some View {
        NavigationLink(destination: ARTrackingView(view: ARSCNView())
            .navigationViewStyle(StackNavigationViewStyle()), label: {
                
                VStack(alignment: .center) {
                    
                    Text("👀 Eye Tracking")
                        .font(.system(size: UIScreen.main.bounds.width / 14, weight: .bold))
                        .foregroundColor(.white)
                        .padding(50)
                        .padding(.bottom, 150)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    
                    VStack(alignment: .center) {
                        Text("Test")
                            .font(.system(size: UIScreen.main.bounds.width / 30, weight: .bold))
                            .foregroundColor(.white)
                            .padding([.trailing,.leading],40)
                            .padding(.bottom, 40)
                        Text("Check the eye tracking")
                            .font(.system(size: UIScreen.main.bounds.width / 35, weight: .light))
                            .foregroundColor(.white)
                            .padding([.trailing,.leading],40)
                        
                    }
                    .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 5)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(10)
                    
                    Text("❗️ Move your eyes instead of your head to focus ❗️")
                        .font(.system(size: UIScreen.main.bounds.width / 35, weight: .light))
                        .foregroundColor(.white)
                        .padding([.top,.trailing,.leading],40)
                }
            })
        
    }
}

struct Frame5View: View {
    var body: some View {
        NavigationLink(destination: ARDrawingView(view: ARSCNView())
            .navigationViewStyle(StackNavigationViewStyle())
            .overlay(SaveClearView()), label: {
                
                VStack(alignment: .center) {
                    
                    Text("🔥 Let's Draw !")
                        .font(.system(size: UIScreen.main.bounds.width / 14, weight: .bold))
                        .foregroundColor(.white)
                        .padding(50)
                        .padding(.bottom, 150)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    
                    VStack(alignment: .center) {
                        Text("Draw")
                            .font(.system(size: UIScreen.main.bounds.width / 30, weight: .bold))
                            .foregroundColor(.white)
                            .padding([.trailing,.leading],40)
                            .padding(.bottom, 40)
                        
                        Text("Come on, draw a picture")
                            .font(.system(size: UIScreen.main.bounds.width / 35, weight: .light))
                            .foregroundColor(.white)
                            .padding([.trailing,.leading],40)
                        
                    }
                    .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 5)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(10)
                    
                    Text("❗️ Move your eyes instead of your head to focus ❗️")
                        .font(.system(size: UIScreen.main.bounds.width / 35, weight: .light))
                        .foregroundColor(.white)
                        .padding([.top,.trailing,.leading],40)

                }
            })
    }
}



struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
