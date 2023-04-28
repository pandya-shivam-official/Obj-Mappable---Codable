//
//  ViewControllerCell.swift
//  Obj Mappable
//
//  Created by Shivam Pandya on 20/04/23.
//

import UIKit

class ViewControllerCell: UITableViewCell {

    @IBOutlet weak var lblid: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblgender: UILabel!
    @IBOutlet weak var lblstatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(objData:EmployeeDataCodable){
        
        lblid.text = "\(objData.id as? Int ?? 0)"
        lblname.text = objData.name as? String ?? ""
        lblemail.text = objData.email as? String ?? ""
        lblgender.text = objData.gender as? String ?? ""
        lblstatus.text = objData.status as? String ?? ""
    }

}
