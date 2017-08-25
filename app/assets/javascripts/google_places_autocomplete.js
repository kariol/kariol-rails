document.addEventListener('turbolinks:load', function() {
  var commute_request_origin = $('#commute_request_origin_attributes_complete').get(0);

  if (commute_request_origin) {
    var autocomplete = new google.maps.places.Autocomplete(commute_request_origin, {
      componentRestrictions: {country: 'fr'} });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(commute_request_origin, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }

  var commute_request_destination = $('#commute_request_destination_attributes_complete').get(0);

  if (commute_request_destination) {
    var autocomplete = new google.maps.places.Autocomplete(commute_request_destination, {
      componentRestrictions: {country: 'fr'} });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(commute_request_destination, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

function onPlaceChanged() {
  var place = this.getPlace();
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {  // Some types are ["country", "political"]
      var type = document.getElementById(component.types[j]);
      if (type) {
        type.value = component.long_name;
      }
    }
  }
}
