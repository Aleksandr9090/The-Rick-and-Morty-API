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
        fetchData(from: Link.rickAndMortyApi.rawValue)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rickAndMorty?.results.count  ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "character", for: indexPath)
        let character = rickAndMorty?.results[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = character?.name
        
        cell.contentConfiguration = content
        return cell
    }
    
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { rickAndMorty in
            self.rickAndMorty = rickAndMorty
            self.tableView.reloadData()
        }
    }

  

    
     
     
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let characterVC = segue.destination as? CharacterViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        characterVC.character = rickAndMorty?.results[indexPath.row]
    }



}
