(function ($) {
    "use strict";
    var fn = {
        // Funcionalidades
        Iniciar: function () {
            fn.App();
        },
        App : function () {
            // admin functions
            alert('aqui na admin');
        }
    }
    $(document).ready(function () {
        fn.Iniciar();
    });
})(jQuery);