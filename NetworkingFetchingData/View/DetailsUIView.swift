//
//  DetailsUIView.swift
//  NetworkingFetchingData
//
//  Created by Bhuiyan Wasif on 11/21/24.
//

import SwiftUI

struct DetailsUIView: View {
    var planet: Planet
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(planet.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    
                    Divider()
                    
                    // Orbital and Rotation Period
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Rotation Period")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Text(planet.rotationPeriod)
                                .font(.title3)
                                .foregroundColor(.primary)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Orbital Period")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Text(planet.orbitalPeriod)
                                .font(.title3)
                                .foregroundColor(.primary)
                        }
                    }
                    
                    Divider()
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Diameter")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("\(planet.diameter) km")
                            .font(.title3)
                            .foregroundColor(.primary)
                        
                        Text("Gravity")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text(planet.gravity)
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                    
                    Divider()
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Terrain")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text(planet.terrain)
                            .font(.title3)
                            .foregroundColor(.primary)
                        
                        Text("Surface Water")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("\(planet.surfaceWater)%")
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                    
                    Divider()
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Population")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text(planet.population)
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.1))
                )
                .padding()
            }
            .navigationTitle("Planet Details")
            .navigationBarTitleDisplayMode(.inline)
        }
}

#Preview {
    DetailsUIView(planet: Planet(
        name: "Tatooine",
        rotationPeriod: "23",
        orbitalPeriod: "304",
        diameter: "10465",
        climate: "arid",
        gravity: "1 standard",
        terrain: "desert",
        surfaceWater: "1",
        population: "200000",
        residents: [
            "https://swapi.dev/api/people/1/",
            "https://swapi.dev/api/people/2/",
            "https://swapi.dev/api/people/4/",
            "https://swapi.dev/api/people/6/",
            "https://swapi.dev/api/people/7/",
            "https://swapi.dev/api/people/8/",
            "https://swapi.dev/api/people/9/",
            "https://swapi.dev/api/people/11/",
            "https://swapi.dev/api/people/43/",
            "https://swapi.dev/api/people/62/"
        ],
        films: [
            "https://swapi.dev/api/films/1/",
            "https://swapi.dev/api/films/3/",
            "https://swapi.dev/api/films/4/",
            "https://swapi.dev/api/films/5/",
            "https://swapi.dev/api/films/6/"
        ],
        created: "2014-12-09T13:50:49.641000Z",
        edited: "2014-12-20T20:58:18.411000Z",
        url: "https://swapi.dev/api/planets/1/"
    ))
}
