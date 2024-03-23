// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import { ETHMoviesWeb3 } from "../src/ETHMoviesWeb3.sol";

contract ETHMoviesWeb3Test is Test {

     string public NAME_CONTRACT = 'ETH Movies Web3';
     string public NAME_MOVIE = 'The ShaThe Shawshank Redemption';
     string public SYMBOL = 'ETHMW3';
     string public VOTEAVERAGE = "1.1";
     string public IMAGE = "IMAGE";
     uint256 public COST = 1;
     uint256 public ID = 1;
     address public OWNER = 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496;
     address public OWNER_EMPTY = address(0);

    ETHMoviesWeb3 newContract;

    function setUp() public {
        newContract = new ETHMoviesWeb3(NAME_CONTRACT, SYMBOL);
        newContract.list(NAME_MOVIE, COST, VOTEAVERAGE, IMAGE);
    }

    function test_deployment_has_name_contract() public {
        assertEq(newContract.name(), NAME_CONTRACT, "Different contract name.");
    }

    function test_deployment_has_symbol_contract() public {
       assertEq(newContract.symbol(), SYMBOL, "Different symbol name..");
    }

    function test_deployment_set_owner() public {
       assertEq(newContract.owner(), OWNER, "Different owner.");
    }

    function test_deployment_set_not_owner() public {
         console.log("newContract.owner(): ", newContract.owner());
         console.log(" msg.sender: ",  msg.sender);
       assertNotEq(newContract.owner(), msg.sender, "Different owner.");
    }

    function test_deployment_get_max_supply() public {
       assertEq(newContract.maxSupply(), 1, "Different max supply.");
    }

    function test_deployment_get_total_supply() public {
       assertEq(newContract.totalSupply(), 0, "Different total supply.");
    }

    function test_deployment_get_movie_name() public {
       assertEq(newContract.getMovie(ID).name, NAME_MOVIE, "Different name movie.");
    }

    function test_deployment_get_movie_cost() public {
       assertEq(newContract.getMovie(ID).cost, COST, "Different cost movie.");
    }

    function test_deployment_get_movie_isowner() public {
       assertEq(newContract.getMovie(ID).isOwned, false, "Has already been purchased.");
    }

    function test_deployment_get_movie_voteaverage() public {
       assertEq(newContract.getMovie(ID).voteAverage, "1.1", "Different vote Average");
    }

    function test_deployment_get_movie_image() public {
       assertEq(newContract.getMovie(ID).image, IMAGE, "Different image");
    }

    function test_mint_function() public {
       uint256 initialSupply = newContract.totalSupply();
       uint256 finalSupply = newContract.totalSupply();
   
       assertEq(finalSupply, initialSupply, "Incorrect token minting");
    }

    function test_mint_get_contract_balance() public {
       assertEq(newContract.getBalance(), 0, "Different contract balance.");
    }

    function test_mint_get_contract_withdraw() public {
        assertEq(newContract.getBalance(), 0, "Different contract balance222.");
    }

}
