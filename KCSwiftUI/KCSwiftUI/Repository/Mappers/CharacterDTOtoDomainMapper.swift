import Foundation

struct CharacterDTOtoDomainMapper {
    func map(_ characterDTO: CharacterDTO) -> CharcterModel {
        CharcterModel(
            id: characterDTO.id,
            name: characterDTO.name,
            thumbnail: "\(characterDTO.thumbnail?.getPhoto() ?? "")"
        )
    }
}
