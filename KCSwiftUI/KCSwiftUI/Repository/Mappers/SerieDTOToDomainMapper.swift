import Foundation

struct SerieDTOToDomainMapper {
    func map(_ serieDTO: SerieDTO) -> KCSerie {
        KCSerie(
            id: serieDTO.id,
            title: serieDTO.title,
            description: serieDTO.description,
            thumbnail: "\(serieDTO.thumbnail?.getPhoto() ?? "")"
        )
    }
}
