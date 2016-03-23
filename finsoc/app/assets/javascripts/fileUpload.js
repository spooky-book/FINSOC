(function() {
  $(".edit-events-container").ready(function() {
    $(".file-upload-button").click(function() {
      filepicker.pick(
       {
          mimetype: 'image/*',
          container: 'window',
          services: ['COMPUTER', 'FACEBOOK', 'DROPBOX']
        },
        function(Blob){
          console.log(Blob.url);
        },
        function(FPError){
      //  console.log(FPError.toString()); - print errors to console
        }
      );
    });
  });
})();