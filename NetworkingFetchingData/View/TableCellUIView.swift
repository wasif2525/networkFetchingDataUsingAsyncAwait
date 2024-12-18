//
//  TableCellUIView.swift
//  NetworkingFetchingData
//
//  Created by Bhuiyan Wasif on 11/21/24.
//

import SwiftUI

struct TableCellUIView: View {
    var planet: Planet
    
    var body: some View {
        HStack(spacing: 16) {
            Text(planet.name)
                .font(.title)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
            
            Text(planet.climate)
                .font(.title2)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
        }
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.purple.opacity(0.1))
        )
        
        
    }
}

#Preview {
    TableCellUIView(planet: Planet(
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
//    TableCellUIView(digimon: Digimon(name: "Numemon", img: "https://digimon.shadowsmith.com/img/numemon.jpg", level: "Champion"))
}
