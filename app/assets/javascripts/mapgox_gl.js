$(document).ready(function() {
  if (document.querySelector('.pages.business')) {
    mapboxgl.accessToken = 'pk.eyJ1IjoicGFkYW1pbyIsImEiOiJjajE1MHpvaDgwMDBxMnFuNW16cjFwZXNhIn0.SrEc4qX1z94maLdY-XisZQ';
    var map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/padamio/cj15101qx002d2smfqddmvtdx',
      center: [2.019,48.793],
      zoom: 10,
      scrollZoom: false
    });

    map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      country: 'FR',
      placeholder: 'Recherche'
    }));
  };
});
