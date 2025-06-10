import Foundation

struct SerieDTO: Decodable {
    let id: String
    let title: String
    let description: String
    let thumbnail: ThumbnailDTO
}
