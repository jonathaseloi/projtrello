// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
$("selectpicker").change(function(){
	alert("The text has been changed.");
	$('#column_list a').parent().html("<%= j render 'show', board: @board%>")
});