document.addEventListener('turbolinks:load', function() {
  autocompleteCommuteRequestOrigin()
  autocompleteCommuteRequestDestination()
  autocompleteBusinessRequestAddress();
});

function autocompleteCommuteRequestOrigin() {
  var commute_request_origin = $('#commute_request_origin_attributes_complete').get(0);

  if (commute_request_origin) {
    var autocomplete = new google.maps.places.Autocomplete(commute_request_origin, {
      componentRestrictions: {country: 'fr'} });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(commute_request_origin, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault();
      }
    });
  };
};

function autocompleteCommuteRequestDestination() {
  var commute_request_destination = $('#commute_request_destination_attributes_complete').get(0);

  if (commute_request_destination) {
    var autocomplete = new google.maps.places.Autocomplete(commute_request_destination, {
      componentRestrictions: {country: 'fr'} });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(commute_request_destination, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault();
      }
    });
  };
};

function autocompleteBusinessRequestAddress() {
  var business_request_address = $('#business_request_address_attributes_complete').get(0);

  if (business_request_address) {
    var autocomplete = new google.maps.places.Autocomplete(business_request_address, {
      componentRestrictions: {country: 'fr'} });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(business_request_address, 'keydown', function(e) {
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
