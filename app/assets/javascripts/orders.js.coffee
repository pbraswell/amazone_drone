# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

    ## Page initialization
    $("#new_order").submit (event) ->
    	event.preventDefault()
    	if navigator.geolocation
    		navigator.geolocation.getCurrentPosition ((position) ->
            # alert('found lat and long! : ' + position.coords.latitude + '-' + position.coords.longitude )
            $('#lz-button').addClass('disabled')
            order_submission position
            ),
            ->
            	alert('something went wrong getting your location.  Please try reloading the page and resubmitting your request')
            ,
            {enableHighAccuracy: true}
    	else
    	  alert('your browser does not support HTML5 Geolocation!')

    $('#thank-you').hide()

    landing_zone_map = (position) ->
        handler = Gmaps.build('Google')
        handler.buildMap
          provider: {
            mapTypeId: google.maps.MapTypeId.HYBRID
          }
          internal:
            id: "map"
        , ->
          markers = handler.addMarkers([
            lat: position.coords.latitude
            lng: position.coords.longitude
            picture:
                url: "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png"
                width: 56
                height: 56

            infowindow: "Landing Zone"
          ])
          handler.bounds.extendWith markers
          handler.fitMapToBounds()

    ## Page functions
    order_submission = (position) ->
    	$.ajax
          type: "POST"
          url: "/orders?name=#{$('#order_name').val()}&product_id=#{$('#order_product_id').attr('value')}&longitude=#{position.coords.longitude}&latitude=#{position.coords.latitude}"
          contentType: "application/json; charset=utf-8"
          dataType: "json"
          success: (data, textStatus, xhr) ->
            console.log "Request result :" + textStatus
            console.log "Data :" + data
            landing_zone_map position
            $('#thank-you').show()
