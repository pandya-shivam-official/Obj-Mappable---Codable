

import Foundation
import ObjectMapper

struct EmployeeData : Mappable {
	var id : Int?
	var name : String?
	var email : String?
	var gender : String?
	var status : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name <- map["name"]
		email <- map["email"]
		gender <- map["gender"]
		status <- map["status"]
	}

}
