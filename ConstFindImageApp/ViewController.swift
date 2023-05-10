//
//  ViewController.swift
//  ConstFindImageApp
//
//  Created by Eunchan Kim on 2023/05/10.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var arr = ["1", "2", "3"]
    let urlString = "https://picsum.photos/id/300/300"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let nibName = UINib(nibName: "ImageListTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ImageListTableViewCell")
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageListTableViewCell", for: indexPath) as! ImageListTableViewCell
        cell.lblName.text = arr[indexPath.row]
        
        let url = URL(string: urlString)
        
        cell.imgView.kf.indicatorType = .activity
        cell.imgView.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        //셀선택시 셀 컬러 회색으로 변하지 않게
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageListTableViewCell", for: indexPath) as! ImageListTableViewCell
        cell.imgView.kf.cancelDownloadTask()
    }
    
    
}
