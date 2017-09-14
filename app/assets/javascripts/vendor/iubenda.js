document.addEventListener('turbolinks:load', function() {
  if (document.querySelector(".pages.legal")) {
    (function (w,d) {
      var loader = function () {
        var s = d.createElement("script"), tag = d.getElementsByTagName("script")[0];
        s.src = "//cdn.iubenda.com/iubenda.js";
        tag.parentNode.insertBefore(s,tag);
      };
      if(w.addEventListener){
        w.addEventListener("turbolinks:load", loader, false);
      }else if(w.attachEvent){
        w.attachEvent("onload", loader);
      }else{
        w.onload = loader;
      }
    })(window, document);
  };
});
