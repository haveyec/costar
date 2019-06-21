//
//  ViewController.swift
//  costar_test
//
//  Created by Havic on 6/17/19.
//  Copyright © 2019 Marlon Henry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


	@IBOutlet weak var titleLBL: UILabel!
	@IBOutlet weak var nameField: UITextField!
	private var datePicker: UIDatePicker?
	@IBOutlet weak var submitBTN: UIButton!
	@IBOutlet weak var dateField: UITextField!

	private struct SignBuilder{
		var startDate:Date?
		var endDate:Date?
		var name = ""

		init(dob:Date) {
			let signArr = [
				(startD:"0321", endD:"0419",signName:Sign.aries),
				(startD:"0420", endD:"0520",signName:Sign.taurus),
				(startD:"0521", endD:"0620",signName:Sign.gemini),
				(startD:"0621", endD:"0722",signName:Sign.cancer),
				(startD:"0723", endD:"0822",signName:Sign.leo),
				(startD:"0823", endD:"0922",signName:Sign.virgo),
				(startD:"0923", endD:"1022",signName:Sign.libra),
				(startD:"0120", endD:"0218",signName:Sign.aquarius),
				(startD:"0219", endD:"0320",signName:Sign.pisces),
				(startD:"1023", endD:"1121",signName:Sign.scorpio),
				(startD:"1122", endD:"1221",signName:Sign.sagittarius),
				(startD:"1222", endD:"0119",signName:Sign.capricorn)
			]
			let dateFormater = DateFormatter()
			dateFormater.dateFormat = "MMdd"
			let dateStr = dateFormater.string(from: dob)


			signArr.forEach { (sign) in

				guard let min = Int(sign.startD), let max = Int(sign.endD), let dobVal = Int(dateStr) else {return}

				let capStartRange = 1222...1231
				let capEndRange = 101...119

				if (dobVal == min || dobVal > min) && (dobVal == max || dobVal < max){
					name = sign.signName.rawValue
				}else if capStartRange.contains(dobVal) || capEndRange.contains(dobVal){
					name = sign.signName.rawValue
				}

			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		titleLBL.text = "Sun Sign Check"
		datePicker = UIDatePicker()
		datePicker?.datePickerMode = .date
		dateField.inputView = datePicker
		datePicker?.addTarget(self, action: #selector(ViewController.dateChanged(datePicker:)), for: .valueChanged)
		let tap = UITapGestureRecognizer(target: self, action: #selector(tapGuesture))
		view.addGestureRecognizer(tap)

	}

	private func loadThat(birthday:Date,completition:@escaping (SignBuilder)->()){


		let scope = SignBuilder(dob: birthday)
		completition(scope)

	}


	@IBAction func submitBTNPressed(_ sender: UIButton) {

		guard nameField.text!.count > 0 else {
			fireAlert()
			return
		}

		loadThat(birthday: datePicker!.date) { (sign) in

			//Let's wrap this all up in a nice bundle & present modal:

			let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
			let horoscopeView = storyBoard.instantiateViewController(withIdentifier: "scope") as! HoroscopeVC

			horoscopeView.lblString = "Hello \(self.nameField.text!)\n Your sign is: \n \(sign.name)"

			self.present(horoscopeView, animated: true, completion: nil)
		}

	}

	func fireAlert(){
		let alert = UIAlertController(title: "Alert", message: "We would like to know who we have a horoscope for", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}

	@objc func dateChanged(datePicker:UIDatePicker){
		let dateFormater = DateFormatter()
		dateFormater.dateFormat = "MM/dd/yy"
		dateField.text = dateFormater.string(from: datePicker.date)
		view.endEditing(true)

	}

	@objc func tapGuesture(tapReconizer:UITapGestureRecognizer){
		view.endEditing(true)
	}
}

