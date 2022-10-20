//
//  CharactersViewController.swift
//  The Rick and Morty API
//
//  Created by Aleksandr on 12.06.2022.
//

import UIKit

class CharactersViewController: UITableViewController {

    private var rickAndMorty: RickAndMorty?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        tableView.backgroundView = UIImageView(image: UIImage(named: "Pickle"))
        
        fetchData(from: Link.rickAndMortyApi.rawValue)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rickAndMorty?.results.count  ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "character", for: indexPath) as! TableViewCell
        let character = rickAndMorty?.results[indexPath.row]
        cell.configure(with: character)
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let characterVC = segue.destination as? CharacterViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        characterVC.character = rickAndMorty?.results[indexPath.row]
    }

    @IBAction func updateData(_ sender: UIBarButtonItem) {
        sender.tag == 1
        ? fetchData(from: rickAndMorty?.info.next)
        : fetchData(from: rickAndMorty?.info.prev)
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { rickAndMorty in
            self.rickAndMorty = rickAndMorty
            self.tableView.reloadData()
        }
    }
    
    private func setupNavigationBar() {
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(
            red: 98/255,
            green: 148/255,
            blue: 49/255,
            alpha: 230/255
        )
        navigationController?.navigationBar.standardAppearance = navBarAppearance
    }
}

extension CharactersViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}



