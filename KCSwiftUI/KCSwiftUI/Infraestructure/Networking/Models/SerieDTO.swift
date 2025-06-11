import Foundation

struct SerieDTO: Decodable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: ThumbnailDTO?
}
