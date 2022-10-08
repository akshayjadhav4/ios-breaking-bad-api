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
    //init state
    @State private var characters = [Character]()
    
    // Create URL and fetch data
    func fetchData() async {
        // create a URL
        guard let url = URL(string: "https://www.breakingbadapi.com/api/characters") else {
            print("URL does not exist.")
            return
        }
        do {
            // fetch data
           let (data, _) = try await URLSession.shared.data(from: url)
            //decode data
            if let decodedResponse = try? JSONDecoder().decode([Character].self, from: data) {
                characters = decodedResponse
            }
        } catch {
            print("Something went wrong...")
        }
    }
    var body: some View {
        NavigationView {
            List(characters, id: \.char_id) { character in
                VStack(alignment: .leading) {
                    Text("Name: \(character.name)")
                    Text("Nickname: \(character.nickname)")
                }
            }
            .onAppear{
                Task {
                    await fetchData()
                }
            }
        }.navigationTitle("Breaking Bad")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
