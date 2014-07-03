(function() {
  $('input').on('keyup', function() {
    var input = $(this).val();
    renderAll(input);
  });

  var renderAll = function(string) {
    // make string array
    // for loop through array
      // pass each letter to renderSqaure(letter)
  };
  var renderSquare = function(letter) {
    // determin color from window.colors based on letter
    var newHTML = "<span style='background" + colorHex+ "'></span>"
  };




})();