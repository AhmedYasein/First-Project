//
//  MediaListVC.swift
//  Media Finder
//
//  Created by Ahmed Yasein on 4/13/20.
//  Copyright © 2020 IDE academy. All rights reserved.
//

import UIKit

class MediaListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    fileprivate let cellId = "MediaCell"
    var mediaArr: [Media] = []
    var selectMedia: MediaType = .All
    var isSearching = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 105.5

    }
    
    private func getData(mediaType: String, keyWord: String) {
        APIManger.loadMedia(mediaType: mediaType, keyWord: keyWord){(error, media)in
            if let error = error {
                print(error.localizedDescription)
            } else if let media = media {
                self.mediaArr = media
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func selectSegmented(_ sender: UISegmentedControl) {
        let getIndex = sender.selectedSegmentIndex
        switch getIndex {
        case 1:
            self.selectMedia = MediaType.Movie
        case 2:
            self.selectMedia = MediaType.Music
        case 3:
            self.selectMedia = MediaType.TVShow
        default:
            self.selectMedia = MediaType.All
        }
        
    }
    
}

extension MediaListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MediaCell
            else {
            return UITableViewCell()
        }
        cell.configureMediaCell(media: mediaArr[indexPath.row])
        return cell
    }
 /*   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105.5
    }
    */
    
}


extension MediaListVC: UISearchBarDelegate{
    /*   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
     if searchBar.text == nil || searchBar.text == "" {
     isSearching = false
     view.endEditing(true)
     tableView.reloadData()
     } else {
     isSearching = true
     let search = searchBar.text
     params?[Parmameters.term] = search
     }
     }
     */
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let keyWord = searchBar.text ?? ""
        dataBase.share.insertCaheData(text: keyWord)
        let x = dataBase.share.getLastSearch()
        getData(mediaType: selectMedia.rawValue, keyWord: x ?? "")
    }
}
