// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

window.addEventListener("load", ()=>{

  const priceInput = document.getElementById("price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.Value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
      console.log(addTaxDom);

      const profitNumber = document.getElementById("profit")
        const value_result = innerValue * 0.1
        console.log(value_result)
        profitNumber.innerHTML = (Math.floor(inputValue - value_result));
        console.log(profitNumber);
  })
})