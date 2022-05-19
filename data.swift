//
//  data.swift
//  study1
//
//  Created by 이주화 on 2022/05/06.
//

import SwiftUI
import Foundation

struct ToDo: Decodable, Identifiable {
    var id: Int
    var challenge: String
    var name: String
    var last: String
    var date: String
}

var todo: [ToDo] = load("data.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("error")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse")
    }

}
