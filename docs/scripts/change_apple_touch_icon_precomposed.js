var $icon = document.querySelector('link[rel="apple-touch-icon-precomposed"]');

gitbook.events.bind("page.change", function() {
    var images_folder = getCorrectImagesFolder();
    $icon.href = images_folder + "apple-touch-icon.jpg";
});