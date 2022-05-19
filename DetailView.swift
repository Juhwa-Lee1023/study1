//
//  DetailView.swift
//  study1
//
//  Created by 이주화 on 2022/05/06.
//

import SwiftUI

struct DetailView: View {
    @State var i: Int
    
    var body: some View {
        VStack{
            Text("\(todo[i].challenge)")
            Text("\(todo[i].name)")
            Text("\(todo[i].last)")
            Text("\(todo[i].date)")
        }
    }
}

