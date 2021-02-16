//
//  SolarSystem.swift
//  SolarisProject
//
//  Created by Felipe Dias on 01/12/20.
//

import SwiftUI

struct SolarSystem: View {
    @State public var detail = false
    @State public var selectedItem: Int = -1
    
    var body: some View {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 30) {
                        ForEach(solarData.indices, id: \.self) { index in
                            GeometryReader { geometry in
                                
                                SolarSystemItem(
                                    solar: solarData[index],
                                    detail: $detail,
                                    selectedItem: $selectedItem)
                                    .offset(y: selectedItem == index ? -geometry.frame(in: .global).minY : 0)
                                    .opacity(selectedItem != index && detail ? 0 : 1)
                                    .zIndex(selectedItem == index ? 1 : 0)
                                    
                            }
                            .frame(height: 165)
                            .frame(maxWidth: selectedItem == index ? .infinity : screen.width * 0.8)
                            
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                    .frame(width: screen.width)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                }
                
            }
            .navigationBarHidden(detail ? true : false)
            .navigationTitle(detail ? "" : "Exploration")
    }
}

struct SolarSystem_Previews: PreviewProvider {
    static var previews: some View {
        SolarSystem()
    }
}
