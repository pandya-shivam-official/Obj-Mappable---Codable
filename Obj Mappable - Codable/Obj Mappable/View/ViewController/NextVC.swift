//
//  NextVC.swift
//  Obj Mappable
//
//  Created by Shivam Pandya on 20/04/23.
//

import UIKit
import Alamofire
import SDWebImage
import SDWebImageMapKit

class NextVC: UIViewController {
    
    @IBOutlet weak var cl: UICollectionView!
    @IBOutlet weak var imgview: UIView!
    @IBOutlet weak var img: UIImageView!
    
    
    // MARK: -  model for ObjectMapper - Mappable
    var detailModelObjMap = [EmployeeDetailMap]()
    
    
    // MARK: - model for Codable
    var detailModelCod = [EmployeeDetailCodable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgview.isHidden = true
        cl.allowsSelection = true
        cl.isUserInteractionEnabled = true
        getDataCodALF()
       
    }
    
    // MARK: - btnActions
    
    @IBAction func btnCloseAction(_ sender: Any) {
        
        imgview.isHidden = true
    }
    
    // MARK: - func for Codable with ALAMOFIRE
    
        func getDataCodALF(){
    
            let url = "https://jsonplaceholder.typicode.com/photos"
//            let url = "https://jsonplaceholder.typicode.com/albums/1/photos"
    
            AF.request(url, method: .get)
                .responseJSON { response in
                    if response.result != nil  {
//                        print(response.result)
    
                        do {
                            let users = try JSONDecoder().decode([EmployeeDetailCodable].self, from: response.data!)
                            self.detailModelCod = users
                            self.cl.reloadData()
                        } catch {
                            print("Decoding error \(error.localizedDescription)")
                        }
    
                    }else{
                        print("Error in get json data")
                    }
                }
        }

}


extension NextVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailModelCod.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NextVCCell", for: indexPath) as! NextVCCell
        
        var imgURL = URL(string: detailModelCod[indexPath.row].url!)
        cell.img.sd_setImage(with: imgURL, completed: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        imgview.isHidden = false
        let selectedCell = cl.cellForItem(at: indexPath) as! NextVCCell
        img.image = selectedCell.img.image
        
    }
}
