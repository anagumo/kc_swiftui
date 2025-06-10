import Foundation

struct MarvelResult: Decodable {
    let data: CharacterResult
}

struct CharacterResult: Decodable {
    let results: [CharacterDTO]
}

struct ThumbnailDTO: Decodable {
    let path: String
    let pathExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case pathExtension = "extension"
    }
}
