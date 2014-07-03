
// SIDEBAR EVENT LISTENTERS
    $(document).ready(function() {

      // adjust the height of the sidebar
      var windowh = +$(document).height();
      $('aside').css("height", windowh);
      $(window).on('resize', function() {
        windowh = +$(window).height() - 20;
        $('aside').css("height", windowh);
      });

      // hide and close the sidebar
      $('aside .close').on('click', function(event) {
        event.preventDefault();
        $('aside').hide();
        $('.aside-open').show();
      });

      $('.aside-open').on('click', function(event) {
        event.preventDefault();
        $('.aside-open').hide();
        $('aside').show();
      });

      // add repo event listeners on sidebar
      //
      // Listen for click on add repo button
      // to hide and show the add repot input and style button
      $('aside .add-repo').on('click', function() {
        if ($('.add-repo-input-wrap').hasClass('tuckedaway')) {
          // Showing the add repo input box ...
          $('.add-repo-input-wrap').show().addClass('readytogo').removeClass('tuckedaway');
          $('aside .add-repo').html('<i class="fa fa-minus-circle"></i>');
        } else {
          // Hiding the add repo input box ...
          $('.add-repo-input-wrap').hide().addClass('tuckedaway').removeClass('readytogo');
          $('aside .add-repo').html('<i class="fa fa-plus-circle"></i>');
        }
      });

      // Listener for the enter key on the input repo box
      // should run a script to add the new repo to the page
      // maybe run create page again right after the new repo
      // is added to the repos list json file
      $('aside #add-repo').on('keypress', function(event) {
        switch (event.which) {
        case 13:
          var inputText = $(this).val();
          var inputArray = inputText.split("/", 2);
          // put REGEX validation if input array not formatted properly as array
          // make sure it matches a reges for the patter "string/string"
          // then break here
          var username = inputArray[0];
          var repo = inputArray[1];
          var url = "https://api.github.com/repos/" + username + "/" + repo + "/commits";
          window.repos.push({ user: username , repo: repo });
          createPage();
          $(this).val(''); // clear the input
          break;
        case 191:
          return "/";
        }
      }).on('blur', function() {
        $(this).val('');
      });
