# Exchange Rate

## Installing

### Downloading the project

```
   $ git clone https://github.com/kossgreim/exchange.git
   $ cd exchange
   $ bundle install
```

# API Documentation

## Exchange rate

Send POST request to:

>http://app_address/v1/exchange

with body:

```json
{
	"exchange_request": {
		"from": "EUR",
		"amount": 20,
		"to": "SEK"
	}
}
```

#### When request was successful:

You'll receive:
- Status 200 OK
- User's JSON representation in the response's body

```json
  {
    "currency": "SEK",
    "result": "205.89"
  }
```

#### In case of error:

You'll receive:
- Status code
- Error JSON representation:

```json
  {
    "errors": ["error message"]
  }
```