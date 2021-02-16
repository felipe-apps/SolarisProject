//
//  GravityGame.swift
//  SolarisProject
//
//  Created by Felipe Dias on 10/01/21.
//

import SwiftUI

struct GravityGame: View {
    @State var planet: [GravityPlanet] = gravityPlanet
    @State var selectedPlanet = 3
    @State var jump = false
    @State var moreInfo = false
    
    var body: some View {
        ZStack {
            Color.black
            
            VStack {
                /// picker to choose the planet / star / moon
                PlanetChoose(planet: $planet, selectedPlanet: $selectedPlanet, moreInfo: $moreInfo)
                
                Spacer()
                
                /// section to test the height of the jumps
                JumpSection(planet: $planet, selectedPlanet: $selectedPlanet, jump: $jump)
                
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Choose:")
                        .font(.system(size: 21, weight: .semibold))
                }
            }
            
            MoreInfo(moreInfo: $moreInfo)
                
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct GravityGame_Previews: PreviewProvider {
    static var previews: some View {
        GravityGame()
    }
}

struct PlanetChoose: View {
    @Binding var planet: [GravityPlanet]
    @Binding var selectedPlanet: Int
    @Binding var moreInfo: Bool
    
    var body: some View {
        VStack {
            Picker(selection: $selectedPlanet, label: Text("Choose a planet")) {
                ForEach(0 ..< gravityPlanet.count) { item in
                    Text(planet[item].name)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                }
            }
            .padding(.top, squaredScreen ? 50 : 80)
            
            Button(action: { moreInfo.toggle() }) {
                Text("More info")
                    .padding(10)
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
            }
            
        }
        .background(BlurView(style: .systemThinMaterialDark))
    }
}

struct JumpSection: View {
    @Binding var planet: [GravityPlanet]
    @Binding var selectedPlanet: Int
    @Binding var jump: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 60) {
                HeightMeter()
                    .offset(y: 9)
                
                Image(uiImage: #imageLiteral(resourceName: "astronaut2"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width * 0.15)
                    .offset(y: jump ? -CGFloat(planet[selectedPlanet].height) + 9 : 5)
                    .animation(jump ? Animation.easeInOut(duration: planet[selectedPlanet].time) : Animation.easeIn(duration: planet[selectedPlanet].time))
               
                VStack {
                    Spacer()
                    Button(action: {
                        jump = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + planet[selectedPlanet].time) {
                            jump = false
                        }
                        
                    }) {
                        Text("Tap\nto\nJump")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .frame(width: 80, height: 120)
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(15)
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
            
            /// planet
            Circle()
                .frame(width: screen.width * 1.5, height: screen.width * 1.5)
                .foregroundColor(planet[selectedPlanet].color)
                .shadow(color: planet[selectedPlanet].color.opacity(0.5),
                        radius: 50, x: 0, y: -25)
        }
        .offset(y: squaredScreen ? 200 : 250)
        .frame(width: screen.width, height: 400)
    }
}


struct MoreInfo: View {
    @Binding var moreInfo: Bool
    
    var body: some View {
        VStack {
        HStack {
            Spacer()
            
            Button(action: {moreInfo = false}) {
                Text("OK")
                    .font(.system(size: 21, weight: .bold, design: .rounded))
                    .padding(.top, 20)
            }
        }
            
            Spacer()
            Text("Choose a planet, star or moon and see how high the astronaut jumps on those places.\n\n(Taking into consideration the average jump height of a person on Earth being 0.2m and the weight being 70kg)")
                .font(.system(size: 21, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            Spacer()
        }
        .padding(.horizontal)
        .frame(width: screen.width * 0.75, height: screen.width * 0.9)
        .background(BlurView(style: .systemThinMaterialLight))
        .cornerRadius(20)
        .opacity(moreInfo ? 1 : 0)
        .animation(.easeInOut)
    }
}
