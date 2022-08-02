function price() {
  const itemPrice = document.getElementById("item-price")
  const outputTax = document.getElementById("add-tax-price")
  const outputProfit = document.getElementById("profit")
  itemPrice.addEventListener('input', () => {
    const inputPrice = itemPrice.value;
    outputTax.innerHTML = Math.floor(inputPrice * 0.1).toLocaleString()
    outputProfit.innerHTML = Math.floor(inputPrice * 0.9).toLocaleString()
  })
}
  window.addEventListener('load', price)