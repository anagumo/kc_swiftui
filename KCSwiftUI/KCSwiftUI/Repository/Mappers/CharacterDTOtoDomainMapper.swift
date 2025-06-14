import Foundation

struct CharacterDTOtoDomainMapper {
    func map(_ characterDTO: CharacterDTO) -> CharacterModel {
        CharacterModel(
            id: characterDTO.id,
            name: characterDTO.name,
            thumbnail: "\(characterDTO.thumbnail?.getPhoto() ?? "")"
        )
    }
}
