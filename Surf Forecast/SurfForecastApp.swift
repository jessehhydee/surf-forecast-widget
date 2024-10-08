//
//  SurfForecastWidgetApp.swift
//  surf-forecast-widget
//
//  Created by Jesse Hyde on 26/08/2024.
//

import SwiftUI

struct VisualEffectView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        view.state = .active
        view.material = .light
        return view
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) { }
}

@main
struct SurfForecastWidgetApp: App {
    @StateObject var spotsObserv = SurfSpotsObserv()
 
    var body: some Scene {
        WindowGroup {
            ContentView(spotsObserv: spotsObserv)
            .background(VisualEffectView().ignoresSafeArea())
            .fixedSize()
        }
        .windowResizability(.contentSize)
        
        Settings {
            SettingsView(spotUrlsObserv: SurfSpotUrlsObserv(surfSpotsObserv: spotsObserv))
        }
    }
}
