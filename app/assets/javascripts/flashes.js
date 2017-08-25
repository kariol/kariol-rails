document.addEventListener('turbolinks:load', function() {
  var alert_info = $('.alert-info');
  if (alert_info) {
    setTimeout(function(){
      alert_info.alert('close');
    }, 6000);
  };
});
