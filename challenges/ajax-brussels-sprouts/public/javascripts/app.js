$('#get-dish').on('click', (event) => {
  event.preventDefault();

  let request = $.ajax({
    method: "GET",
    url: "/dishes/random.json"
  });

  request.done((alertDish) => {
    alert(alertDish["dish"]);
  });

});
