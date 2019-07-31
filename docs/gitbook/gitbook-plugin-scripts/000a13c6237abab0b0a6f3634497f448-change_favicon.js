function changeFavicon(link) {
  var $favicon = document.querySelector('link[rel="shortcut icon"]');

  // If a <link rel="icon"> element already exists,
  // change its href to the given link.
  if ($favicon !== null) {
    $favicon.href = link
  // Otherwise, create a new element and append it to <head>.
  } else {
    $favicon = document.createElement("link")
    $favicon.rel = "shortcut icon"
    $favicon.href = link
    document.head.appendChild($favicon)
  }
}

changeFavicon("https://res.cloudinary.com/saberliou/image/upload/v1564558001/PrepareCSEMaster/favicon.ico");