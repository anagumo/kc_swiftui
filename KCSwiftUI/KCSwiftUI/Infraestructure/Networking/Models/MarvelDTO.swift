import Foundation

struct MarvelResponseDTO<T: Decodable>: Decodable {
    let data: MarvelDataDTO<T>
}

struct MarvelDataDTO<T: Decodable>: Decodable {
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
