// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import { ERC721, MyNFT } from "../src/ERC721.sol";

contract ETHMoviesWeb3ERC721Test is Test {

     uint256 public ID = 1;
     uint256 public COST = 1;
     address public OWNER = 0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84;
     address public OWNER_DESTINY = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
     address public OWNER_EMPTY = address(0);

     MyNFT mynftERC721;

    function setUp() public {
      // mynftERC721 = new MyNFT();
      // mynftERC721.mint(OWNER, COST);
    }

    function test_mint_function() public {
      mynftERC721 = new MyNFT();
      mynftERC721.mint(OWNER, COST);
      address ownerOf = mynftERC721.ownerOf(ID);
      assertEq(OWNER, ownerOf, "Incorrect token minting");
    }

    function test_mint_get_contract_balance() public {
        mynftERC721 = new MyNFT();
        mynftERC721.mint(OWNER, COST);
        assertEq(mynftERC721.balanceOf(OWNER), COST, "Different contract balance.");
    }

    function test_mint_contract_withdraw() public {
        mynftERC721 = new MyNFT();
        mynftERC721.mint(OWNER, COST);
        vm.startPrank(OWNER);
        mynftERC721.safeTransferFrom(OWNER, OWNER_DESTINY,COST);

        //console.log("mynftERC721.balanceOf(OWNER): ", mynftERC721.balanceOf(OWNER));
        assertEq(mynftERC721.balanceOf(OWNER), 0, "Different contract balance222.");
        //console.log("mynftERC721.balanceOf(OWNER_DESTINY): ", mynftERC721.balanceOf(OWNER_DESTINY));
    }

    function test_mint_assert_approved() public {
       mynftERC721 = new MyNFT();
       mynftERC721.mint(OWNER, COST);
       address approved = mynftERC721.getApproved(1);
       assertEq(approved, OWNER_EMPTY, "Different not approved.");
    }

    function test_mint_get_contract_balance_more() public {
       mynftERC721 = new MyNFT();
       mynftERC721.mint(OWNER, 0);
       mynftERC721.mint(OWNER, 1);
       assertEq(mynftERC721.balanceOf(OWNER), 2, "Different contract balance more.");
    }

   function test_mint_only_owner_burn() public {
       mynftERC721 = new MyNFT();
       mynftERC721.mint(OWNER, 0);
       vm.startPrank(OWNER);
      //  vm.expectRevert("not owner of token");
       mynftERC721.burn(0);
       emit log_address(OWNER);
    }
}
