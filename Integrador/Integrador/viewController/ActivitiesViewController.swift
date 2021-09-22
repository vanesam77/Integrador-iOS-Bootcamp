//
//  ActivitiesViewController.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 18/09/2021.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    let activities:[String] = ["education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"]
    var activity:String = ""
    
    @IBOutlet weak var activitiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activitiesTableView.dataSource = self
        self.activitiesTableView.delegate = self
        self.activitiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.activitiesTableView.separatorColor = UIColor(named: "boredAccentColor")
        navigationController?.navigationBar.backgroundColor = UIColor(named: "boredMediumColor")
        navigationController?.navigationBar.tintColor = UIColor(named: "boredAccentColor")
    }
    
    private func showQuestions(for activity: String){
        let suggestionVC = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        suggestionVC.title = activity.capitalized
        suggestionVC.theActivity = self.activity
        navigationController?.pushViewController(suggestionVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.activitiesTableView.reloadData()
    }
}

extension ActivitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = activities[indexPath.row].capitalized
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = UIColor(named: "boredLightColor")
        cell.textLabel?.textColor = UIColor(named: "boredAccentColor")
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        return cell
    }
}

extension ActivitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.activity = activities[indexPath.row]
        showQuestions(for: self.activity)
    }
}


