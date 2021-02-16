//
//  SizeComparisonItem.swift
//  SolarisProject
//
//  Created by Felipe Dias on 28/12/20.
//

import SwiftUI

struct SizeComparisonItem: View {
    @State var larger = false
    @State var smaller = false
    @State var stackIndex = false
    @State var aux: Double = 0
    @State var sizeBool = true
    @State var nameSpacer = true
    @State var compare: [SizeCompare] = sizeCompare
    @Binding var pi: [PlanetInfo]
    @Binding var currentIndex1: Int
    @Binding var currentIndex2: Int
    
    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .frame(width: sizeBool ? compare[currentIndex1].size * 3 : compare[currentIndex1].size, height: sizeBool ? compare[currentIndex1].size * 3 : compare[currentIndex1].size)
                    .foregroundColor(compare[currentIndex1].color)
                
            }
            .zIndex(stackIndex ? 0 : 1)
            
            VStack {
                Circle()
                    .frame(width: sizeBool ? compare[currentIndex2].size * 3 : compare[currentIndex2].size, height: sizeBool ? compare[currentIndex2].size * 3 : compare[currentIndex2].size)
                    .foregroundColor(compare[currentIndex2].color)
                
            }
            .zIndex(stackIndex ? 1 : 0)
            
            
        }
        .onAppear(perform: {
            if currentIndex1 < 4 && currentIndex2 < 4{
                sizeBool = true
            } else {
                sizeBool = false
            }
            
            
            if compare[currentIndex1].size > compare[currentIndex2].size {
                aux = Double(compare[currentIndex1].size / compare[currentIndex2].size)
                larger = true
                stackIndex = true
            } else {
                aux = Double(compare[currentIndex2].size / compare[currentIndex1].size)
                smaller = true
                stackIndex = false
            }
            
            if aux < 2.0 {
                nameSpacer = true
            }
        })
        
        Text(larger ? pi[currentIndex1].name : pi[currentIndex2].name)
            .font(.system(size: 23, weight: .medium, design: .rounded))
            .foregroundColor(larger ? compare[currentIndex1].color : compare[currentIndex2].color)
        
        Text(smaller ? pi[currentIndex1].name : pi[currentIndex2].name)
            .font(.system(size: 23, weight: .medium, design: .rounded))
            .foregroundColor(smaller ? compare[currentIndex1].color : compare[currentIndex2].color)
        
        if larger {
            Text("\(pi[currentIndex1].name) is \(String(format: "%.2f", aux))x larger than \(pi[currentIndex2].name)")
                .font(.system(size: 23, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding(.vertical, 12)
        }
        if smaller {
            Text("\(pi[currentIndex2].name) is \(String(format: "%.2f", aux))x larger than \(pi[currentIndex1].name)")
                .font(.system(size: 23, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding(.vertical, 12)
        }
    }
}

