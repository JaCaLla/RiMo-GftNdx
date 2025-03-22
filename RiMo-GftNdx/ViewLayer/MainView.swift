//
//  MainView.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var tab1Coordinator = Tab1Coordinator()
  //  @StateObject private var tab2Coordinator = Tab2Coordinator()

    var body: some View {
        TabView {
            NavigationStack(path: $tab1Coordinator.path) {
                tab1Coordinator.build(page: .primary)
                    .navigationDestination(for: Tab1Page.self) { page in
                        tab1Coordinator.build(page: page)
                    }
            }
            .tabItem {
                Label("Tab 1", systemImage: "1.circle")
            }

//            NavigationStack(path: $tab2Coordinator.path) {
//                tab2Coordinator.build(page: .primary)
//                    .navigationDestination(for: Tab2Page.self) { page in
//                        tab2Coordinator.build(page: page)
//                    }
//            }
//            .tabItem {
//                Label("Tab 2", systemImage: "2.circle")
//            }
        }
    }
}
