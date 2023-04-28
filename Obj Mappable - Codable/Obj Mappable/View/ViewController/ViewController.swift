//
//  ViewController.swift
//  Obj Mappable
//
//  Created by Shivam Pandya on 20/04/23.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: UIViewController {
    
    @IBOutlet weak var tbl: UITableView!
    
    // MARK: -  model for ObjectMapper - Mappable
    var dataModelObjMap = [EmployeeData]()
    
    
    // MARK: - model for Codable
    var dataModelCod = [EmployeeDataCodable]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getDataObjMap()
//        getDataCodURL()
        getDataCodALF()
        
    }
    
    // MARK: - btnActions
    
    @IBAction func btnNextAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NextVC") as! NextVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - func for ObjectMapper - Mappable
    
//    func getDataObjMap(){
//
//        let urlStr = "https://gorest.co.in/public/v2/users"
//
//        AF.request(urlStr).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                guard let castingValue = value as? [String: Any] else { return }
//                guard let userData = Mapper<EmployeeData>().map(JSON: castingValue) else { return }
//                self.dataModelCod = userData
////                completionHandler(userData)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    // MARK: - func for Codable with URLSESSION
    
    //    func getDataCodURL(){
    //
    //        let url = URL(string: "https://gorest.co.in/public/v2/users")
    //
    //        URLSession.shared.dataTask(with: url!) { (data, response, error) in
    //
    //            do{if error == nil{
    //                self.dataModelCod = try JSONDecoder().decode([EmployeeDataCodable].self, from: data!)
    //
    //                DispatchQueue.main.async {
    //                    self.tbl.reloadData()
    //                }
    //            }
    //            }catch{
    //                print("Error in get json data")
    //            }
    //
    //        }.resume()
    //    }
    
    // MARK: - func for Codable with ALAMOFIRE
    
        func getDataCodALF(){

            let url = "https://gorest.co.in/public/v2/users"

            AF.request(url, method: .get)
                .responseJSON { response in
                    if response.result != nil  {
                        print(response.result)

                        do {
                            let users = try JSONDecoder().decode([EmployeeDataCodable].self, from: response.data!)
                            self.dataModelCod = users
                            self.tbl.reloadData()
                        } catch {
                            print("Decoding error \(error.localizedDescription)")
                        }

                    }else{
                        print("Error in get json data")
                    }
                }
        }
}
        

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModelCod.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewControllerCell") as! ViewControllerCell
        
        cell.setData(objData: dataModelCod[indexPath.row])
        
        return cell
    }
}

