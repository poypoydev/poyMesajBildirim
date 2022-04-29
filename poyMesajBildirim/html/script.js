addEventListener('message', function (event) {
    var poy = event.data
    if (poy.type == 'close') {
        $('.maincon').fadeOut();
    } else if (poy.type == 'update') {
        $('.amount').html(poy.amount)
    } else if (poy.type == 'open'){
        $.post("https://poyMesajBildirim/open", JSON.stringify({}), function(cbData){
            $('.amount').html(cbData)
        });
        $('.maincon').fadeIn();
    }
});