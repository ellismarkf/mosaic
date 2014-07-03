(function() {

  var BusinessLogic = function() {
    window.colors;

    $.get("/api/translated_js", function(data){
      colors = data;
    });
  };

  window.bl = new BusinessLogic();

})();