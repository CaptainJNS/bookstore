"use strict";

let decrementQuantity = (price) => {
  let input = document.getElementById("quantity_input");

  if (input.value > 1) {
    input.value--;
    calculatePrice(price, input.value);
  }

}

let incrementQuantity = (price, quantity) => {
  let input = document.getElementById("quantity_input");

  if (input.value < quantity) {
    input.value++;
    calculatePrice(price, input.value);
  }
}

let calculatePrice = (price, input) => {
  let price_element = document.getElementById("price");
  let currency = price_element.textContent.substring(0, 1);

  price_element.textContent = currency + price * input;
}