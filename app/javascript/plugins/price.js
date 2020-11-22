const price = () => {
  const priceBox = document.querySelector('.price')
  if (priceBox) {
    const inputs = document.querySelectorAll('input')
    const priceRoom = priceBox.dataset.price;
    const startInput = document.querySelector('#range_start');
    const endInput = document.querySelector('#range_end');
    const numberInput = document.querySelector("#booking_number");
    inputs.forEach(input => {
      input.addEventListener('change', () => {
        priceBox.innerText = "" 
        const priceDisplay = ((new Date(endInput.value) - new Date(startInput.value)) / 86400000) * priceRoom * numberInput.value;
        if (!isNaN(priceDisplay)) {
          priceBox.insertAdjacentText('beforeend', priceDisplay)
        }
      });
    })
  }
}

export { price }