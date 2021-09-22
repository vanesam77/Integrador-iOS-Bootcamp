//
//  InitialViewController.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 17/09/2021.
//

import UIKit

class InitialViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var numberOfParticipantsTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var termsAndConditionsButton: UIButton!
    @IBOutlet weak var aceptTermsSwitch: UISwitch!
    @IBOutlet weak var minPrice: UITextField!
    @IBOutlet weak var maxPrice: UITextField!
    private var participant: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aceptTermsSwitch.isOn = false
        startButton.layer.cornerRadius = startButton.bounds.height/8
        startButton.isEnabled = true
        self.numberOfParticipantsTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func termsAndConditionsButtonTapped(_ sender: Any) {
        let vc = TermsAndConditionViewController(nibName:"TermsAndConditionViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func startButtonTaped(_ sender: Any) {
        if validateInputText() && validateSwitchIsOn(){
            let vc = TabBarController(nibName: "TabBarController", bundle: nil)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        startButton.isEnabled = true            
    }
    
    func validateInputText() -> Bool{
        if let amountText = numberOfParticipantsTextField.text, let amountNum = Int(amountText),
           let amountMinText = minPrice.text, let amountMinPrice = Double(amountMinText),
           let amountMaxText = maxPrice.text, let amountMaxPrice = Double(amountMaxText),
           numberOfParticipantsTextField.hasText && minPrice.hasText && maxPrice.hasText &&
            amountNum > 0 && amountMinPrice >= 0 , amountMaxPrice <= 1 && amountMinPrice < amountMaxPrice {
            self.participant = amountNum
            startButton.backgroundColor = UIColor(named: "boredMediumColor")
            return true
        } else {
            let message = "Please enter the number of participants and range of price between 0 and 1"
            let alert = UIAlertController(title: "Start", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            startButton.isEnabled = false
            startButton.backgroundColor = .systemPink
        }
        return false
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


