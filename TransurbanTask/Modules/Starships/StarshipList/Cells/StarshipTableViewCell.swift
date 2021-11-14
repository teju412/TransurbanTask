
import UIKit

class StarshipTableViewCell: UITableViewCell {

    @IBOutlet weak var starshipName: UILabel!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(starshipCellVM: StarshipTableViewCellVM) {
        self.starshipName.text = starshipCellVM.starshipName
        self.modelName.text = starshipCellVM.modelName
        self.manufacturer.text = starshipCellVM.manufacturer
        self.price.text = starshipCellVM.price
    }
}

struct StarshipTableViewCellVM {
    let starshipName: String
    let modelName: String
    let manufacturer: String
    let price: String
}
