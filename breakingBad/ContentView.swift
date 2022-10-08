//
//  ContentView.swift
//  breakingBad
//
//  Created by Akshay Anil Jadhav on 08/10/22.
//

import SwiftUI

struct Character: Codable {
    var char_id: Int
    var name: String
    var birthday: String
    var occupation: [String]
    var status: String
    var appearance: [Int]
    var nickname: String
    var portrayed: String
    var img: String
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
