//
//  data.swift
//  study1
//
//  Created by 이주화 on 2022/05/06.
//
import Foundation
import FirebaseFirestoreSwift

struct Todo: Identifiable, Codable {
  @DocumentID var id: String?
  var name: String
  var today: String
  var success: Bool = true
  var userId: String?
}
