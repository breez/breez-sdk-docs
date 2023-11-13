import {
  InputTypeVariant,
  parseInput,
  payLnurl
} from '@breeztech/react-native-breez-sdk'

const exampleLnurlPay = async () => {
  // ANCHOR: lnurl-pay
  // Endpoint can also be of the
  // lnurlp://domain.com/lnurl-pay?key=val
  // lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
  const lnurlPayUrl = 'lightning@address.com'

  const input = await parseInput(lnurlPayUrl)
  if (input.type === InputTypeVariant.LN_URL_PAY) {
    const amountMsat = input.data.minSendable
    const lnUrlPayResult = await payLnurl({
      data: input.data,
      amountMsat,
      comment: 'comment'
    })
  }
  // ANCHOR_END: lnurl-pay
}
