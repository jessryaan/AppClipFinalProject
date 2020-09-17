//
//  demo_app_clipApp.swift
//  demo-app-clip
//
//  Created by Jess Ryan on 7/28/20.
//

import SwiftUI

@main
struct demo_app_clipApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onContinueUserActivity(NSUserActivityTypeBrowsingWeb){ userActivity in
                    guard let incomingURL = userActivity.webpageURL,
                          let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true),
                          let queryItems = components.queryItems
                    else {
                        return
                    }
                    
                    if let place = queryItems.first(where: { $0.name == "point" })?.value {
                        var next: String = ""
                        points.forEach{ point in
                            if point.id == place{
                                point.time = Date()
                                point.visited = true
                                point.revealed = true
                                next = point.nextId!
                            }
                        }
                        points.forEach{ point in
                            if point.id == next{
                                point.revealed = true
                                print(point.name)
                                print(point.revealed)
                            }
                        }
                    }
                }
        }
    }
}
