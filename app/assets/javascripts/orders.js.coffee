# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

    $("#new_order").submit (event) ->
    	event.preventDefault()

    	if navigator.geolocation
    		navigator.geolocation.getCurrentPosition ((position) ->
            # alert('found lat and long! : ' + position.coords.latitude + '-' + position.coords.longitude )
            $.ajax
              type: "POST"
              url: "/orders?product_id=#{$('#order_product_id').attr('value')}&longitude=#{position.coords.longitude}&latitude=#{position.coords.latitude}"
              contentType: "application/json; charset=utf-8"
              dataType: "json"
              success: (data, textStatus, xhr) ->
              	console.log "Request result :" + textStatus
              	console.log "Data :" + data
            ),
            ->
            	alert('something went wrong getting your location')
            ,
            {enableHighAccuracy: true}
    	else
    	  alert('your browser does not support HTML5 Geolocation!')