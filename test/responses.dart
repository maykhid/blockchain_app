final testRawblockResponse = {
  'hash': '0000000000000000000b4d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e',
  'ver': 1,
  'prev_block': '0000000000000000000a4d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0',
  'mrkl_root': '4d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e',
  'time': 1625097600,
  'bits': 403014710,
  'next_block': [
    '0000000000000000000c4d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0',
  ],
  'fee': 5000,
  'nonce': 2083236893,
  'n_tx': 10,
  'size': 123456,
  'block_index': 1000000,
  'main_chain': true,
  'height': 680000,
  'weight': 4000000,
  'tx': [
    {
      'hash': '4e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0',
      'ver': 1,
      'vin_sz': 2,
      'vout_sz': 2,
      'size': 250,
      'weight': 1000,
      'fee': 5000,
      'relayed_by': '0.0.0.0',
      'lock_time': 0,
      'tx_index': 1,
      'double_spend': false,
      'time': 1625097600,
      'block_index': 1000000,
      'block_height': 680000,
      'inputs': [
        {
          'sequence': 4294967295,
          'witness': '',
          'script':
              '483045022100f3b7b153d5eab7317f6ea0b93f9573b6d3a1c6d6f6cf7f4f3105a7dbbbf5aa802202e59b8b499a64e5b8f4df2c23f27e5e30357a5a0e12c30b8c6e0d23427c014b30121034e8d6e89b4f70c37389fa5e1f1d8a28b8d687f6f9c3e4b0b48e4f4c2a7f0b3b2',
          'index': 0,
          'prev_out': {
            'type': 0,
            'spent': true,
            'value': 5000000000,
            'spending_outpoints': [
              {
                'tx_index': 1,
                'n': 0,
              }
            ],
            'n': 0,
            'tx_index': 1,
            'script': '76a91488ac',
            'addr': '1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa',
          },
        }
      ],
      'out': [
        {
          'type': 0,
          'spent': false,
          'value': 4999995000,
          'spending_outpoints': [],
          'n': 0,
          'tx_index': 1,
          'script': '76a91488ac',
          'addr': '1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa',
        }
      ],
    }
  ],
};

final testLatestBlockResponse = {
  'hash': '0000000000000000000b4d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e',
  'time': 1624164176,
  'block_index': 693126,
  'height': 693126,
  'txIndexes': [123456, 234567, 345678],
};
