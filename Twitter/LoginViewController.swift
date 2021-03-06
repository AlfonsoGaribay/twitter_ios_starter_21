//
//  LoginViewController.swift
//  Twitter
//
//  Created by Alfonso Garibay on 3/5/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        print("Button has been pressed")
        
        TwitterAPICaller.client?.login(url: <#T##String#>, success: <#T##() -> ()#>, failure: <#T##(Error) -> ()#>)
    }
    


















    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
