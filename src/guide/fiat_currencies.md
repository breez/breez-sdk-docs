# Supporting fiat currencies

<custom-tabs category="lang">
<div slot="title">python</div>
<section>


In order to list the availiable fiat currencies.
```python
try: 
    fiat_currencies = sdk_services.list_fiat_currencies()

except Exception as error:
    #Handle error
```

To get the current btc rate for the currencies.

```python
try:
    fiat_rates = sdk_services.sdk_services.fetch_fiat_rates()
    # print your desired rate 
except Exception as error:
    # Handle error

```

</section>