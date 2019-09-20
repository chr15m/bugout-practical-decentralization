var files = {"index.html": null, "style.css": null};
setInterval(function() {
  Object.keys(files).map(function (f) {
    fetch(f).then(function(data) {
      data.text().then(function(t) {
        if (files[f] != null && files[f] != t) {
          document.location.reload();
        }
        files[f] = t;
      });
    });
  });
}, 500);
