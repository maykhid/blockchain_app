const String blockchainBaseUrl = 'https://blockchain.info/';
const String tezosBaseUrl = 'https://api.tzkt.io/v1/';

const String blockchainLatestBlockPath = 'latestblock';
String blockchainRawBlockPath(String blockHash) => 'rawblock/$blockHash';

const String tezosBlockPath = 'blocks';
//  String getTezosBlockPath(String blockHash) => '$tezosBlockPath/$blockHash';
