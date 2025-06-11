import Foundation

struct CharacterDTOtoDomainMapper {
    func map(_ characterDTO: CharacterDTO) -> Character {
        Character(
            id: characterDTO.id,
            name: characterDTO.name,
            thumbnail: "\(characterDTO.thumbnail?.getPhoto() ?? "")"
        )
    }
}
