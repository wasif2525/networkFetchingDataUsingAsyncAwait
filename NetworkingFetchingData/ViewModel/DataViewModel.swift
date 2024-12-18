//
//  DataViewModel.swift
//  NetworkingFetchingData
//
//  Created by Bhuiyan Wasif on 11/21/24.
//
//if we don't want anyone to subclass it we use final keyword before class
//if we don't have do catch then we can only use '?' or '!' if we need to use 'try'

//The sink creates a subscription to the $searchText publisher.
/*The store(in: &cancellable) stores the subscription in the cancellable collection, ensuring the subscription remains active for the lifetime of that collection (e.g., the lifetime of the view model or another owning object).
 Without storing the subscription, it would immediately be deallocated after the sink block is executed. This means:

 The binding pipeline wouldn’t stay active.
 Any updates to searchText wouldn’t trigger the filterList function, so your search functionality would not work.
 */
 
import Foundation
import Combine

final class PlanetViewModel : ObservableObject{
    @Published var searchText: String = ""
    @Published var planetData: [Planet] = []
    @Published var planetDataCopy: [Planet] = []
    private var cancellable = Set<AnyCancellable>()
    
    let networkManager : NetworkingManagerProtocol
    
    init(networkManager: NetworkingManagerProtocol) {
        self.networkManager = networkManager
        setUpBindingSearch()
    }
    
    
    func getPlanetData() async {
        do{
            let data = try await self.networkManager.fetchData(url: ApiEndPoint2.BaseURL + ApiEndPoint2.PlanetApiPath, modelType: PlanetsResponse.self)
            DispatchQueue.main.async{ [weak self] in
                self?.planetData = data.results
                self?.planetDataCopy = data.results
            }
        }catch{
            print("Error: \(error)")
        }
        
    }
    
    func setUpBindingSearch(){
        $searchText
            .removeDuplicates()
            .sink { searchKeyword in
                self.filterList(searchText: searchKeyword)
            }.store(in: &cancellable)
    }
    
    func filterList(searchText: String){
        if searchText.isEmpty{
            self.planetData = planetDataCopy
        }else {
            self.planetData = self.planetDataCopy.filter{ $0.name.lowercased().contains(searchText.lowercased())}
        }
        
    }
}

final class DataViewModel : ObservableObject{
    
    @Published var digimonData: [Digimon] = []
    let networkManager : NetworkingManagerProtocol
    
    init(networkManager: NetworkingManagerProtocol) {
        self.networkManager = networkManager
    }
    
    
    func getDigimonData() async {
        //we will use dependency injection/inversion rather
//        let networkManager = NetworkManager()
//        let res = try? await networkManager.fetchData(url: ApiEndPoint.BaseURL + ApiEndPoint.PlanetApiPath, modelType: [Digimon].self)
        do{
            let data = try await self.networkManager.fetchData(url: ApiEndPoint.BaseURL + ApiEndPoint.PlanetApiPath, modelType: [Digimon].self)
            DispatchQueue.main.async{ [weak self] in
                self?.digimonData = data
            }
        }catch{
            print(error.localizedDescription)
        }
        
    }
}
