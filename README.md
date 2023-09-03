# Crypto App

Cryptocurrency Flutter application that displays the price of crypto coins in real time, and also builds a price chart for analysis


## Libraries
- [bloc] - An implementation of the BLoC pattern which helps implement the business logic layer of an application
- [flutter_bloc] - Flutter Widgets that make it easy to integrate blocs into Flutter
- [freezed] - Model Generation
- [dio] - Networking
- [web_socket_channel] - Get real time data
- [fl_chart] - Plotting the dependence of the cryptocurrency price on time
- [go_router] - Working with navigation


## API References

### [CryptoCompare](https://min-api.cryptocompare.com)


###### Get Coin Top List 24H
```sh
  GET https://min-api.cryptocompare.com/data/top/totalvolfull?limit=25&tsym=USD
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `limit` | `int`      | The number of coins to return in the toplist, default 10, min 10,<br>max 100 will round to steps of 10 coins [ Min - 1] [ Max - 100] [ Default - 10] |
| `tsym` | `string` | **Required**. The currency symbol to convert into [ Min length - 1] [ Max length - 30]|


### [CoinBase](https://docs.cloud.coinbase.com)

##### Ticker Batch Channel Request
```json
{
    "type": "subscribe",
    "product_ids": [
        "ETH-USD",
        "BTC-USD"
    ],
    "channels": ["ticker_batch"]
}
```


## Screenshots

#### **List of the most popular coins in 24 hours**
<div align="center"> <img src="https://github.com/IBKnight/crypto-app/blob/master/assets/coins_list.png" height="480" alt="App Screenshot"> </div>


#### **Coin details page**
##### This page contains a price chart that starts from the current moment, the current price, the percentage of price change, as well as the maximum and minimum prices.
<div align="center"> <img src="https://github.com/IBKnight/crypto-app/blob/master/assets/coin_price_chart.png" height="480" alt="App Screenshot" align="center"> </div>