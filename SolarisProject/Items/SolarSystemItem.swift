//
//  PlanetItem.swift
//  SolarisProject
//
//  Created by Felipe Dias on 02/12/20.
//

import SwiftUI

struct SolarSystemItem: View {
    @State var solar: Solar = solarData[0]
    @Binding var detail: Bool
    @Binding var selectedItem: Int
    @State var viewState = CGSize.zero
    @State var selectedButton: Int = 0
    @State var expandBool = false
    @State var expand: Image? = nil
    @State var photoTitle: String? = nil
    @State var photoSource: String? = nil
    @State var activeView = CGSize.zero
    
    var body: some View {
        ZStack {
            InfoView(solar: $solar, selectedButton: $selectedButton, detail: $detail, selectedItem: $selectedItem, expandBool: $expandBool, expand: $expand, photoTitle: $photoTitle, photoSource: $photoSource)
            
            PlanetItem(solar: $solar, viewState: $viewState, selectedButton: $selectedButton, detail: $detail, selectedItem: $selectedItem)
            
            ExpandedPhoto(expandBool: $expandBool, expand: $expand, photoTitle: $photoTitle, photoSource: $photoSource)
            
            
        }
        .scaleEffect(1 - activeView.width / 1000)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .gesture(
            detail ?
            DragGesture().onChanged { value in
                activeView = value.translation
                if activeView.width < .zero {
                    activeView.width = .zero
                }
            }
            .onEnded{ value in
                if value.startLocation.x < 20 && activeView.width > 100 {
                    activeView.width = .zero
                    detail = false
                    selectedItem = -1
                } else {
                    activeView = .zero
                }
    }
            : nil
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct InfoView: View {
    @Binding var solar: Solar
    @Binding var selectedButton: Int
    @Binding var detail: Bool
    @Binding var selectedItem: Int
    @Binding var expandBool: Bool
    @Binding var expand: Image?
    @Binding var photoTitle: String?
    @Binding var photoSource: String?
    
    var body: some View {
        VStack {
            HStack {
                ForEach(buttonSection) { item in
                    Button(action: {
                        selectedButton = item.temp
                    }) {
                        Text(item.title)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(width: screen.width / 3.5, height: 40)
                    .background(Color.white.opacity(selectedButton != item.temp ? 0.1 : 0.5))
                    .cornerRadius(12)
                }
            }
            
            //Overview Section//
            if selectedButton == 0 {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Day")
                                .font(.system(size: 23, weight: .bold, design: .rounded))
                            Text(solar.day)
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 3) {
                            Text("Year")
                                .font(.system(size: 23, weight: .bold, design: .rounded))
                            Text(solar.year)
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                        }
                    }
                    .padding(.bottom, screen.width * 0.05)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Radius")
                            .font(.system(size: 23, weight: .bold, design: .rounded))
                        
                        Text(solar.radius)
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                    }
                    
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Type")
                                .font(.system(size: 23, weight: .bold, design: .rounded))
                            Text(solar.type)
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 3) {
                            Text("Moons")
                                .font(.system(size: 23, weight: .bold, design: .rounded))
                            Text(solar.moons)
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                        }
                    }
                    .padding(.bottom, screen.width * 0.05)
                    .padding(.top, screen.width * 0.05)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Average Temperature")
                            .font(.system(size: 23, weight: .bold, design: .rounded))
                        
                        Text(solar.temperature)
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                    }
                }
                .padding(.horizontal, 14)
                
            }
            
            //In Depth Section//
            if selectedButton == 1 {
                VStack {
                    Text(solar.indepth)
                        .font(.system(size: 23, weight: .medium, design: .rounded))
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Link(destination: URL(string: solar.link1)!, label: {
                            HStack {
                                Text("More info at NASA")
                                Image(systemName: "chevron.right")
                            }
                            .padding(.trailing, 20)
                            .font(.system(size: 19, weight: .semibold, design: .rounded))
                        })
                    }
                }
            }
            
            //Photos Section//
            if selectedButton == 2 {
                VStack(spacing: 20) {
                    squaredScreen ?
                        nil
                        : Spacer()
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            expandBool = true
                            expand = solar.photo1
                            photoTitle = solar.imgTitle1
                            photoSource = solar.source1
                        }) {
                            solar.photo1
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: screen.width * 0.4, height: screen.width * 0.3)
                                .cornerRadius(20)
                        }
                        .padding(5)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(20)
                        
                        Button(action: {
                            expandBool = true
                            expand = solar.photo2
                            photoTitle = solar.imgTitle2
                            photoSource = solar.source2
                        }) {
                            solar.photo2
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: screen.width * 0.4, height: screen.width * 0.3)
                                .cornerRadius(20)
                        }
                        .padding(5)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(20)
                    }
                    
                    HStack(spacing: 20) {
                        
                        Button(action: {
                            expandBool = true
                            expand = solar.photo3
                            photoTitle = solar.imgTitle3
                            photoSource = solar.source3
                        }) {
                            solar.photo3
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: screen.width * 0.4, height: screen.width * 0.3)
                                .cornerRadius(20)
                        }
                        .padding(5)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(20)
                        
                        Button(action: {
                            expandBool = true
                            expand = solar.photo4
                            photoTitle = solar.imgTitle4
                            photoSource = solar.source4
                        }
                        ) {
                            solar.photo4
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: screen.width * 0.4, height: screen.width * 0.3)
                                .cornerRadius(20)
                        }
                        .padding(5)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(20)
                    }
                    
                    squaredScreen ?
                        nil
                        : Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Link(destination: URL(string: solar.link2)!, label: {
                            HStack {
                                Text("More photos at NASA")
                                Image(systemName: "chevron.right")
                                
                            }
                            .padding(.trailing, 20)
                            .font(.system(size: 19, weight: .semibold, design: .rounded))
                        })
                    }
                }
            }
            Spacer()
        }
        .padding(30)
        .frame(width: selectedItem == solar.index ? screen.width : screen.width * 0.8, height: selectedItem == solar.index ? screen.height * 0.6 : 165)
        .background(Color.black)
        .offset(y: selectedItem == solar.index ? screen.height * 0.4 : 0)
        .opacity(selectedItem == solar.index && detail ? 1 : 0)
    }
}

struct PlanetItem: View {
    @Binding var solar: Solar
    @Binding var viewState: CGSize
    @Binding var selectedButton: Int
    @Binding var detail: Bool
    @Binding var selectedItem: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(solar.name)
                    .font(.custom("Fugaz One", size: selectedItem == solar.index ? 34 : 28)).bold()
                Text(solar.subname)
                    .font(.system(size: selectedItem == solar.index ? 23 : 20, weight: .medium))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                HStack {
                    if detail {
                        Button(action: {
                            detail = false
                            
                            if detail {
                                selectedItem = solar.index
                            } else {
                                selectedItem = -1
                            }
                        }) {
                            HStack {
                                Image(systemName: "arrow.left")
                                
                                Text("Back")
                            }
                            .font(.system(size: 21, weight: .semibold, design: .rounded))
                            .foregroundColor(Color.white.opacity(0.8))
                        }
                    }
                }
            }
            .padding(.top, 20)
            
            Spacer()
            
            VStack {
                Spacer()
                
                solar.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: selectedItem == solar.index ? 155 : 105, height: selectedItem == solar.index ? 155 : 105)
                    .shadow(color: Color.white.opacity(0.3),
                            radius: 20, x: 5, y: -5)
                    .shadow(color: Color.white.opacity(0.3),
                            radius: 20, x: -5, y: 5)
            }
        }
        .padding(.all, selectedItem == solar.index ? 20 : 15)
        .frame(width: selectedItem == solar.index ? screen.width : screen.width * 0.8, height: selectedItem == solar.index ? screen.height * 0.4 : 165)
        .background(solar.color)
        .clipShape(RoundedRectangle(cornerRadius: selectedItem == solar.index ? 0 : 25, style: .continuous))
        .shadow(color: solar.color.opacity(0.5), radius: 20, x: 0, y: 20)
        .offset(y: selectedItem == solar.index && detail ? -screen.height * 0.1 : 0)
        .animation(.easeInOut)
        .onTapGesture {
            withAnimation(.spring()) {
                if !detail {
                    detail = true
                }
                
                if detail {
                    selectedItem = solar.index
                } else {
                    selectedItem = -1
                }
            }
        }
    }
}



struct ExpandedPhoto: View {
    @Binding var expandBool: Bool
    @Binding var expand: Image?
    @Binding var photoTitle: String?
    @Binding var photoSource: String?
    
    var body: some View {
        expandBool ?
            VStack(alignment: .leading) {
                
                expand!
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width)
                
                Text(photoTitle!)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .padding(.horizontal)
                
                HStack(alignment: .top) {
                    Text("Source: ").bold()
                    
                    Text(photoSource!)
                }
                .padding()
                .font(.system(size: 23))
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: { expandBool = false }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 23, weight: .medium, design: .rounded))
                            .foregroundColor(Color.white.opacity(0.5))
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                        
                    }
                    Spacer()
                }
                Spacer()
                
            }
            .padding(.top, squaredScreen ? 20 : 50)
            .frame(width: screen.width, height: screen.height)
            .background(BlurView(style: .systemThinMaterial))
            .edgesIgnoringSafeArea(.all)
            
            : nil
    }
}
