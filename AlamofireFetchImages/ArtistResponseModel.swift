import Foundation

class ArtistResponseModel: Decodable {
    public var resultCount: Int?
    public var results: [Results]?
}

class Results : Decodable {
    
    public var trackName : String?
    public var country : String?
    public var artworkUrl100 : String
    public var artistName : String?
}
