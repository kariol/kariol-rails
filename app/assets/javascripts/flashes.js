$(document).ready(function() {
  const flashNotice = $('#flashNotice');
  if (flashNotice.length) {
    setTimeout(function(){
      flashNotice.alert('close');
    }, 6000);
  };
});
