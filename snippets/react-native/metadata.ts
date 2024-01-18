import { setPaymentMetadata, listPayments } from '@breeztech/react-native-breez-sdk'

const setPaymentMetadata = async () => {
  // ANCHOR: set-payment-metadata
  await setPaymentMetadata('target-payment-hash', `{"myCustomValue":true}`)
  // ANCHOR_END: set-payment-metadata
}

const filterPaymentMetadata = async () => {
  // ANCHOR: filter-payment-metadata
  let metadataFilters = [
    {
      jsonPath: "myCustomValue",
      jsonValue: "true"
    }
  ]

  try {
    await listPayments({
      metadataFilters
    })
  } catch(err) {
    // handle error
  }
  // ANCHOR_END: filter-payment-metadata
}

const filterPaymentMetadataString = async () => {
  // ANCHOR: filter-payment-metadata-string
  // Note: These are equivalent
  const metadataFilters = [
    {
      jsonPath: "customerName",
      jsonValue: "Satoshi Nakamoto",
    },
    {
      jsonPath: "customerName",
      jsonValue: JSON.stringify("Satoshi Nakamoto"),
    },
  ]
  // ANCHOR_END: filter-payment-metadata-string
}

const filterPaymentMetadataObject = async () => {
  // ANCHOR: filter-payment-metadata-object
  // This will *NOT* work
  const _metadataFilters = [
    {
      jsonPath: "parent.nestedArray",
      jsonValue: "[1, 2, 3]",
    },
  ]

  // This will work
  const metadataFilters = [
    {
      jsonPath: "parent.nestedArray",
      jsonValue: "[1,2,3]",
    },
    {
      jsonPath: "parent.nestedArray",
      jsonValue: JSON.stringify([1, 2, 3]),
    },
  ]
  // ANCHOR_END: filter-payment-metadata-object
}
