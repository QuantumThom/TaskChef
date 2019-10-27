//
//  Task.swift
//  TaskChef
//
//  Created by Thomas Bahmandeji on 10/23/19.
//  Copyright © 2019 Thomas Bahmandeji. All rights reserved.
//

// Main Focus is getting Tasks Created right now (10/16/19)
import SwiftUI
import Combine

struct Task: Equatable, Hashable, Codable, Identifiable {
  let id: UUID
  var title: String
  var isDone: Bool

    init(title: String, isDone: Bool, sharedEmail: String) {
    self.id = UUID()
    self.title = title
    self.isDone = isDone
  }
}

//class TaskShare: ObservableObject {
//    var didChange = PassthroughSubject<Void, Never>()
//    @Published var taskHold: Task {didSet {self.didChange.send() } }
//
//    func createEntry() {
//        
//    }
//}
