import Foundation

struct MarvelResponse<T: Decodable>: Decodable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: MarvelData<T>
}

struct MarvelData<T: Decodable>: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
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

extension ThumbnailDTO {
    
    func getPhoto() -> String {
        "\(path)\(pathExtension)"
    }
}
