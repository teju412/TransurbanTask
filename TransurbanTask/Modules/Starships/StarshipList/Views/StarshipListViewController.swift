//
//  StarshipListViewController.swift
//  TransurbanTask
//
//  Created by TejaDanasvi on 14/11/21.
//

import UIKit

class StarshipListViewController: UIViewController {
    
    @IBOutlet weak var starshipTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: "StarshipTableViewCell", bundle: nil)
            starshipTableView.register(nib, forCellReuseIdentifier: "StarshipTableViewCell")
            starshipTableView.showsVerticalScrollIndicator = false
            starshipTableView.delegate = self
            starshipTableView.dataSource = self
            starshipTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        }
    }
    
    var viewModel: IStarshipListViewModel
    
    init(viewModel: IStarshipListViewModel = StarshipListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "StarshipListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.loadData()
    }
    
    func setup() {
        self.title = "Starships"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func loadData() {
        self.viewModel.loadData()
            .done { self.starshipTableView.reloadData() }
            .catch { print($0.localizedDescription) }
    }
}

extension StarshipListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.starshipList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: StarshipTableViewCell = starshipTableView.dequeueReusableCell(withIdentifier: "StarshipTableViewCell", for: indexPath) as? StarshipTableViewCell else { return UITableViewCell() }
        cell.configure(starshipCellVM: self.viewModel.starshipList[indexPath.row])
        return cell
    }
}

extension StarshipListViewController: UITableViewDelegate {
    
}
