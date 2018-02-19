Eos docker image
================

### Build
`./build.sh` will build eos public testnet image tagged **DAWN-2018-02-14**

To build custom version `./build.sh custom-version` (**custom-version** tag should exist in official repo)

### Run
`docker run --name eos -it oxyaction/eos:DAWN-2018-02-14`

### Compile contracts
`docker run -v $(pwd)/contracts:/opt/contracts -w /opt/contracts/currency oxyaction/eos:DAWN-2018-02-14 eoscpp -o currency.wast currency.cpp`

#### Add some bash aliaess
```
alias eosc='docker exec eos eosc'
alias eos='docker exec -it eos bash'
```
