
//  SignUpViewController.swift
//  EventGo
//
//  Created by Ankit Luthra on 11/6/19.
//  Copyright © 2019 ankitluthra. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    let countries = ["", "India", "Canada", "United States of America"]
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
    
        countryTextField.inputView = pickerView
    }
    
    // Sets number of columns in picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextField.text = countries[row];
    }
    
    func isPasswordValid(_ password: String) -> Bool{
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        
        return passwordTest.evaluate(with: password)
        
    }
    
    
    
    func validateFields() -> String? {
        
        let passwordValue = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let error_msg_fields_empty = "Please fill all fields!"
        let error_msg_pass_value = "Please make sure your password is at least 8 characters, contains a special character and a number!"
        let error_msg_pass_match = "Please make sure your password and confirm passwrod are same!"
        
        if (firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailIdTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ==  "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || phoneNumTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || countryTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || zipCodeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "") {
          
            return error_msg_fields_empty
        }
        
        else if isPasswordValid(passwordValue) == false {
            
            return error_msg_pass_value
        }
        
        else if passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) != confirmPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines){
            
            return error_msg_pass_match
        }
        else{
           
            return nil
        }
        
    }
   
    
    @IBAction func signUpButtonFunc(_ sender: Any) {
        
        let error = validateFields()
        
        if (error != nil) {
            errorLabel.text = error!
            errorLabel.alpha = 1
        }
            
        if(error==nil){
            errorLabel.alpha = 0;
            
            let loginVC = self.storyboard?.instantiateViewController(identifier: "loginView") as! LoginViewController
            
            self.navigationController?.pushViewController(loginVC, animated: true)
        
        }
    }
   
    
}


