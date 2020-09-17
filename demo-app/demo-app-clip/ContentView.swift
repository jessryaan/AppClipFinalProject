//
//  ContentView.swift
//  demo-app-clip
//
//  Created by Jess Ryan on 7/28/20.
//

import MapKit
import SwiftUI
import Foundation

class CheckPoint: Identifiable {
    var id : String
    var name : String
    var description : String
    var time : Date?
    var coordinates = CLLocationCoordinate2D()
    var visited : Bool
    var revealed : Bool
    var nextId : String?
    
    init(id: String, name: String, description: String, time: Date?, coordinates: CLLocationCoordinate2D, visited: Bool, revealed: Bool, nextId: String?){
        self.id = id
        self.name = name
        self.description = description
        self.time = time
        self.coordinates = coordinates
        self.visited = visited
        self.revealed = revealed
        self.nextId = nextId
    }
    
}
struct CheckPointRow: View {
    var checkPoint: CheckPoint
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(checkPoint.name).foregroundColor(.white)
                Text(checkPoint.description).font(.subheadline).foregroundColor(.white)
            }
            Spacer()
        }
        .padding()
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

func createAnnotationPoint(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) -> MKPointAnnotation {
    let newLocation = MKPointAnnotation()
    newLocation.coordinate = coordinate
    newLocation.title = title
    newLocation.subtitle = subtitle
    return newLocation
}

struct DetailView: View {
    @State private var annotation = MKPointAnnotation()
    var checkPoint: CheckPoint
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        
        let annotationPoint = createAnnotationPoint(coordinate: checkPoint.coordinates, title: checkPoint.name, subtitle: checkPoint.description)
        
        MapView(annotation: annotationPoint)
            .edgesIgnoringSafeArea(.all)
        
        VStack {
            Text(checkPoint.name).font(.title)
            
            HStack {
                
                if checkPoint.time == nil{
                    Text("Not yet reached!")
                } else {
                    Text(checkPoint.time!, formatter: Self.taskDateFormat)
                }
            }
            
            Spacer()
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(points) { checkPoint in
                NavigationLink(destination: DetailView(checkPoint: checkPoint)) {
                    CheckPointRow(checkPoint: checkPoint)
                }
            } .listStyle(SidebarListStyle())
            .navigationBarTitle("CheckPoints")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
