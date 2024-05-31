# BlockChainApp (Task)

# An Assessment Project.
Flutter Application Development for Transaction Listing

You can watch a Demo. https://drive.google.com/file/d/1FBkYoFzNCgnJaVQy1YNTEX4I2sWHqCZp/view?usp=sharing

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
You have to have Flutter installed on your machine. To run this project clone this repository. Launch your favourite Flutter IDE and run on your terminal `flutter pub get` and `dart run build_runner build` (This assumes you already have Flutter installed on your machine). I am running `Flutter version, 3.19.4` with `Dart version 3.3.2` on my local machine. 

## 📖 Brief
This project involves creating a Flutter application that interacts with blockchain APIs to display transactions from the latest block. The application requires user authentication and involves several key features and pages.

**Note: To log on to the application any valid email and password would grant you access (a valid password is any alpha-numeric string with 7 - 8 characters). The app does not store any user information.**

## 🛠 Technical Note
The app connects to both (https://blockchain.info/rawblock/$block_hash and https://api.tzkt.io/#tag/Blocks) to get all transactions in the block for both BTC and Tezos transactions respectively.

For the BTC transactions I call https://blockchain.info/latestblock to get us the latest block hash then proceed to call https://blockchain.info/rawblock/$block_hash with the given blockhash to get the latest BTC block transaction. This particular request can take a long time to process because of the large data it tries to pull, so I cache the response, 15 minutes after the request you can fetch/pull new data this gives a better user experience.
For the Tezos transactions, we call https://api.tzkt.io/v1/blocks to fetch all blocks.
