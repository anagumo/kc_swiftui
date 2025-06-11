import Foundation

struct SerieDTOToDomainMapper {
    func map(_ serieDTO: SerieDTO) -> Serie {
        Serie(
            id: serieDTO.id,
            title: serieDTO.title,
            description: serieDTO.description,
            thumbnail: "\(serieDTO.thumbnail?.getPhoto() ?? "")"
        )
    }
}
