$(function() {

  var search_list = $(".top-products");

  function appendProduct(product) {
    var html = `
    <a href="products/${product.id}"> 
      <div class="top-products__box">
    <img src = "${product.image.url}" , class="image-box">
    <div class="top-products__under">
      ${product.title}
    </div>
  </div>
  </a>
`
    search_list.append(html);
  }
  function appendErrMsgToHTML(msg) {
    var html = `<li>
                  <div class='top-products__box'>${ msg }</div>
                </li>`
                search_list.append(html);
  }
  $("#search.form-control").on("keyup", function() {
    var input = $("#search.form-control").val();

    $.ajax({
      type: 'GET',
      url: '/products/search',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(products) {
      $(".top-products").empty();
      if (products.length !== 0) {
        products.forEach(function(product){
          appendProduct(product);
        });
      }
      else {
        appendErrMsgToHTML("一致する作品はありません");
      }
    })
    .fail(function() {
      alert("検索に失敗しました");
    })
  });
});