//= require jquery
//= require jquery-ujs
//= require turbolinks
//= require_tree .

var PageUi = function (){
  this.lastData = ""

  this.updateData = function() {
    // request data from /fresh_data
    $.ajax({url: "/fresh_data", success: function(result){
      alert(result);
      // $("#div1").html(result);
    }});
  }

};


// set 2 second timeout to pull down new data

window.PageUi = new PageUi();
