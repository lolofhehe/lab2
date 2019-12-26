$(document).ready(function () {
    $('input[name="X r"]').change(function () {
        $(this).prop("checked", true);
        $("#X_field").val($(this).val());
    });

    $("#main-form").on("submit", function () {
        let text = $("#Ytextfield").val().substr(0, 16);
        if (text === "" || isNaN(text) || +text <= -5 || +text >= 3) {
            $("#message").html("Введите корректное значение Y.");
            return false;
        }

        text = $("#Rtextfield").val().substr(0, 16);
        if (text === "" || isNaN(text) || +text <= 1 || +text >= 4) {
            $("#message").html("Введите корректное значение R.");
            return false;
        } else radius = text;

        return true;
    });

    $("#timer").html("Текущее время: " + new Date().toLocaleString());
    setInterval(() => {
        $("#timer").html("Текущее время: " + new Date().toLocaleString());
    }, 1000);

    let historyR = [];
    $(".history-r").each(function () {
        historyR.push(+$(this).text().substring(0, 15))
    });

    paint(historyR[historyR.length - 1]);
});
