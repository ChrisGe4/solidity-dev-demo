forge create SimpleStorage \
--rpc-url=http://127.0.0.1:8545 \
--private-key=""


forge script script/DeploySimpleStorage.s.sol \
--rpc-url=http://127.0.0.1:8545 \
--broadcast \
--private-key=""


cast --to-base 0x714e1 dec


source .env
forge script script/DeploySimpleStorage.s.sol \
--rpc-url=${SEPOLIA_RPC_URL} \
--broadcast \
--private-key=${PRIVATE_KEY}


cast send 0x8726a3D7fF8dC603d753497FA00b7f7D47b2F3dC "store(uint256)" 100 --rpc-url=${RPC_URL} --private-key=${PRIVATE_KEY}
cast call 0x8726a3D7fF8dC603d753497FA00b7f7D47b2F3dC "retrieve()" 

git config --global user.name "Chris"
git config --global user.email chris.ge@live.com

forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 --no-commit