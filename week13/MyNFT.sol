// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// ERC-721 실습용 최소 컨트랙트 — OpenZeppelin 상속 · 소유자 권한 · 자동 ID · URI 저장의 네 부품.
// 컴파일러는 0.8.24 이상을 고른다 (Remix가 받아오는 OpenZeppelin ERC721이 0.8.24 이상을 요구한다).
// 배포 후 mint(본인 주소, "ipfs://<JSON의 CID>")로 첫 NFT(#1)를 발행한다.

// OpenZeppelin 표준 구현을 가져온다 — URI 저장 확장 + 소유자 권한
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// is …: 두 구현을 상속 → 표준 함수(ownerOf·safeTransferFrom·tokenURI 등)와 onlyOwner가 그대로 작동
contract MyNFT is ERC721URIStorage, Ownable {
    uint256 private _nextId = 1;   // 자동 증가 tokenId · 첫 NFT는 #1
    // ERC721(이름, 심볼): 지갑·마켓이 이 정보로 토큰 표시 · Ownable(msg.sender): 배포자를 소유자로 등록
    constructor() ERC721("MyName Collection", "MNC") Ownable(msg.sender) {}

    // onlyOwner: 배포자(=컨트랙트 소유자)만 호출 → 무단 민팅 차단 (NFT 보유자 ownerOf와는 다른 대상)
    function mint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _nextId++;   // 현재값을 tokenId에 담고 _nextId를 1 증가 → 다음 민팅은 #2
        _safeMint(to, tokenId);        // 안전 발행: 수신자가 컨트랙트면 IERC721Receiver 점검
        _setTokenURI(tokenId, uri);    // 이 토큰의 메타데이터 위치를 storage에 등록
    }
}
