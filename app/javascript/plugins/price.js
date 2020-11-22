const price = () => {
  const priceBox = document.querySelector('.price')
  if (priceBox) {
    const priceRoom = priceBox.dataset.price;
    const startInput = document.querySelector('#range_start');
    const endInput = document.querySelector('#range_end');
    startInput.addEventListener('change', () => {
      priceBox.innerText = ""
      const priceDisplay = ((new Date(endInput.value) - new Date(startInput.value)) / 86400000) * priceRoom;
      if (!isNaN(priceDisplay)) {
        console.log('coucou')
        priceBox.insertAdjacentText('beforeend', priceDisplay)
      }
    });
  }
}

export { price }