//
//  StarshipsModel.swift
//  TransurbanTask
//
//  Created by TejaDanasvi on 14/11/21.
//

import Foundation
import PromiseKit

protocol IStarshipModel {
    var starshipList: [Starship] { get set }
    var starship: Starship? { get set }
    
    func selectStarshipAsFavorite()
    func deSelectStarshipFromFavorite()
    func filterStarships()
    func sortStarships()
    func loadStarships() -> Promise<Void>
}

class StarshipModel: IStarshipModel {
    
    var starshipList: [Starship] = []
    var starship: Starship?
    var apiService: IStarshipApiRepository
    
    init(apiService: IStarshipApiRepository = StarshipApiRepository()) {
        self.apiService = apiService
    }
    
    // MARK: - Favorites
    
    func selectStarshipAsFavorite() {
        self.starship?.favorite = true
    }
    
    func deSelectStarshipFromFavorite() {
        self.starship?.favorite = false
    }
    
    // MARK: - Sort and Filter
    
    func filterStarships() {
        
    }
    
    func sortStarships() {
        
    }
    
    // MARK: - Loaders
    
    func loadStarships() -> Promise<Void> {
        apiService.getStarships()
        .done { self.assignStarshipList(response: $0) }
    }
    
    func assignStarshipList(response: Starships) {
        self.starshipList = response.results
    }
}
