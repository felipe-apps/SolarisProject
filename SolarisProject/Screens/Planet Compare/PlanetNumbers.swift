//
//  PlanetDetail.swift
//  SolarisProject
//
//  Created by Felipe Dias on 26/12/20.
//

import SwiftUI

struct PlanetNumbers: View {
    @State var pi: [PlanetInfo] = planetInfo
    @State var planet1: Planets
    @State var planet2: Planets
    @Binding var currentIndex1: Int
    @Binding var currentIndex2: Int
    @Binding var selectedUnit: Int
    
    //Function that checks which unit is selected//
    func unitCheck() {
        if selectedUnit == 0 {
            pi = planetInfo
        }
        if selectedUnit == 1 {
            pi = planetInfo2
        }
        if selectedUnit == 2 {
            pi = planetInfo3
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                SizeComparisonItem(pi: $pi, currentIndex1: $currentIndex1, currentIndex2: $currentIndex2)
                
                PlanetName(planet1: $planet1, planet2: $planet2)
                
                PlanetContent(pi: $pi, currentIndex1: $currentIndex1, currentIndex2: $currentIndex2)
            }
        }
        .navigationTitle("Comparison Results")
        .onAppear(perform: {
            unitCheck()
        })
    }
}

//struct PlanetNumbers_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetNumbers()
//    }
//}

struct PlanetName: View {
    @Binding var planet1: Planets
    @Binding var planet2: Planets
    
    var body: some View {
        HStack {
            Text(planet1.name)
                .font(.system(size: 20, weight: .bold, design: .rounded))
            
            Spacer()
            
            Text(planet2.name)
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
        .padding(.horizontal, 15)
        .frame(width: screen.width, height: screen.width * 0.1)
        .background(Color.blue)
    }
}

struct PlanetContent: View {
    @Binding var pi: [PlanetInfo]
    @Binding var currentIndex1: Int
    @Binding var currentIndex2: Int
    
    var body: some View {
        VStack {
            
            //Planet type Group//
            Group {
                Text("Planet type")
                    .frame(width: screen.width, height: screen.width * 0.1)
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .background(Color.white.opacity(0.3))
                
                HStack {
                    Text(pi[currentIndex1].type)
                    
                    Spacer()
                    
                    Text(pi[currentIndex2].type)
                }
                .padding(.horizontal, 15)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: screen.width, height: screen.width * 0.2)
            }
            
            //Distance from the Sun Group//
            Group {
                Text("Distance from the Sun")
                    .frame(width: screen.width, height: screen.width * 0.1)
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .background(Color.white.opacity(0.3))
                
                HStack {
                    Text(pi[currentIndex1].sunD)
                    
                    Spacer()
                    
                    Text(pi[currentIndex2].sunD)
                }
                .padding(.horizontal, 15)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: screen.width, height: screen.width * 0.2)
            }
        
            //Rotation Period Group//
            Group {
                Text("Rotation Period")
                    .frame(width: screen.width, height: screen.width * 0.1)
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .background(Color.white.opacity(0.3))
                
                HStack {
                    Text(pi[currentIndex1].rotat)
                    
                    Spacer()
                    
                    Text(pi[currentIndex2].rotat)
                }
                .padding(.horizontal, 15)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: screen.width, height: screen.width * 0.2)
            }
        
            //Translational Period Group//
            Group {
                Text("Translational Period")
                    .frame(width: screen.width, height: screen.width * 0.1)
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .background(Color.white.opacity(0.3))
                
                HStack {
                    Text(pi[currentIndex1].transl)
                    
                    Spacer()
                    
                    Text(pi[currentIndex2].transl)
                }
                .padding(.horizontal, 15)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: screen.width, height: screen.width * 0.2)
            }
        
            //Planet Radius Group//
            Group {
                Text("Planet Radius")
                    .frame(width: screen.width, height: screen.width * 0.1)
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .background(Color.white.opacity(0.3))
                
                HStack {
                    Text(pi[currentIndex1].radius)
                    
                    Spacer()
                    
                    Text(pi[currentIndex2].radius)
                }
                .padding(.horizontal, 15)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: screen.width, height: screen.width * 0.2)
            }
        
            //Circumference Group//
            Group {
                Text("Circumference")
                    .frame(width: screen.width, height: screen.width * 0.1)
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .background(Color.white.opacity(0.3))
                
                HStack {
                    Text(pi[currentIndex1].circum)
                    
                    Spacer()
                    
                    Text(pi[currentIndex2].circum)
                }
                .padding(.horizontal, 15)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: screen.width, height: screen.width * 0.2)
            }
            
            //Gravity Group//
            Group {
                Text("Gravity")
                    .frame(width: screen.width, height: screen.width * 0.1)
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .background(Color.white.opacity(0.3))
                
                HStack {
                    Text(pi[currentIndex1].gravity)
                    
                    Spacer()
                    
                    Text(pi[currentIndex2].gravity)
                }
                .padding(.horizontal, 15)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: screen.width, height: screen.width * 0.2)
            }
            
            //Escape Velocity Group//
            Group {
                Text("Escape Velocity")
                    .frame(width: screen.width, height: screen.width * 0.1)
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .background(Color.white.opacity(0.3))
                
                HStack {
                    Text(pi[currentIndex1].escapeV)
                    
                    Spacer()
                    
                    Text(pi[currentIndex2].escapeV)
                }
                .padding(.horizontal, 15)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: screen.width, height: screen.width * 0.2)
            }
            
            //Temperature Group//
            Group {
                Text("Temperature")
                    .frame(width: screen.width, height: screen.width * 0.1)
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .background(Color.white.opacity(0.3))
                
                HStack {
                    Text(pi[currentIndex1].temperature)
                    
                    Spacer()
                    
                    Text(pi[currentIndex2].temperature)
                }
                .padding(.horizontal, 15)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: screen.width, height: screen.width * 0.2)
            }
            
            //Number of moons Group//
            Group {
                Text("Number of moons")
                    .frame(width: screen.width, height: screen.width * 0.1)
                    .font(.system(size: 23, weight: .bold, design: .rounded))
                    .background(Color.white.opacity(0.3))
                
                HStack {
                    Text(pi[currentIndex1].moons)
                    
                    Spacer()
                    
                    Text(pi[currentIndex2].moons)
                }
                .padding(.horizontal, 15)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: screen.width, height: screen.width * 0.2)
            }
        }
    }
}

