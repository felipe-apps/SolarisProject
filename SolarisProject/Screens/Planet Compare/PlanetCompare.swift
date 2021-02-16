//
//  PlanetCompare.swift
//  SolarisProject
//
//  Created by Felipe Dias on 09/12/20.
//

import SwiftUI

struct PlanetCompare: View {
    @State var currentPlanet1 = Image(uiImage: #imageLiteral(resourceName: "earth"))
    @State var currentPlanet2 = Image(uiImage: #imageLiteral(resourceName: "mars"))
    @State var planets: [Planets] = planetList
    @State var showUnits = false
    @State var results = false
    @State var selectedUnit = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    PlanetView(currentPlanet1: $currentPlanet1, currentPlanet2: $currentPlanet2)
                    
                    PlanetPicker(currentPlanet1: $currentPlanet1, currentPlanet2: $currentPlanet2, showUnits: $showUnits, results: $results, selectedUnit: $selectedUnit)
                    
                }
                .padding(.top, 30)
                
                /// view to tap to dismiss the units
                showUnits ?
                Color
                    .black
                    .opacity(0.001)
                    .onTapGesture {
                        showUnits = false
                    }
                    : nil
                
                UnitsView(selectedUnit: $selectedUnit, showUnits: $showUnits)
                
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Choose a Planet:")
                    .font(.system(size: 21, weight: .semibold))
            }
        }
        .navigationBarHidden(results ? true : false)
    }
}

struct PlanetCompare_Previews: PreviewProvider {
    static var previews: some View {
        PlanetCompare()
    }
}

struct PlanetView: View {
    @Binding var currentPlanet1: Image
    @Binding var currentPlanet2: Image
    
    var body: some View {
        HStack {
            currentPlanet1
                .resizable()
                .frame(width: screen.width * 0.25, height: screen.width * 0.25)
                .shadow(color: Color.white.opacity(0.3), radius: 15, x: 5, y: -5)
                .shadow(color: Color.white.opacity(0.3), radius: 15, x: -5, y: 5)
                .padding(.bottom, 15)
                .padding(.trailing, 20)
            
            Text("VS.")
                .font(.custom("Fugaz One", size: 30))
            
            currentPlanet2
                .resizable()
                .frame(width: screen.width * 0.25, height: screen.width * 0.25)
                .shadow(color: Color.white.opacity(0.3), radius: 15, x: 5, y: -5)
                .shadow(color: Color.white.opacity(0.3), radius: 15, x: -5, y: 5)
                .padding(.bottom, 15)
                .padding(.leading, 20)
        }
        .padding(.vertical, 10)
    }
}

struct PlanetPicker: View {
    @State var planets: [Planets] = planetList
    @State var currentIndex1 = 2
    @State var currentIndex2 = 3
    @Binding var currentPlanet1: Image
    @Binding var currentPlanet2: Image
    @Binding var showUnits: Bool
    @Binding var results: Bool
    @Binding var selectedUnit: Int
    
    var body: some View {
        HStack(alignment: .top) {
            NavigationLink(
                destination: PlanetNumbers(planet1: planets[currentIndex1], planet2: planets[currentIndex2], currentIndex1: $currentIndex1, currentIndex2: $currentIndex2, selectedUnit: $selectedUnit),
                isActive: $results,
                label: {
                    EmptyView()
                })
            VStack {
                ForEach(planetList) { item in
                    Button(action: {
                        currentIndex1 = item.index
                        currentPlanet1 = item.image
                    }) {
                        Text(item.name)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .foregroundColor(.white)
                            .background(Color.white.opacity(item.index != currentIndex1 ? 0.0 : 0.3))
                            .cornerRadius(15)
                    }
                }
                
                Button(action: { showUnits.toggle() }) {
                    Text("Units")
                        .padding(15)
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.1058823529, green: 0.3960784314, blue: 0.9411764706, alpha: 1)).opacity(0.8))
                        .cornerRadius(15)
                }
                .padding(.top, squaredScreen ? 10 : 50)
            }
            
            Spacer()
            
            VStack {
                ForEach(planetList) { item in
                    Button(action: {
                        currentIndex2 = item.index
                        currentPlanet2 = item.image
                    }) {
                        Text(item.name)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .foregroundColor(.white)
                            .background(Color.white.opacity(item.index != currentIndex2 ? 0.0 : 0.3))
                            .cornerRadius(15)
                    }
                }
                
                Button(action: { results.toggle() }) {
                    HStack {
                    Text("Results")
                    Image(systemName: "chevron.right")
                    }
                    .padding(15)
                    .foregroundColor(.white)
                    .background(Color(#colorLiteral(red: 1, green: 0.1607843137, blue: 0.4117647059, alpha: 1)).opacity(0.8))
                    .cornerRadius(15)
                }
                .padding(.top, squaredScreen ? 10 : 50)
            }
        }
        .padding(.horizontal, 30)
    }
}

struct UnitsView: View {
    @Binding var selectedUnit: Int
    @Binding var showUnits: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack {
                    Text("Units")
                        .font(.system(size: 23, weight: .medium))
                    Spacer()
                    Button(action: {showUnits = false}) {
                        Text("OK")
                            .font(.system(size: 21, weight: .bold, design: .rounded))
                            .padding()
                    }
                }
                .padding(.horizontal, 20)
                
                HStack {
                    ForEach(unitsButton) { item in
                        Button(action: {
                            selectedUnit = item.temp
                        }) {
                            Text(item.title)
                                .foregroundColor(.white)
                        }
                        .padding(15)
                        .background(
                            selectedUnit != item.temp ?
                                Color.white.opacity(0.1)
                                :
                                Color.blue
                        )
                        .cornerRadius(12)
                    }
                }
                
                Spacer()
                
            }
            .frame(width: screen.width, height: screen.width * 0.45)
            .background(BlurView(style: .regular))
            .offset(y: showUnits ? 0 : screen.width * 0.45)
            .animation(.easeInOut)
        }
    }
}
