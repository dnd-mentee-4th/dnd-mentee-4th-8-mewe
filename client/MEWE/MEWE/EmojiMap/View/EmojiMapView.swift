//
//  EmojiMapView.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/22.
//

import SwiftUI
import PartialSheet
import CoreLocation
import MapKit

struct EmojiMapView: View {
    
    // ENVS
    @EnvironmentObject var partialSheetManager : PartialSheetManager
    
    // map
    @StateObject var mapData = MapViewModel()
    @State var locationManager = CLLocationManager()
    @State private var currentLocation = CLLocationCoordinate2D()
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                // MARK: - Map View
                MapView(centerCoordinate: $centerCoordinate,
                        currentLocation: $currentLocation,
                        annotations: [MKPointAnnotation.example]) {
                    // MARK: - HERE
                    print("Hello")
                    showBottomMenu()
                }
                    .environmentObject(mapData)
                    .ignoresSafeArea(.all, edges: .all)
                
                VStack { // views above map view
                    
                    VStack { // nav + search bar
                        
                        // MARK: - Navigation Bar
                        navigationBar()
                            .edgesIgnoringSafeArea(.all)
                            .frame(height: 90)
                        
                        // MARK: - Search Bar
                        SearchBar(with: mapData)
                            .padding(.top, 10)
                        
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                    Spacer()
                    
                    // MARK: - Map buttons
                    mapButtons(with: mapData)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                    
                    // MARK: - Card View
                    if mapData.isCardShown {
                        EmojiCardView(card: Card.example)
                            .frame(maxWidth: geometry.size.width - 20, maxHeight: 100, alignment: .center)
                            .padding(.bottom,70)
                        
                    }
                }
                .edgesIgnoringSafeArea(.all)
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .addPartialSheet(style: getPartialSheetStyle()) // Calendar Sheet
            
            .onAppear(perform: {
                // setting delegate
                locationManager.delegate = mapData
                locationManager.requestWhenInUseAuthorization()
            })
            // MARK: - Permission Denied Alert
            .alert(isPresented: $mapData.permissionDenied, content: {
                locationPermissionAlert()
            })
        }
    }
    
    
    // MARK: - HERE
    private func showBottomMenu() {
        DispatchQueue.main.async {
            withAnimation {
                mapData.isCardShown.toggle()
            }
        }
    }
}

extension EmojiMapView {
    
    /// navigation bar
    @ViewBuilder
    private func navigationBar() -> some View {
        RoundedBottomNavigationView(
            destination: TodayView(),
            isRoot: false,
            isLast: true
        ) {
            HStack {
                Text(dateForTodayView(date: Date()))
                    .setupFont(size: 15, weight: .regular)
                Image(systemName:SystemImageName.chevronDown)
                    .resizable()
                    .frame(width: 15.0, height: 10.0)
            }
            .onTapGesture {
                showPartialSheet()
            }
        }
    }
    
    /// move to current position button and change map type button
    @ViewBuilder
    private func mapButtons(with mapData: MapViewModel) -> some View {
        VStack { // map buttons
            Button(action: {
                mapData.focusLocation()
            }, label: {
                Image.locationFill
                    .modifier(ImageButtonModifier())
            })
            
            Button(action: {
                mapData.updateMapType()
            }, label: {
                Image(systemName: mapData.mapType == .standard ? "network" : "map")
                    .modifier(ImageButtonModifier())
            })
            
        }
    }
    
    private func locationPermissionAlert() -> Alert {
        Alert(title: Text("Permission Denied"),
              message: Text("Please Enable Permission In App Settings"),
              dismissButton: .default(Text("Goto Settings"), action: {
                
                // redirecting user to settings
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
              }))
    }
    
    /// Open Partial Sheet
    fileprivate struct ImageButtonModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.title2)
                .padding(10)
                .foregroundColor(Color.white)
                .background(Color.softBlueDarker)
                .clipShape(Circle())
        }
    }
    
    /// Open Partial Sheet
    private func showPartialSheet() {
        partialSheetManager.showPartialSheet {
            CalendarSheetView()
                .frame(height: 450)
                .environmentObject(partialSheetManager)
                .padding(.horizontal)
        }
    }
    
    /// PartialSheet Style
    private func getPartialSheetStyle() -> PartialSheetStyle {
        return PartialSheetStyle(
            background: .solid(.white),
            handlerBarColor: .clear,
            enableCover: true,
            coverColor: Color.black.opacity(0.2),
            cornerRadius: 50,
            minTopDistance: 200
        )
    }
}
