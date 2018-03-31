#connect eth blocknet at testrpc

from web3 import Web3, HTTPProvider

web3 = Web3(HTTPProvider('http://localhost:8545'))

print(web3.eth.blockNumber)
