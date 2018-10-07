//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require lazyload

$(document).on('turbolinks:load', function () {
    $("img").lazyload({
        effect : "fadeIn"
    });
});