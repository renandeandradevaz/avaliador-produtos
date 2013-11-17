$(document).ready(function () {

    $("#categoria").autocomplete({
        source: "/categorias",
        minLength: 2
    });
});

