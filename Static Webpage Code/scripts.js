//add your api here below
var API_ENDPOINT = "https://mz9aboyjrf.execute-api.us-east-1.amazonaws.com/dev/getseason"
//AJAX GET REQUEST
var inputData = {"SEASON":"*"};
data=JSON.stringify(inputData) ;
document.getElementById("getdata").onclick = function(){  
  $.ajax({
        url: API_ENDPOINT,
        type: 'GET',
         contentType: 'application/json; charset=utf-8',
        success: function (response) {
          $('#DataT tr').slice(1).remove();
          jQuery.each(response, function(i,data) {          
            $("#DataT").append("<tr> \
                <td>" + data['SEASON'] + "</td> \
                <td>" + data['LOCATION'] + "</td> \
                <td>" + data['AVG_TEMP'] + "</td> \
                <td>" + data['AVG_HUMI'] + "</td> \
                <td>" + data['AVG_RAINFALL'] + "</td> \
                <td>" + data['LABEL'] + "</td> \
                </tr>");
          });
        },
        error: function () {
            alert("error");
        }
    });
}