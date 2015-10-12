(function() {

  var supports = !!document.querySelector && !!window.addEventListener;
  if (!supports) { return; }

  // file names:  <imageTitle>-static.gif and <imageTitle>-dynamic.gif
  // image class: --js-<imageTitle>-img
  function addGif(imageTitle) {
    var staticImage = document.getElementsByClassName("--js-" + imageTitle + "-img")[0];
    var dynamicImage = document.createElement("img");
    dynamicImage.setAttribute("src", imageTitle + "-dynamic.gif");
    dynamicImage.setAttribute("class", staticImage.getAttribute("class"));

    staticImage.addEventListener("mouseover", function() {
      staticImage.parentNode.replaceChild(dynamicImage, staticImage);
    }, false);

    dynamicImage.addEventListener("mouseout", function() {
      dynamicImage.parentNode.replaceChild(staticImage, dynamicImage);
      // Reset gif
      dynamicImage.setAttribute("src", "");
      dynamicImage.setAttribute("src", imageTitle + "-dynamic.gif");
    }, false);
  }

  addGif("streamer");
  addGif("eclipse");
  addGif("oneshot");
  addGif("gol");

})();