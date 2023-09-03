# Crypto App

Cryptocurrency Flutter application that displays the price of cryptocoins in real time, and also builds a price chart for analysis


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

##### **List of the most popular coins in 24 hours**
![App Screenshot](\assets\coins_list.png)


##### **Coin details page**
###### This page contains a price chart that starts from the current moment, the current price, the percentage of price change, as well as the maximum and minimum prices.
![App Screenshot](\assets\coin_price_chart.png)