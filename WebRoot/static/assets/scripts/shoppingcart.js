function addShoppingCart(goodsId) {
	var count = $("#product-quantity" + goodsId).val();
	$.post("/shop/shoppingcart/add.json", {
		'goodsId' : goodsId,
		'count' : count
	}, function(data) {
		if (data.result) {
			$('.btn' + goodsId).popover('show');
			updateCart(data.msg);
		} else {

		}
	});
}

function deleteShoppingCart(id) {
	$.post("/shop/shoppingcart/delete.json", {
		'id' : id
	}, function(data) {
		if (data.result) {
			updateCart(data.msg);
		} else {

		}
	});
}

function updateShoppingCart() {
	$.post("/shop/shoppingcart/update.json", {
	}, function(data) {
		if (data.result) {
			updateCart(data.msg);
		} else {

		}
	});
}

function updateCart(msg) {
	$(".cart-block").html(msg);
}