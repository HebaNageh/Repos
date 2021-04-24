//
//  ReposListViewController.swift
//  Repos
//
//  Created by Heba Nageh on 24/04/2021.
//

import UIKit
import JGProgressHUD
import PromiseKit

class ReposListViewController: BaseViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var progress = JGProgressHUD.init()
    
    private var reposViewModel = ReposViewModel.init(request: ReposRequestImp())
    private var repos: [RepositoryResponse]?
    private var filteredRepos: [RepositoryResponse]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadNetworkData()

        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 160

    }
    
    override class func instantFromStoryboard() -> (ReposListViewController?) {
        
        let storyboardName: String = "Repository"
        let storyBoard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "ReposListViewController") as? ReposListViewController
    }
    
    func loadNetworkData() {
        self.progress.show(in: self.view, animated: true)
        reposViewModel.getAllRepos().done { response in
            self.progress.dismiss()
            self.repos = response
            self.filteredRepos = response
            self.tableView.reloadData()
        }.ensure {
            self.progress.dismiss()
            self.tableView.reloadData()
        }.catch { (error) in
            self.progress.dismiss()
            self.tableView.reloadData()
            //show error message
        }
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

extension ReposListViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredRepos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoInfoTableViewCell", for: indexPath) as? RepoInfoTableViewCell else {
            return UITableViewCell()
        }
        if let repoInfo = filteredRepos?[indexPath.row] {
            cell.loadImage(url: repoInfo.owner?.avatarUrl ?? "")
            cell.repoName.text = repoInfo.name
            cell.ownerName.text = repoInfo.owner?.login
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailsViewController = RepoDetailsViewController.instantFromStoryboard() {
            detailsViewController.repoDetails = repos?[indexPath.row]
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
        
    }
    
}

extension ReposListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredRepos?.removeAll()
        if let searchText = searchBar.text?.localizedLowercase , !searchText.isEmpty {
            if let repos = self.repos {
                self.filteredRepos = repos.filter { repo in
                    let repoName = repo.name
                    return repoName.contains(searchText)
                }
                tableView.reloadData()
            }
        } else {
            self.filteredRepos = self.repos
            searchBar.resignFirstResponder()
        }
        
        self.tableView.reloadData()
        self.reloadInputViews()
    }
}
