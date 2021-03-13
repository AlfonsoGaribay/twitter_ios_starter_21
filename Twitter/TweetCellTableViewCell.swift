//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Alfonso Garibay on 3/5/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetBotton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {self.setFavorited(true)}, failure: { (Error) in
                print("Favorite did not succeed: \(Error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(false)
            }, failure: { (Error) in
                print("Unfavorited did not succeed: \(Error)")
            })
        }
        
    }
    
    @IBAction func retweet(_ sender: Any) {
        // <-- https://api.twitter.com/1.1/statuses/retweet/\(tweetId).json
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (Error) in
            print("Error in retweeting: \(Error)")
        })
    }
    
    var favorited: Bool = false
    var tweetId:Int = -1
    
    func setRetweeted(_ isRetweeted: Bool){
        if (isRetweeted) {
            retweetBotton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetBotton.isEnabled = false
        } else {
            retweetBotton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetBotton.isEnabled = true
        }
    }
    
    func setFavorited(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
