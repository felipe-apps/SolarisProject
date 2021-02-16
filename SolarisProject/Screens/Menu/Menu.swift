//
//  Home.swift
//  SolarisProject
//
//  Created by Felipe Dias on 30/11/20.
//

import SwiftUI

let screen = UIScreen.main.bounds

/// function that checks the screen size of the iPhone to make the App adaptable to more screen sizes
var squaredScreen: Bool = false
func sizeCheck() {
    if screen.height < 800 {
        squaredScreen = true
    }
}

struct Menu: View {
    @State var sideBar = false
    @State var showMenu = false
    @State private var sideBarState = CGSize.zero
    @State private var dragOffset = CGSize.zero
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.02352941176, blue: 0.3176470588, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.662745098, blue: 1, alpha: 1))]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                WelcomeView(sideBar: $sideBar, showMenu: $showMenu)
                
                MenuView(showMenu: $showMenu)
                
                SideBarView(sideBar: $sideBar, sideBarState: $sideBarState)
                
            }
            .gesture(
                !sideBar ?
                DragGesture().onChanged { value in
                    dragOffset = value.translation
                    if dragOffset.width < .zero {
                        dragOffset.width = .zero
                    }
                }
                .onEnded{ value in
                    if value.startLocation.x < 20 && dragOffset.width > 100 {
                        dragOffset.width = .zero
                        sideBar = true
                    } else {
                        dragOffset = .zero
                    }
        }
                : nil
            )
            .onAppear(perform: {
                sizeCheck()
            })
            .preferredColorScheme(.dark)
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

struct WelcomeView: View {
    @Binding var sideBar: Bool
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
            HStack {
                
                Spacer()
            }
            Spacer()
            VStack(spacing: 0) {
                Text("Hello!")
                    .font(.custom("Fugaz One", size: screen.width * 0.2))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.4784313725, blue: 0, alpha: 1)))
                Text("WELCOME to")
                    .font(.custom("Fugaz One", size: screen.width * 0.12))
                Image("solarisLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width * 0.85, height: screen.width * 0.25)
                    .padding(.top, 15)
            }
            .offset(y: showMenu ? -screen.width * 0.4 : 0)
            .animation(.spring())
            
            
            Button(action: {showMenu.toggle()}) {
                HStack {
                    Text("Tap to Explore")
                        
                        
                    Image(systemName: "chevron.right")
                }
                .frame(width: screen.width, height: screen.height * 0.3)
                .font(.system(size: screen.width * 0.08, weight: .medium, design: .rounded))
                .foregroundColor(.black)
                
            }
            .opacity(showMenu ? 0 : 1)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView: View {
    @State var menuState = CGSize.zero
    @State var selection: Int? = nil
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Rectangle()
                    .frame(width: screen.width * 0.12, height: screen.width * 0.02)
                    .foregroundColor(Color.black.opacity(0.3))
                    .cornerRadius(25)
                
                HStack {
                    Text("Menu")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                    
                    Spacer()
                    
                    Button(action: {showMenu = false}) {
                        Image(systemName: "xmark")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white.opacity(0.5))
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                /// NavigationLinks to the sections of the Menu
                NavigationLink(destination: SolarSystem(), tag: 0, selection: $selection) { EmptyView() }
                NavigationLink(destination: PlanetCompare(), tag: 1, selection: $selection) { EmptyView() }
                NavigationLink(destination: GravityGame(), tag: 2, selection: $selection) { EmptyView() }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: squaredScreen ? 30 : 20) {
                        ForEach(menuData) { item in
                            GeometryReader { geometry in
                                Button(action: {selection = item.index}) {
                                    MenuItem(section: item)
                                        .frame(width: screen.width * 0.45, height: screen.width * 0.45)
                                        .rotation3DEffect(Angle(degrees:
                                            Double(geometry.frame(in: .global).minX - 30) / -20
                                        ), axis: (x: 0, y: 10.0, z: 0))
                                }
                            }
                            .frame(width: squaredScreen ? 165 : 185)
                            
                        }
                    }
                    .padding(.horizontal, 28)
                    .padding(.top, 30)
                }
                
            }
            .padding(.vertical, 15)
            .frame(width: screen.width, height: screen.width * 0.9)
            .foregroundColor(.white)
            .background(BlurView(style: .systemThinMaterialDark))
            .cornerRadius(squaredScreen ? 0 : 30)
            .gesture(
                DragGesture().onChanged { value in
                    menuState = value.translation
                    if menuState.height < .zero {
                        menuState.height = .zero
                    }
                }
                .onEnded{ value in
                    if menuState.height > 60 {
                        menuState.height = .zero
                        showMenu = false
                    } else {
                        menuState = .zero
                    }
        })
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .offset(y: showMenu ? 0 : screen.width * 0.9)
            .offset(y: menuState.height)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SideBarView: View {
    @Binding var sideBar: Bool
    @Binding var sideBarState: CGSize
    
    var body: some View {
        HStack(spacing: 0) {
            SideBar()
                .frame(width: screen.width - 50, height: screen.height)
            
            ZStack {
                /// allows a tap gesture to close the Side Bar
                sideBar ?
                    Color.black.opacity(0.001)
                    .frame(height: screen.height)
                    .onTapGesture {
                        sideBar = false
                    }
                : nil
                
                /// button that activates the Side Bar
                VStack {
                    Button(action: {sideBar.toggle()}) {
                        Image(systemName: "info.circle")
                            .font(.system(size: 24, weight: .light, design: .rounded))
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(10)
                    }
                    .padding(.top, 60)
                    
                    Spacer()
                    
                }
            }
        }
        .gesture(
            sideBar ?
            DragGesture().onChanged { value in
                sideBarState = value.translation
                if sideBarState.width > .zero {
                    sideBarState.width = .zero
                }
            }
            .onEnded{ value in
                if sideBarState.width < 150 {
                    sideBarState.width = .zero
                    sideBar = false
                } else {
                    sideBarState = .zero
                }
            }
            : nil
        )
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        .offset(x: sideBar ? 0 : -screen.width + 50)
        .offset(x: sideBarState.width)
        
    }
}
