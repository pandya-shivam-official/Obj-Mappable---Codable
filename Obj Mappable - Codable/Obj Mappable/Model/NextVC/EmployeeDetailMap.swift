

import Foundation
import ObjectMapper

struct EmployeeDetailMap : Mappable {
	var albumId : Int?
	var id : Int?
	var title : String?
	var url : String?
	var thumbnailUrl : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		albumId <- map["albumId"]
		id <- map["id"]
		title <- map["title"]
		url <- map["url"]
		thumbnailUrl <- map["thumbnailUrl"]
	}

}
