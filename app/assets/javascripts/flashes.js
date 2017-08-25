document.addEventListener('turbolinks:load', function() {
  if($(".alert-info").length > 0) {
    setTimeout(function(){
      $('.alert-info').alert('close');
    }, 6000);
  };
});
