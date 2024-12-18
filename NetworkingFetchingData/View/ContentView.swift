//
//  ContentView.swift
//  NetworkingFetchingData
//
//  Created by Bhuiyan Wasif on 11/20/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: PlanetViewModel = PlanetViewModel(networkManager: NetworkManager())
    
    var body: some View {
        NavigationStack{
            VStack {
                List(viewModel.planetData){ planet in
                    NavigationLink {
                        DetailsUIView(planet: planet)
                    } label: {
                        TableCellUIView(planet: planet)
                            .frame(height: 100)
                    }

                    
                }
            }
//            }.onAppear {
//                Task{
//                    await viewModel.getDigimonData()
//                }
//            }
            .searchable(text: $viewModel.searchText)
            .task{
                await viewModel.getPlanetData()
            }
            .navigationTitle("Planets")
            
        }
    }
}

#Preview {
    ContentView()
}
