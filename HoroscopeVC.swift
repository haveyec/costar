//
//  HoroscopeVC.swift
//  costar_test
//
//  Created by Havic on 6/17/19.
//  Copyright © 2019 Marlon Henry. All rights reserved.
//

import UIKit

class HoroscopeVC: UIViewController {
	@IBOutlet weak var horoscopeLBL: UILabel!
	var lblString = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		horoscopeLBL.text = lblString
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

	@IBAction func closeView(_ sender: UIButton) {

		self.dismiss(animated: true, completion: nil)
	}


}
