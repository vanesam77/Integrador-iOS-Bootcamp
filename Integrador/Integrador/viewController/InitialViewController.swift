//
//  InitialViewController.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 17/09/2021.
//

import UIKit
class InitialViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var numberOfParticipantsTextField: UITextField! {
        didSet {
            numberOfParticipantsTextField.delegate = self
        }
    }
    @IBOutlet weak var minValueTextField: UITextField! {
        didSet {
            minValueTextField.delegate = self
        }
    }
    @IBOutlet weak var maxValueTextField: UITextField! {
        didSet {
            maxValueTextField.delegate = self
        }
    }
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var termsAndConditionsButton: UIButton!
    @IBOutlet weak var aceptTermsSwitch: UISwitch!
    
    private var participant: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aceptTermsSwitch.isOn = false
        startButton.layer.cornerRadius = startButton.bounds.height/8
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    @IBAction func termsAndConditionsButtonTapped(_ sender: Any) {
        let vc = TermsAndConditionViewController(nibName:"TermsAndConditionViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
        
    @IBAction func startButtonTaped(_ sender: Any) {
        if let amountText = numberOfParticipantsTextField.text,
           let minValue = minValueTextField.text, let maxValue = maxValueTextField.text,
           let amountNum = Int(amountText), let minValueNum = Double(minValue),
           let maxValueNum = Double(maxValue), amountNum > 0 && minValueNum >= 0 && maxValueNum <= 1 && minValueNum <= maxValueNum && validateSwitchIsOn() {
            self.participant = amountNum
            
            let vc = TabBarController(nibName: "TabBarController", bundle: nil)
            vc.viewControllers = [
                createNavController(for: ActivitiesViewController(viewModel: ActivitiesViewModel(participant: participant, priceRange: (minValueNum, maxValueNum))), title: "Activities", image: UIImage(systemName: "list.dash")!),
                createNavController(for: ResultsViewController(viewModel: ResultsViewModel(type: .random, activity: nil, participant: participant, priceRange: (minValueNum, maxValueNum))), title: "Random", image: UIImage(systemName: "shuffle")!),
            ]
            
            startButton.backgroundColor = UIColor(named: "boredMediumColor")
            vc.modalPresentationStyle = .fullScreen

            self.present(vc, animated: true, completion: nil)
            
        } else {
            let message = "Please enter the number of participants and Accept the Terms and conditions to continue"
            let alert = UIAlertController(title: "Start", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            startButton.backgroundColor = .systemPink
        }
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        navController.navigationBar.backgroundColor = .systemTeal
        return navController
    }
    
    func validateSwitchIsOn() -> Bool{
        if aceptTermsSwitch.isOn {
            return true
        } else{
            let message = "Please accept the Terms and Conditions to continue"
            let alert = UIAlertController(title: "Start", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
    }
}
