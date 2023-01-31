pragma solidity ^0.8.4;



import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

import "@openzeppelin/contracts/utils/Counters.sol";



contract MyToken is ERC721, ERC721URIStorage, Ownable {

    using Counters for Counters.Counter;



    Counters.Counter private _tokenIdCounter;



    uint256 private price = 1*10**18;



    constructor() ERC721("MyToken", "MTK") {}



    function safeMint(address to) public payable {

        require(msg.value>=price,"erro, pagamento abaixo do mercado...");



        for(uint256 i = 0; i < 50; i++){

            uint tokenId = _tokenIdCounter.current();

            _tokenIdCounter.increment();

            _safeMint(to, tokenId);

             string memory uri = "https://gateway.pinata.cloud/ipfs/QmVtrcaqCcBB26Lz5yYnNi1axxUHQCJ88F5GTe4J6TC6Hm/";

            string memory format = ".json";

             string memory finalURI = string(abi.encodePacked(uri,uint2str(tokenId),format));

            _setTokenURI(tokenId, finalURI);

        }

    }



    // The following functions are overrides required by Solidity.



    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {

        super._burn(tokenId);

    }



    function tokenURI(uint256 tokenId)

        public

        view

        override(ERC721, ERC721URIStorage)

        returns (string memory)

    {

        return super.tokenURI(tokenId);

    }



    



    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {

        if (_i == 0) {

            return "0";

        }

        uint j = _i;

        uint len;

        while (j != 0) {

            len++;

            j /= 10;

        }

        bytes memory bstr = new bytes(len);

        uint k = len;

        while (_i != 0) {

            k = k-1;

            uint8 temp = (48 + uint8(_i - _i / 10 * 10));

            bytes1 b1 = bytes1(temp);

            bstr[k] = b1;

            _i /= 10;

        }

        return string(bstr);

    }







  

}