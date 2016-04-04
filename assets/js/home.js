(function ($) {
    "use strict";
    var fn = {
        // Funcionalidades
        Iniciar: function () {
        	fn.App();
        },
        App : function () {
        	alert('aqui na home');
        }
	}
    $(document).ready(function () {
        fn.Iniciar();
    });
})(jQuery);