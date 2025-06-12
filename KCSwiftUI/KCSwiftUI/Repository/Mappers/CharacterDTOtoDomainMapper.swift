import Foundation

struct CharacterDTOtoDomainMapper {
    func map(_ characterDTO: CharacterDTO) -> KCCharacter {
        KCCharacter(
            id: characterDTO.id,
            name: characterDTO.name,
            thumbnail: "\(characterDTO.thumbnail?.getPhoto() ?? "")"
        )
    }
}
