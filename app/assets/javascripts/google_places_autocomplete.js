document.addEventListener('turbolinks:load', function() {
  autocomplete($('.banner-form #commute_request_origin_attributes_complete'));
  autocomplete($('.cta-form #commute_request_origin_attributes_complete'));
  autocomplete($('.banner-form #commute_request_destination_attributes_complete'));
  autocomplete($('.cta-form #commute_request_destination_attributes_complete'));

  autocomplete($('#business_request_address_attributes_complete'));
});

function autocomplete(element) {
  var addressInput = element.get(0);

  if (addressInput) {
    var autocomplete = new google.maps.places.Autocomplete(addressInput, {
      componentRestrictions: {country: 'fr'} });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(addressInput, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault();
      }
    });
  };
};

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
};
