//
//  RepoDetailsViewController.swift
//  Repos
//
//  Created by Heba Nageh on 24/04/2021.
//

import UIKit

class RepoDetailsViewController: BaseViewController {
    
    var repoDetails: RepositoryResponse?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override class func instantFromStoryboard() -> (RepoDetailsViewController?) {
        
        let storyboardName: String = "Repository"
        let storyBoard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "RepoDetailsViewController") as? RepoDetailsViewController
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
