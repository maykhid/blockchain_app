# BlockChainApp (Task)

# An Assessment Project.
Flutter Application Development for Transaction Listing

Watch the a Demo. https://drive.google.com/file/d/1FBkYoFzNCgnJaVQy1YNTEX4I2sWHqCZp/view?usp=sharing

<a href="https://drive.google.com/file/d/1cpx2onOGfPX2f_q1Y3QaP8meuVhtNHZo/view?usp=drive_link"><img src="https://playerzon.com/asset/download.png" width="200"></img></a>


## ✨✨ Features
* User authentication (Just client-side implementation for easy testing).
* Latest Transactions on BlockChain.
* Clean and intuitive UI with a focus on user experience.
* Tests.

## 🛠 Essential Plugins / Packages Used
- Bloc (State Management) 
- Get-It (Dependency Injection)
- Hive (Local storage)
- HTTP-Interceptor
- Mockito (Test)


## 🦾 Getting Started
You have to have Flutter installed on your machine. To run this project clone this repository. Launch your favorite Flutter IDE and run `flutter pub get` and `dart run build_runner build` (This assumes you already have Flutter installed in your machine). I am currently running `Flutter version, 3.19.4` with `Dart version 3.3.2` on local machine. 

## 📖 Brief
This project involves creating a Flutter application that interacts with blockchain APIs to display transactions from the latest block. The application requires user authentication and involves several key features and pages.

## 🛠 Technical Note
The app connects to both (https://blockchain.info/rawblock/$block_hash and https://api.tzkt.io/#tag/Blocks) to get all tansactions in the block for both BTC and Tezos transactions respsectively.

For the BTC transactions we call https://blockchain.info/latestblock to get us the latest block hash then we proceed to call https://blockchain.info/rawblock/$block_hash with the given blockhash to get the latest BTC block transaction. This particular request can take a long time to process because of the large data it tries to pull, so I cache the response but fetch new data every 15 minutes for better user experience.
For the Tezos transactions we call https://api.tzkt.io/v1/blocks to fetch all blocks.
