//
//  PickedDate.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/18.
//

import Foundation
import SwiftUI
import Combine

class PickedDate: ObservableObject {
    @Published var date: Date = Date()
}
