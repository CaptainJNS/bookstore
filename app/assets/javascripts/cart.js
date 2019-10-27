"use strict";

let addToCart = () => {
  let cart = document.getElementById("cart");
  cart.textContent++;
}

let decrementItemQuantity = (price, id) => {
  let input = document.getElementById("quantity_input"+id);

  if (input.value > 1) {
    input.value--;
    calculateItemPrice(price, input.value, id);
  }

}

let incrementItemQuantity = (price, quantity, id) => {
  let input = document.getElementById("quantity_input"+id);

  if (input.value < quantity) {
    input.value++;
    calculateItemPrice(price, input.value, id);
  }
}

let calculateItemPrice = (price, input, id) => {
  let price_element = document.getElementById("subPrice"+id);
  let currency = price_element.textContent.substring(0, 1);

  price_element.textContent = currency + price * input;
}

let deleteItem = (id) => {
  let item = document.getElementById("order-item-"+id);

  item.remove();
  removeFromCart();
}

let removeFromCart = () => {
  let cart = document.getElementById("cart");
  cart.textContent--;
}
