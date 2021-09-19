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
    }
    
    private func showQuestions(for activity: String){
        let suggestionVC = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        suggestionVC.title = activity.capitalized
        suggestionVC.theActivity = self.activity
        navigationController?.pushViewController(suggestionVC, animated: true)
    }

}

extension ActivitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = activities[indexPath.row].capitalized
        return cell
    }
}

extension ActivitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.activity = activities[indexPath.row]
        showQuestions(for: self.activity)
    }
    
}


