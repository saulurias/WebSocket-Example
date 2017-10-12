//
//  CollectionViewController.swift
//  WebSocket
//
//  Created by saul ulises urias guzmàn on 11/10/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

final class CollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    let emoji = ["😀", "😬", "😁", "😂", "😃", "😄", "😅", "😆", "😇", "😉", "😊", "🙂", "🙃", "☺️", "😋", "😌", "😍", "😘", "😗", "😙", "😚", "😜", "😝", "😛", "🤑", "🤓", "😎", "🤗", "😏", "😶", "😐", "😑", "😒", "🙄", "🤔", "😳", "😞", "😟", "😠", "😡", "😔", "😕", "🙁", "☹️", "😣", "😖", "😫", "😩", "😤", "😮", "😱", "😨", "😰", "😯", "😦", "😧", "😢", "😥", "😪", "😓", "😭", "😵", "😲", "🤐", "😷", "🤒", "🤕", "😴", "💩"]
}

// MARK: - Internal
extension CollectionViewController {
    
    func selectedEmoji() -> String? {
        guard let selectedIndexPaths = collectionView?.indexPathsForSelectedItems,
            let item = selectedIndexPaths.first?.item else {
                return nil
        }
        
        return emoji[item]
    }
}

// MARK: - UICollectionViewDataSource
extension CollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emoji.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emoji", for: indexPath)
        
        let label = cell.viewWithTag(100) as? UILabel
        label?.text = emoji[indexPath.item]
        
        return cell
    }
}
