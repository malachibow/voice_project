// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
window.Noty = require("noty")

//toggle navbar burger
document.addEventListener("turbolinks:load", function() {
$('.navbar-burger').click(function() {
    $('#navbarBasicExample, .navbar-burger').toggleClass('is-active');
  });
$('.toggle').on('click', (e) => {
    e.stopPropagation();
    e.preventDefault();
    $('#' + e.target.getAttribute('aria-controls')).toggleClass('is-hidden');
})

//toggle modal
$('.toggle-modal').on('click', (e) => {
    e.stopPropagation();
    e.preventDefault();

    var type = e.target.getAttribute('aria-control');
    $('#' + type).toggleClass('is-active');
});
//limit on words
    $("#title").keyup(function(){
   
   var content = $("#title").val(); //content is now the value of the text box
   var words = content.split(/\s+/); //words is an array of words, split by space
   var num_words = words.length; //num_words is the number of words in the array
   var max_limit=30;
   if(num_words>max_limit){
       alert("Exceeding the max limit");
       var lastIndex = content.lastIndexOf(" ");
           $("#title").val(content.substring(0, lastIndex));
       
      $('#remainingChars').text('Limit Exceeding');
       return false;
   }
   else 
   {
   $('#remainingChars').text(max_limit+1-num_words +" words remaining");
   }
   });
   //content
    $("#content").keyup(function(){
   
   var content = $("#content").val(); //content is now the value of the text box
   var words = content.split(/\s+/); //words is an array of words, split by space
   var num_words = words.length; //num_words is the number of words in the array
   var max_limit=300;
   if(num_words>max_limit){
       alert("Exceeding the max limit");
       var lastIndex = content.lastIndexOf(" ");
           $("#content").val(content.substring(0, lastIndex));
       
      $('#remainingCharsContent').text('Limit Exceeding');
       return false;
   }
   else 
   {
   $('#remainingCharsContent').text(max_limit+1-num_words +" words remaining");
   }
   });
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")