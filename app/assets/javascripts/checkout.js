$(document).on('turbolinks:load', function() {
  $("input[name='user[orders][use_billing]'").click(function() {
    hide_shipping(this)
  });
});

document.addEventListener('DOMContentLoaded', function() {
  let check_box = document.getElementsByName("user[orders][use_billing]")
  hide_shipping(check_box)
}, false);

let hide_shipping = (chek_box) => {
  $('#shipping').prop('hidden', $(chek_box).is(':checked'))
  $("input[name='user[shipping_attributes][first_name]'").prop('required', !$(chek_box).is(':checked'))
  $("input[name='user[shipping_attributes][last_name]'").prop('required', !$(chek_box).is(':checked'))
  $("input[name='user[shipping_attributes][address]'").prop('required', !$(chek_box).is(':checked'))
  $("input[name='user[shipping_attributes][city]'").prop('required', !$(chek_box).is(':checked'))
  $("input[name='user[shipping_attributes][zip]'").prop('required', !$(chek_box).is(':checked'))
  $("input[name='user[shipping_attributes][country]'").prop('required', !$(chek_box).is(':checked'))
  $("input[name='user[shipping_attributes][phone]'").prop('required', !$(chek_box).is(':checked'))
}

let changeTotal = (total, price, old_price) => {
  let order_total_element = document.getElementById('order_total');
  let currency = order_total_element.textContent.substring(0, 1);
  if (old_price == null) { old_price = 0 }
  order_total_element.textContent = currency + (total + price - old_price).toFixed(2);
}

document.addEventListener('DOMContentLoaded', function() {
  $(".deliveries > tr").first().click();
  $(".radio-input").first().prop('checked', true);
}, false);
