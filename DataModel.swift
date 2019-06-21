//
//  DataModel.swift
//  costar_test
//
//  Created by Havic on 6/17/19.
//  Copyright © 2019 Marlon Henry. All rights reserved.
//

import Foundation

enum Sign:String {
	case aries = "Aries"
	case taurus = "Taurus"
	case gemini = "Gemini"
	case cancer = "Cancer"
	case leo = "Leo"
	case virgo = "Virgo"
	case libra = "Libra"
	case scorpio = "Scorpio"
	case sagittarius = "Sagittarius"
	case capricorn = "Capricorn"
	case pisces = "Pisces"
	case aquarius = "Aquarius"
}

struct Root:Codable {
	var sign:SignStruct
}
struct SignStruct:Codable {
	var horoscope: String
	var sunsign:String
}



