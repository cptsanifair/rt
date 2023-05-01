jQuery(function() {
    jQuery(document).on('turbo:render', function(e) {
        // Refresh any dropdowns after they are loaded by turbo
        jQuery('.selectpicker').selectpicker('refresh');
    });
    jQuery(document).on('turbo:frame-render', function(e) {
        // Refresh any dropdowns after they are loaded by turbo
        jQuery('.selectpicker').selectpicker('refresh');
    });
});
