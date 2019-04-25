#! /bin/bash
echo "Start pull fabricv1.4.1 images"
/usr/bin/docker pull hyperledger/fabric-ca:1.4.1
/usr/bin/docker pull hyperledger/fabric-tools:1.4.1
/usr/bin/docker pull hyperledger/fabric-ccenv:1.4.1
/usr/bin/docker pull hyperledger/fabric-orderer:1.4.1
/usr/bin/docker pull hyperledger/fabric-peer:1.4.1
/usr/bin/docker pull hyperledger/fabric-javaenv:1.4.1
/usr/bin/docker pull hyperledger/fabric-zookeeper:0.4.15
/usr/bin/docker pull hyperledger/fabric-kafka:0.4.15
/usr/bin/docker pull hyperledger/fabric-couchdb:0.4.15
/usr/bin/docker pull hyperledger/fabric-baseos:amd64-0.4.15
echo "Over"