var ready;
ready = function () {

    $("#categoria").autocomplete({
        source: "/categorias",
        minLength: 2
    });

    $(".pesquisa-produtos").on("keyup", function () {

        pesquisarProdutos();
    });

    $("#selecione-uma-categoria-select").on("change", function () {

        pesquisarProdutos();
    });

    $("#selecione-uma-categoria").on("click", function () {

        $(".opcoes").hide();
        $(".selecione-uma-categoria").show("fast");

        $.ajax({
            url: "/categorias/listar_todas",
            success: function (data) {
                $("#selecione-uma-categoria-select").append(data);
            }
        });
    });

    $(".dar-nota").on("click", function () {

        $(this).hide();
        $("#combo-notas").show();
    });

    $("#combo-notas").on("change", function () {

        $.ajax({
            url: "/produtos/dar_nota",
            data: {
                nota: $("#combo-notas").val(),
                id_produto: $("#id_produto").val()
            }
        });
    });

    $('#form-comentar').on('ajax:success', function(event, xhr, status) {
        $("#comentarios").prepend(xhr) ;
        $("#campo_comentario").val("");
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);


function pesquisarProdutos() {

    if ($(".nao-encontrou-o-que-procura").css("display") == 'none') {

        $(".logo-aqui").css('position', 'absolute');
        $(".logo-aqui").animate({'width': '100px', 'top': '10px', 'right': '10px'}, "fast");
        $(".pesquisa-produtos-container").animate({'margin-top': '-50px'}, 'fast');
        $(".nao-encontrou-o-que-procura").show();
    }

    $.ajax({
        url: "/produtos/pesquisar",
        data: $("#form-pesquisa-produtos").serializeArray(),
        success: function (data) {
            $(".produtos-pesquisados").empty();
            $(".produtos-pesquisados").append(data);
        }
    });

}