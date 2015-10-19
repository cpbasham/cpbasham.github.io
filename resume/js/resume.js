(function() {

  var supports = !!document.querySelector && !!window.addEventListener;
  if (!supports) { return; }

  (function addDynamicGifs() {
    var staticImages = document.getElementsByClassName("--js-add-dynamic");
    for (var i=0; i<staticImages.length; i++) {
      var img = staticImages[i];
      var src = img.getAttribute("src");
      var dynImg = document.createElement("img");
      var dynSrc = src.slice(0, src.indexOf("static.gif")) + "dynamic.gif";
      dynImg.setAttribute("src", dynSrc);
      dynImg.setAttribute("class", img.getAttribute("class"));

      addDynamicListeners(img, dynImg);
    }

    function addDynamicListeners(staticImage, dynamicImage) {
      staticImage.addEventListener("mouseover", function() {
        staticImage.parentNode.replaceChild(dynamicImage, staticImage);
      }, false);

      dynamicImage.addEventListener("mouseout", function() {
        dynamicImage.parentNode.replaceChild(staticImage, dynamicImage);
        // Reset gif
        var dynamicSource = dynamicImage.getAttribute("src");
        dynamicImage.setAttribute("src", "");
        dynamicImage.setAttribute("src", dynamicSource);
      }, false);
    }
  })();

})();