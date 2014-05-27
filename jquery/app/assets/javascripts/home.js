var when_page_is_ready = function() {


  setTimeout(function() {
        $("p").fadeOut("slow", function() {
            $("p").remove();
        });
    }, 4000);

  $(".submit").hide();
  $(".object-input").keyup(function() {
    if ( $(".object-input").val() ) {
      $(".submit").show();
    }
  });
  

//   pageSize = 10;

//   var showPage = function(page) {
//     $("table.patients").hide();
//     $("table.patients").each(function(n) {
//       console.log("n:", n)
//       console.log("pageSize:", pageSize)
//       console.log("page:", page)
//         if (n >= pageSize * (page - 1) && n < pageSize * page)
//             $(this).show();
//     });        
// }
    
//     showPage(1);

// $("li a").click(function() {
//   showPage(parseInt($(this).text())) 
//   })



  $(document.body).on("click", "a.change_workflow", function() {
    $.ajax({
      type: "PATCH",
      url: $(this).attr("patient_url"),
      dataType: "script" //,
    })
  })  

  $(document.body).on("q", ".search", function() {
    console.log("search function")
    $.ajax({
      type: "GET",
      url: $(this).attr("search_url"),
      dataType: "script"
    })
})


}
$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);


























