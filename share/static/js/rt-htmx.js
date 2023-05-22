
jQuery(function() {
    htmx.onLoad(function(e) {
        // Refresh any dropdowns after they are loaded by turbo
        jQuery('.selectpicker').selectpicker('refresh');
    });
});
