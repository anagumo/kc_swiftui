import Foundation

struct MarvelResponse<T: Decodable>: Decodable {
    let data: MarvelData<T>
}

struct MarvelData<T: Decodable>: Decodable {
    let results: [T]
}

struct ThumbnailDTO: Decodable {
    let path: String
    let pathExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case pathExtension = "extension"
    }
}
