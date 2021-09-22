//
//  ActivitiesViewController.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 18/09/2021.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    var activity: String = ""
    var activitiesViewModel: ActivitiesViewModel
    
    init(viewModel: ActivitiesViewModel) {
        self.activitiesViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var activitiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activitiesTableView.dataSource = self
        self.activitiesTableView.delegate = self
        self.activitiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func showQuestions(for activity: String){
        let suggestionVC = ResultsViewController(viewModel: ResultsViewModel(type: .suggestion, activity: activity, participant: activitiesViewModel.participant, priceRange: activitiesViewModel.priceRange))
        suggestionVC.title = activity.capitalized
        navigationController?.pushViewController(suggestionVC, animated: true)
    }
}

extension ActivitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activitiesViewModel.activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = activitiesViewModel.activities[indexPath.row].capitalized
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = UIColor(named: "boredLightColor")
        cell.textLabel?.textColor = UIColor(named: "boredAccentColor")
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        cell.selectionStyle = .default
        return cell
    }
}

extension ActivitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.activity = activitiesViewModel.activities[indexPath.row]
        showQuestions(for: self.activity)
        activitiesTableView.deselectRow(at: indexPath, animated: true)
    }
}



