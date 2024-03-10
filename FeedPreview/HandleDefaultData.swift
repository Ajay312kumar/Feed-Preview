//Created by IPH Technologies Pvt. Ltd.

import Foundation



class HandleDefaultData {
    static let shared = HandleDefaultData()
    
    func getDefaultFeed() -> [ProfileModel] {
        var modelArray = [
                    ProfileModel(title: "Lauren Tourence",
                                 address: "France Paris",
                                 profilePic: "pic1",
                                 description: "Photographer at ‘Le Monte’, blogger and freelance journalist",
                                 posts: 100,
                                 followings: 25,
                                 followers: 200,
                                 photos: ["1","2","3","4","5","6","7","8"],
                                 isFollowed: true),
        
                    ProfileModel(title: "Lori Parez",
                                 address: "Paris Nantes",
                                 profilePic: "pic2",
                                 description: "Photographer at ‘Le Monte’, blogger and freelance journalist",
                                 posts: 28,
                                 followings: 22,
                                 followers: 201,
                                 photos: ["1","2","3","4","5","6","7","8"],
                                 isFollowed: true),
                    
                    ProfileModel(title: "Dumini",
                                 address: "South Africa",
                                 profilePic: "pic3",
                                 description: "Photographer at ‘Le Monte’, blogger and freelance journalist",
                                 posts: 10,
                                 followings: 48,
                                 followers: 50,
                                 photos: ["1","2","3","4","5","6","7","8"],
                                 isFollowed: true),
        
                    ProfileModel(title: "Tim Coock",
                                 address: "London Peris",
                                 profilePic: "pic4",
                                 description: "Photographer at ‘Le Monte’, blogger and freelance journalist",
                                 posts: 11,
                                 followings: 12,
                                 followers: 35,
                                 photos: ["1","2","3","4","5","6","7","8"],
                                 isFollowed: true),
                    
                    ProfileModel(title: "Kayle Brook",
                                 address: "Itally",
                                 profilePic: "pic8",
                                 description: "Photographer at ‘Le Monte’, blogger and freelance journalist",
                                 posts: 11,
                                 followings: 12,
                                 followers: 35,
                                 photos: ["8","2","3","4","5","6","7","8"],
                                 isFollowed: true),

                    ProfileModel(title: "Kane williamson",
                                 address: "Australia",
                                 profilePic: "pic6",
                                 description: "Photographer at ‘Le Monte’, blogger and freelance journalist",
                                 posts: 11,
                                 followings: 12,
                                 followers: 35,
                                 photos: ["1","2","3","4","5","6","7","8"],
                                 isFollowed: true),

                    ProfileModel(title: "Marcus Stoinis",
                                 address: "Swedan",
                                 profilePic: "pic7",
                                 description: "Photographer at ‘Le Monte’, blogger and freelance journalist",
                                 posts: 11,
                                 followings: 12,
                                 followers: 35,
                                 photos: ["1","2","3","4","5","6","7","8"],
                                 isFollowed: true),

                    ProfileModel(title: "Mayers",
                                 address: "London Paris",
                                 profilePic: "pic8",
                                 description: "asdf",
                                 posts: 11,
                                 followings: 12,
                                 followers: 35,
                                 photos: ["1","2","3","4","5","6","7","8"],
                                 isFollowed: true),

                    ProfileModel(title: "David warner",
                                 address: "Austrailia Mellborn",
                                 profilePic: "pic4",
                                 description: "Photographer at ‘Le Monte’, blogger and freelance journalist",
                                 posts: 11,
                                 followings: 12,
                                 followers: 35,
                                 photos: ["1","2","3","4","5","6","7","8"],
                                 isFollowed: true),

                    ProfileModel(title: "Angela Yu",
                                 address: "Japan Tokyo",
                                 profilePic: "pic2",
                                 description: "Photographer at ‘Le Monte’, blogger and freelance journalist",
                                 posts: 11,
                                 followings: 12,
                                 followers: 35,
                                 photos: ["1","2","3","4","5","6","7","8"],
                                 isFollowed: true),
        ]
                return modelArray
    }
}


