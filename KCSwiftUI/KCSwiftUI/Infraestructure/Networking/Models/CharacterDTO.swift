import Foundation

struct CharacterDTO: Decodable {
    let id: String
    let name: String
    let thumbnail: ThumbnailDTO
}
