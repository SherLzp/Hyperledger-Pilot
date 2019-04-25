# Set up Hyperledger-Fabric environment

## OS Environment

- **Ubuntu18.04**

## Before install hyperledger-fabric

- **Install docker**

> 1. Install basic libs
>
> ```shell
> $ apt-get update
> $ apt-get install -y pt-transport-https ca-certificates curl git softwareproperties-common lrzsz
> ```
>
> 2. Add docker image to repository
>
> ```shell
> # use aliyun image
> $  curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
> $ add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/dockerce/linux/ubuntu $(lsb_release-cs) stable"
> $ apt-get update
> ```
>
> 3. Install docker
>
> ```shell
> $ apt-get install -y docker-ce
> $ docker version
> Client:
> Version:           18.09.2
> API version:       1.39
> Go version:        go1.10.4
> Git commit:        6247962
> Built:             Tue Feb 26 23:52:23 2019
> OS/Arch:           linux/amd64
> Experimental:      false
> 
> Server:
> Engine:
> Version:          18.09.2
> API version:      1.39 (minimum version 1.12)
> Go version:       go1.10.4
> Git commit:       6247962
> Built:            Wed Feb 13 00:24:14 2019
> OS/Arch:          linux/amd64
> Experimental:     false
> ```
>
> 4. Install docker-compose
>
> ```shell
> $ apt-get install -y python-pip
> $ pip install docker-compose
> $ docker-compose version
> docker-compose version 1.24.0, build 0aa5906
> docker-py version: 3.7.2
> CPython version: 2.7.15rc1
> OpenSSL version: OpenSSL 1.1.0g  2 Nov 2017
> ```

- **Install Go**

> ```shell
> # 1. use wget to download the pkg
> $ wget https://dl.google.com/go/go1.12.3.linux-amd64.tar.gz
> # 2. unzip tar to /usr/local
> $ tar zxvf go1.12.3.linux-amd64.tar.gz
> # 3. create gopath directory
> $ mkdir $HOME/mygo
> # 4. update source environment
> $ vim /etc/profile
> # 5. add the following code to the end of the file
> 	export GOROOT=/usr/local/go
> 	export GOPATH=$HOME/mygo
> 	export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
> # 6. update
> $ source /etc/profile
> # 7. check go
> $ go version
> go version go1.12.3 linux/amd64
> ```

- **Install Nodejs**

> ```shell
> # update ubuntu apt-source repository
> $ apt-get install -y python-software-properties software-properties-common
> $ add-apt-repository ppa:chris-lea/node.js
> $ apt-get update
> # install nodejs
> $ apt-get install -y nodejs
> $ apt install -y nodejs-legacy
> $ apt install -y npm
> # install nodejs version controller
> $ npm install n -g
> # install nodejs stable version
> $ n stable
> $ node -v
> v10.15.3
> $ npm -v
> 6.4.1
> ```

## Install Fabric

- **Create hyperledger-fabric directory**

> ```shell
> $ mkdir $HOME/hyperledger-fabric
> $ cd hyperledger-fabric
> ```

- **Install Fabric samples,binaries and Docker images**

> 1. official way(**Recommand!**)
>
> ```shell
> # the command usage
> $ curl -sSL http://bit.ly/2ysbOFE | bash -s -- <fabric_version> <fabric-ca_version> <thirdparty_version>
> # so we can download Fabric v1.4.1
> $ curl -sSL http://bit.ly/2ysbOFE | bash -s -- 1.4.1 1.4.1 0.4.15
> # check the docker images
> $ docker images
> hyperledger/fabric-ca                                                                                  1.4.1               3a1799cda5d7        8 days ago          252MB
> hyperledger/fabric-ca                                                                                  latest              3a1799cda5d7        8 days ago          252MB
> hyperledger/fabric-tools                                                                               1.4.1               432c24764fbb        8 days ago          1.55GB
> hyperledger/fabric-tools                                                                               latest              432c24764fbb        8 days ago          1.55GB
> hyperledger/fabric-ccenv                                                                               1.4.1               d7433c4b2a1c        8 days ago          1.43GB
> hyperledger/fabric-ccenv                                                                               latest              d7433c4b2a1c        8 days ago          1.43GB
> hyperledger/fabric-orderer                                                                             1.4.1               ec4ca236d3d4        8 days ago          173MB
> hyperledger/fabric-orderer                                                                             latest              ec4ca236d3d4        8 days ago          173MB
> hyperledger/fabric-peer                                                                                1.4.1               a1e3874f338b        8 days ago          178MB
> hyperledger/fabric-peer                                                                                latest              a1e3874f338b        8 days ago          178MB
> hyperledger/fabric-javaenv                                                                             1.4.1               b8c9d7ff6243        8 days ago          1.74GB
> hyperledger/fabric-javaenv                                                                             latest              b8c9d7ff6243        8 days ago          1.74GB
> sherlzp/substrate                                                                                      1.1                 566251c3a4ff        12 days ago         6.41GB
> hyperledger/fabric-zookeeper                                                                           0.4.15              20c6045930c8        4 weeks ago         1.43GB
> hyperledger/fabric-zookeeper                                                                           latest              20c6045930c8        4 weeks ago         1.43GB
> hyperledger/fabric-kafka                                                                               0.4.15              b4ab82bbaf2f        4 weeks ago         1.44GB
> hyperledger/fabric-kafka                                                                               latest              b4ab82bbaf2f        4 weeks ago         1.44GB
> hyperledger/fabric-couchdb                                                                             0.4.15              8de128a55539        4 weeks ago         1.5GB
> hyperledger/fabric-couchdb                                                                             latest              8de128a55539        4 weeks ago         1.5GB
> hyperledger/fabric-baseos                                                                              amd64-0.4.15        9d6ec11c60ff        4 weeks ago         145MB
> ```
>
> 2. Another way
>
> > If you meet error on the last command.Don't worry.
>
> ```shell
> # clone my project
> $ git clone https://github.com/SherLzp/Hyperledger-Pilot.git
> # download docker images
> $ cd Hyperledger-Pilot
> # run the script
> $ chmod +x pull_fabric_images.sh
> $ ./pull_fabric_images.sh
> # check the docker images
> $ docker images
> hyperledger/fabric-ca                                                                                  1.4.1               3a1799cda5d7        8 days ago          252MB
> hyperledger/fabric-tools                                                                               1.4.1               432c24764fbb        8 days ago          1.55GB
> hyperledger/fabric-ccenv                                                                               1.4.1               d7433c4b2a1c        8 days ago          1.43GB
> hyperledger/fabric-orderer                                                                             1.4.1               ec4ca236d3d4        8 days ago          173MB
> hyperledger/fabric-peer                                                                                1.4.1               a1e3874f338b        8 days ago          178MB
> hyperledger/fabric-javaenv                                                                             1.4.1               b8c9d7ff6243        8 days ago          1.74GB
> hyperledger/fabric-zookeeper                                                                           0.4.15              20c6045930c8        4 weeks ago         1.43GB
> hyperledger/fabric-kafka                                                                               0.4.15              b4ab82bbaf2f        4 weeks ago         1.44GB
> hyperledger/fabric-couchdb                                                                             0.4.15              8de128a55539        4 weeks ago         1.5GB
> hyperledger/fabric-baseos                                                                              amd64-0.4.15        9d6ec11c60ff        4 weeks ago         145MB
> ```
>
> - **Set global access**
>
> ```shell
> $ cd fabric-samples/bin/
> $ cp * /usr/bin/
> ```

## Fabric images analysis

| Image name | Usage |
| ---- | ---- |
| hyperledger/fabric-peer | Peer Node |
| hyperledger/fabric-orderer | Orderer Node |
| hyperledger/fabric-ccenv | Chaincode of Go environment |
| hyperledger/fabric-tools | Utils such as cryptogen/configtxgen etc. |
| hyperledger/fabric-ca | CA Module |
| hyperledger/fabric-couchdb | CouchDB |
| hyperledger/fabric-kafka | Kafka |
| hyperledger/fabric-zookeeper | Zookeeper |
| hyperledger/fabric-javaenv | Chaincode of Java environment |

## Test Fabric Network

```shell
# get into the sample directory
$ cd fabric-samples/first-network/
# generate related files
$ ./byfn.sh generate
```

> Generating certs and genesis block for channel 'mychannel' with CLI timeout of '10' seconds and CLI delay of '3' seconds
> Continue? [Y/n] Y
> proceeding ...
> /root/hyperledger-fabric/fabric-samples/bin/cryptogen
>
> ##########################################################
> ##### Generate certificates using cryptogen tool #########
> ##########################################################
> + cryptogen generate --config=./crypto-config.yaml
>   org1.example.com
>   org2.example.com
> + res=0
> + set +x
>
> /root/hyperledger-fabric/fabric-samples/bin/configtxgen
> ##########################################################
> #########  Generating Orderer Genesis block ##############
> ##########################################################
> CONSENSUS_TYPE=solo
> + '[' solo == solo ']'
> + configtxgen -profile TwoOrgsOrdererGenesis -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block
>   2019-04-20 11:14:14.688 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
>   2019-04-20 11:14:14.792 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 002 orderer type: solo
>   2019-04-20 11:14:14.792 UTC [common.tools.configtxgen.localconfig] Load -> INFO 003 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:14:14.876 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 004 orderer type: solo
>   2019-04-20 11:14:14.876 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 005 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:14:14.880 UTC [common.tools.configtxgen] doOutputBlock -> INFO 006 Generating genesis block
>   2019-04-20 11:14:14.880 UTC [common.tools.configtxgen] doOutputBlock -> INFO 007 Writing genesis block
> + res=0
> + set +x
>
> #################################################################
> ### Generating channel configuration transaction 'channel.tx' ###
> #################################################################
> + configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID mychannel
>   2019-04-20 11:14:14.920 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
>   2019-04-20 11:14:15.002 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:14:15.082 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
>   2019-04-20 11:14:15.082 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:14:15.082 UTC [common.tools.configtxgen] doOutputChannelCreateTx -> INFO 005 Generating new channel configtx
>   2019-04-20 11:14:15.086 UTC [common.tools.configtxgen] doOutputChannelCreateTx -> INFO 006 Writing new channel tx
> + res=0
> + set +x
>
> #################################################################
> #######    Generating anchor peer update for Org1MSP   ##########
> #################################################################
> + configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID mychannel -asOrg Org1MSP
>   2019-04-20 11:14:15.125 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
>   2019-04-20 11:14:15.209 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:14:15.291 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
>   2019-04-20 11:14:15.291 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:14:15.291 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 005 Generating anchor peer update
>   2019-04-20 11:14:15.291 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 006 Writing anchor peer update
> + res=0
> + set +x
>
> #################################################################
> #######    Generating anchor peer update for Org2MSP   ##########
> #################################################################
> + configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID mychannel -asOrg Org2MSP
>   2019-04-20 11:14:15.331 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
>   2019-04-20 11:14:15.411 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:14:15.490 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
>   2019-04-20 11:14:15.491 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:14:15.491 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 005 Generating anchor peer update
>   2019-04-20 11:14:15.491 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 006 Writing anchor peer update
> + res=0
> + set +x

```shell
# start the network
$ ./byfn.sh up
```

> Starting for channel 'mychannel' with CLI timeout of '10' seconds and CLI delay of '3' seconds
> Continue? [Y/n] Y
> proceeding ...
> LOCAL_VERSION=1.4.1
> DOCKER_IMAGE_VERSION=1.4.1
> /root/hyperledger-fabric/fabric-samples/bin/cryptogen
>
> ##########################################################
> ##### Generate certificates using cryptogen tool #########
> ##########################################################
> + cryptogen generate --config=./crypto-config.yaml
>   org1.example.com
>   org2.example.com
> + res=0
> + set +x
>
> /root/hyperledger-fabric/fabric-samples/bin/configtxgen
> ##########################################################
> #########  Generating Orderer Genesis block ##############
> ##########################################################
> CONSENSUS_TYPE=solo
> + '[' solo == solo ']'
> + configtxgen -profile TwoOrgsOrdererGenesis -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block
>   2019-04-20 11:15:46.320 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
>   2019-04-20 11:15:46.404 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 002 orderer type: solo
>   2019-04-20 11:15:46.405 UTC [common.tools.configtxgen.localconfig] Load -> INFO 003 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:15:46.483 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 004 orderer type: solo
>   2019-04-20 11:15:46.483 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 005 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:15:46.487 UTC [common.tools.configtxgen] doOutputBlock -> INFO 006 Generating genesis block
>   2019-04-20 11:15:46.487 UTC [common.tools.configtxgen] doOutputBlock -> INFO 007 Writing genesis block
> + res=0
> + set +x
>
> #################################################################
> ### Generating channel configuration transaction 'channel.tx' ###
> #################################################################
> + configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID mychannel
>   2019-04-20 11:15:46.530 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
>   2019-04-20 11:15:46.612 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:15:46.694 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
>   2019-04-20 11:15:46.694 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:15:46.694 UTC [common.tools.configtxgen] doOutputChannelCreateTx -> INFO 005 Generating new channel configtx
>   2019-04-20 11:15:46.699 UTC [common.tools.configtxgen] doOutputChannelCreateTx -> INFO 006 Writing new channel tx
> + res=0
> + set +x
>
> #################################################################
> #######    Generating anchor peer update for Org1MSP   ##########
> #################################################################
> + configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID mychannel -asOrg Org1MSP
>   2019-04-20 11:15:46.742 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
>   2019-04-20 11:15:46.828 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:15:46.906 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
>   2019-04-20 11:15:46.906 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:15:46.906 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 005 Generating anchor peer update
>   2019-04-20 11:15:46.907 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 006 Writing anchor peer update
> + res=0
> + set +x
>
> #################################################################
> #######    Generating anchor peer update for Org2MSP   ##########
> #################################################################
> + configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID mychannel -asOrg Org2MSP
>   2019-04-20 11:15:46.950 UTC [common.tools.configtxgen] main -> INFO 001 Loading configuration
>   2019-04-20 11:15:47.035 UTC [common.tools.configtxgen.localconfig] Load -> INFO 002 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:15:47.115 UTC [common.tools.configtxgen.localconfig] completeInitialization -> INFO 003 orderer type: solo
>   2019-04-20 11:15:47.115 UTC [common.tools.configtxgen.localconfig] LoadTopLevel -> INFO 004 Loaded configuration: /root/hyperledger-fabric/fabric-samples/first-network/configtx.yaml
>   2019-04-20 11:15:47.115 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 005 Generating anchor peer update
>   2019-04-20 11:15:47.116 UTC [common.tools.configtxgen] doOutputAnchorPeersUpdate -> INFO 006 Writing anchor peer update
> + res=0
> + set +x
>
> Creating network "net_byfn" with the default driver
> Creating volume "net_peer0.org2.example.com" with default driver
> Creating volume "net_peer1.org2.example.com" with default driver
> Creating volume "net_peer1.org1.example.com" with default driver
> Creating volume "net_peer0.org1.example.com" with default driver
> Creating volume "net_orderer.example.com" with default driver
> Creating peer1.org2.example.com ... done
> Creating peer0.org1.example.com ... done
> Creating peer1.org1.example.com ... done
> Creating peer0.org2.example.com ... done
> Creating orderer.example.com    ... done
> Creating cli                    ... done
> CONTAINER ID        IMAGE                               COMMAND                  CREATED             STATUS                     PORTS                                          NAMES
> a4ebb698b0c3        hyperledger/fabric-tools:latest     "/bin/bash"              1 second ago        Up Less than a second                                                     cli
> 7607ee46b6d7        hyperledger/fabric-peer:latest      "peer node start"        5 seconds ago       Up 1 second                0.0.0.0:9051->9051/tcp                         peer0.org2.example.com
> 67f39d95768b        hyperledger/fabric-orderer:latest   "orderer"                5 seconds ago       Up 1 second                0.0.0.0:7050->7050/tcp                         orderer.example.com
> 4d656c440d2e        hyperledger/fabric-peer:latest      "peer node start"        5 seconds ago       Up 1 second                0.0.0.0:10051->10051/tcp                       peer1.org2.example.com
> 94e4e7a82119        hyperledger/fabric-peer:latest      "peer node start"        5 seconds ago       Up 1 second                0.0.0.0:7051->7051/tcp                         peer0.org1.example.com
> 4f75c3b73546        hyperledger/fabric-peer:latest      "peer node start"        5 seconds ago       Up 2 seconds               0.0.0.0:8051->8051/tcp                         peer1.org1.example.com
> 93dae94394cc        sherlzp/substrate:1.1               "/bin/bash"              12 days ago         Up 2 days                  0.0.0.0:9944->9944/tcp, 0.0.0.0:8800->80/tcp   substrate
> f2b8872d1d83        lottery:1.0                         "serve -s build"         5 weeks ago         Exited (255) 2 weeks ago   0.0.0.0:4001->4001/tcp                         clever_raman
> aead52418ba4        funding:1.0                         "serve -s build"         6 weeks ago         Exited (255) 2 weeks ago   0.0.0.0:4000->4000/tcp                         unruffled_volhard
> 92718679e367        blog:1.0                            "java -jar ./blog.jar"   6 weeks ago         Up 7 days                  0.0.0.0:24780->24780/tcp                       unruffled_goldwasser
>
> ____    _____      _      ____    _____
> <font color="#dd0000">START</font>
>
> Build your first network (BYFN) end-to-end test
>
> Channel name : mychannel
> Creating channel...
> + peer channel create -o orderer.example.com:7050 -c mychannel -f ./channel-artifacts/channel.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
> + res=0
> + set +x
>   2019-04-20 11:15:53.943 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
>   2019-04-20 11:15:53.988 UTC [cli.common] readBlock -> INFO 002 Received block: 0
>   ===================== Channel 'mychannel' created ===================== 
>
> Having all peers join the channel...
> + peer channel join -b mychannel.block
>   2019-04-20 11:15:54.064 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
>   2019-04-20 11:15:54.111 UTC [channelCmd] executeJoin -> INFO 002 Successfully submitted proposal to join channel
> + res=0
> + set +x
>   ===================== peer0.org1 joined channel 'mychannel' ===================== 
>
> + peer channel join -b mychannel.block
> + res=0
> + set +x
>   2019-04-20 11:15:57.189 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
>   2019-04-20 11:15:57.245 UTC [channelCmd] executeJoin -> INFO 002 Successfully submitted proposal to join channel
>   ===================== peer1.org1 joined channel 'mychannel' ===================== 
>
> + peer channel join -b mychannel.block
> + res=0
> + set +x
>   2019-04-20 11:16:00.323 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
>   2019-04-20 11:16:00.371 UTC [channelCmd] executeJoin -> INFO 002 Successfully submitted proposal to join channel
>   ===================== peer0.org2 joined channel 'mychannel' ===================== 
>
> + peer channel join -b mychannel.block
> + res=0
> + set +x
>   2019-04-20 11:16:03.482 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
>   2019-04-20 11:16:03.526 UTC [channelCmd] executeJoin -> INFO 002 Successfully submitted proposal to join channel
>   ===================== peer1.org2 joined channel 'mychannel' ===================== 
>
> Updating anchor peers for org1...
> + peer channel update -o orderer.example.com:7050 -c mychannel -f ./channel-artifacts/Org1MSPanchors.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
> + res=0
> + set +x
>   2019-04-20 11:16:06.608 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
>   2019-04-20 11:16:06.634 UTC [channelCmd] update -> INFO 002 Successfully submitted channel update
>   ===================== Anchor peers updated for org 'Org1MSP' on channel 'mychannel' ===================== 
>
> Updating anchor peers for org2...
> + peer channel update -o orderer.example.com:7050 -c mychannel -f ./channel-artifacts/Org2MSPanchors.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
> + res=0
> + set +x
>   2019-04-20 11:16:09.717 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
>   2019-04-20 11:16:09.742 UTC [channelCmd] update -> INFO 002 Successfully submitted channel update
>   ===================== Anchor peers updated for org 'Org2MSP' on channel 'mychannel' ===================== 
>
> Installing chaincode on peer0.org1...
> + peer chaincode install -n mycc -v 1.0 -l golang -p github.com/chaincode/chaincode_example02/go/
> + res=0
> + set +x
>   2019-04-20 11:16:12.839 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
>   2019-04-20 11:16:12.839 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc
>   2019-04-20 11:16:13.156 UTC [chaincodeCmd] install -> INFO 003 Installed remotely response:<status:200 payload:"OK" > 
>   ===================== Chaincode is installed on peer0.org1 ===================== 
>
> Install chaincode on peer0.org2...
> + peer chaincode install -n mycc -v 1.0 -l golang -p github.com/chaincode/chaincode_example02/go/
> + res=0
> + set +x
>   2019-04-20 11:16:13.270 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
>   2019-04-20 11:16:13.270 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc
>   2019-04-20 11:16:13.547 UTC [chaincodeCmd] install -> INFO 003 Installed remotely response:<status:200 payload:"OK" > 
>   ===================== Chaincode is installed on peer0.org2 ===================== 
>
> Instantiating chaincode on peer0.org2...
> + peer chaincode instantiate -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n mycc -l golang -v 1.0 -c '{"Args":["init","a","100","b","200"]}' -P 'AND ('\''Org1MSP.peer'\'','\''Org2MSP.peer'\'')'
> + res=0
> + set +x
>   2019-04-20 11:16:13.655 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
>   2019-04-20 11:16:13.656 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc
>   ===================== Chaincode is instantiated on peer0.org2 on channel 'mychannel' ===================== 
>
> Querying chaincode on peer0.org1...
> ===================== Querying on peer0.org1 on channel 'mychannel'... ===================== 
> Attempting to Query peer0.org1 ...3 secs
> + peer chaincode query -C mychannel -n mycc -c '{"Args":["query","a"]}'
> + res=0
> + set +x
>
> 100
> ===================== Query successful on peer0.org1 on channel 'mychannel' ===================== 
> Sending invoke transaction on peer0.org1 peer0.org2...
> + peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n mycc --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -c '{"Args":["invoke","a","b","10"]}'
> + res=0
> + set +x
>   2019-04-20 11:17:28.508 UTC [chaincodeCmd] chaincodeInvokeOrQuery -> INFO 001 Chaincode invoke successful. result: status:200 
>   ===================== Invoke transaction successful on peer0.org1 peer0.org2 on channel 'mychannel' ===================== 
>
> Installing chaincode on peer1.org2...
> + peer chaincode install -n mycc -v 1.0 -l golang -p github.com/chaincode/chaincode_example02/go/
> + res=0
> + set +x
>   2019-04-20 11:17:28.587 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
>   2019-04-20 11:17:28.587 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc
>   2019-04-20 11:17:28.830 UTC [chaincodeCmd] install -> INFO 003 Installed remotely response:<status:200 payload:"OK" > 
>   ===================== Chaincode is installed on peer1.org2 ===================== 
>
> Querying chaincode on peer1.org2...
> ===================== Querying on peer1.org2 on channel 'mychannel'... ===================== 
> Attempting to Query peer1.org2 ...3 secs
> + peer chaincode query -C mychannel -n mycc -c '{"Args":["query","a"]}'
> + res=0
> + set +x
>
> 90
> ===================== Query successful on peer1.org2 on channel 'mychannel' ===================== 
>
> ========= All GOOD, BYFN execution completed =========== 
>
> _____   _   _   ____
> _____   _   _   ____
> **<font color="#dd0000">END</font>**

1. You can use docker ps to look up the node condition

```shell
$ docker ps
```

2. Remember to stop the test network

```shell
$ ./byfn.sh down
```

> **Above all.You have installed Fabric successfully.**

