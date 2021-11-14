//
//  StarshipListViewModel.swift
//  TransurbanTask
//
//  Created by TejaDanasvi on 14/11/21.
//

import Foundation
import Foundation
import PromiseKit

protocol IStarshipListViewModel {
    var starshipList: [StarshipTableViewCellVM] { get set }
    var starshipModel: IStarshipModel { get set }
    
    func loadData() -> Promise<Void>
}

class StarshipListViewModel: IStarshipListViewModel {
    
    var starshipList: [StarshipTableViewCellVM] = []
    var starshipModel: IStarshipModel
    
    init(starshipModel: IStarshipModel = StarshipModel()) {
        self.starshipModel = starshipModel
    }
    
    func loadData() -> Promise<Void> {
        self.starshipModel.loadStarships()
            .done{ self.loadStarshipsList() }
    }
    
    private func loadStarshipsList() {
        self.starshipList = self.starshipModel.starshipList.map { starship in
            return StarshipTableViewCellVM(starshipName: starship.name ?? "",
                                           modelName: starship.model ?? "",
                                           manufacturer: starship.manufacturer ?? "",
                                           price: starship.costInCredits ?? "")
        }
    }
}
