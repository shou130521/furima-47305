const pay = () => {
  const form = document.getElementById("charge-form")

  if (form === null) {
    return
  }
  
  const publickey = gon.public_key
  const payjp = Payjp(publickey)

  const elements = payjp.elements()

  const numberElement = elements.create('cardNumber')
  const expiryElement = elements.create('cardExpiry')
  const cvcElement = elements.create('cardCvc')

  numberElement.mount('#number-form')
  expiryElement.mount('#expiry-form')
  cvcElement.mount('#cvc-form')

  form.addEventListener("submit", (e) => {
    e.preventDefault()

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        alert("カード情報が正しくありません")
      } else {
        const token = response.id

        document.getElementById("token").value = token

        form.submit()
      }
    })
  })
}

window.addEventListener("turbo:load", pay)