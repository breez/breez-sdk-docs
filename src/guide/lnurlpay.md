# Receiving payments using LNURL-Pay

Breez SDK users have the ability to receive Lightning payments using [LNURL-Pay](https://github.com/lnurl/luds/blob/luds/06.md).
LNURL-Pay requires a web service that serves LNURL-Pay requests. This service needs to communicate with the user node in order to fetch the necessary metadata data and the associated payment request.
To interact with the user node, the service uses a simple protocol over push notifications:
* The service sends a push notification to the user's mobile app with the LNURL-Pay request and a reply URL.
* The app responds to reply URL with the required data.
* The data is forwarded from the service to the payer.

## General workflow

### Step 1: the app registers for an LNURL-Pay service
Use the service endpoint https://app.domain/lnurlpay/[pubkey] to register the app for an LNURL-Pay service.
To verify the request the payload should be signed with the user node private key.
The service responds with a valid LNURL-Pay url, for example: https://app.domain/lnurlp/[pubkey]

### Step 2: External wallet scans the lnurlpay url
The external wallet scans the lnurlpay url and parse the lnurlpay request.
It then behaves according to the lnurlpay protocol and performs a GET request to https://app.domain.com/lnurlp/[pubkey].
The service then sends a push notification to the user node with the lnurlpay request and a callback url. Such payload may look like this:

<section>
<pre>
{
 "template": "lnurlpay_info",
 "data": {  
  "reply_url": https://app.domain.com/respond/<request_id>
  "callback_url": https://app.domain.com/lnurlpay/invoice
  }
}
</pre>
</section>

The reply_url is used by the user node to respond to the lnurlpay request.
The callback_url is the lnurlpay callback url for the payer to fetch the invoice.

### Step 3: User node responds to the callback url
The user node receives the push notification, parses the payload and then uses the reply_url to responds with the required data as per the lnurlpay protocol, for example:

<section>
<pre>
{
 "callback": "https://app.domain.com/lnurlpay/invoice",
 "maxSendable": 10000,
 "minSendable": 1000,
 "metadata": "[[\"text/plain\",\"Pay to Breez\"]]",
 "tag": "payRequest"
}
</pre>
</section>

The service receives the response from the mobile and forward the response to the external wallet.

### step 4: External wallet fetches the invoice

The external wallet uses the callback_url to fetch the invoice and perform a GET request with the amount as a parameter. In our example it is: https://app.domain.com/lnurlpay/invoice?amount=1000
The push notification is used again to send the request to the user node and the user node replies with the invoice.

### step 5: External wallet pays the invoice
This is the last step in the lnurlpay protocol, the external wallet pays the invoice and the payment is received by the user node. See [payment_notification](payment_notification.md) for more details on how to receive payments via push notifications.

## Reference implementation
All the above steps are payloads are one option among many, the service and the user node can agree on any other payload format.
For a complete reference, see how we implemented it in c-breez wallet: [NotificationService.swift](https://github.com/breez/c-breez/blob/main/ios/Breez%20Notification%20Service%20Extension/NotificationService.swift).
And the lnurlpay service: [breez-lnurl](https://github.com/breez/breez-lnurl)
