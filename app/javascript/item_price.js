
window.addEventListener('input', () => {
  const priceInput = document.getElementById("item-price");
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = document.getElementById("add-tax-price")
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

   const profitNumber = document.getElementById("profit")
   const value_result = inputValue * 0.1
   console.log(value_result)
   profitNumber.innerHTML = (Math.floor(inputValue - value_result));
});