//
//  Tab1Coordinator.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

import SwiftUI

enum Tab1Page: Hashable {
    case primary
//    case secondary1
//    case secondary2
//    case tertiary
}

class Tab1Coordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ page: Tab1Page) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    @MainActor @ViewBuilder
       func build(page: Tab1Page) -> some View {
           switch page {
           case .primary:
               Tab1PrimaryView(coordinator: self)
//           case .secondary1:
//               Tab1SecondaryView1(coordinator: self)
//           case .secondary2:
//               Tab1SecondaryView2()
//           case .tertiary:
//               Tab1TertiaryView(coordinator: self)
           }
       }
}

extension Tab1Coordinator: Tab1PrimaryViewProtocol {
    func goToSecondary1() {
     //   push(.secondary1)
    }
    func goToSecondary2() {
       // push(.secondary2)
    }
}
//
//extension Tab1Coordinator: Tab1SecondaryView1Protocol {
//    func goToTertiaryView() {
//        push(.tertiary)
//    }
//}
//
//extension Tab1Coordinator: Tab1TertiaryViewProtocol {
//    func backToRoot() {
//        self.popToRoot()
//    }
//}
