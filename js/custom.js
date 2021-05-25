function update_dutycycle($id, $mac){
    $(".loading_circle").css("display", "block");
    $.ajax({
        url: "ajax/update_dutycycle.php",
        data: {id : $id, mac: $mac},
        type: "POST",
        success: function(data){
            //$data=(string)$data;
            console.log(data); //You can remove here
            document.getElementById("hidden-text-1").style.color = "white";
            document.getElementById("hidden-text-2").style.color = "white";
            document.getElementById("hidden-text-3").style.color = "white";
            document.getElementById("hidden-text-4").style.color = "white";
            if(data==25){
                document.getElementById("hidden-text-1").style.color = "red";
                $("#device_table_dutycycle").text("    25%  ");
                $("#current_value_dc").text("25%");
                $("#myRange").val("25");
                showVal("25");
            }
            if(data==50){
                document.getElementById("hidden-text-2").style.color = "red";
                $("#device_table_dutycycle").text("    50%  ");
                $("#current_value_dc").text("50%");
                $("#myRange").val("50");
                showVal("50");

            }
            if(data==75){
                document.getElementById("hidden-text-3").style.color = "red";
                $("#device_table_dutycycle").text("    75%  ");
                $("#current_value_dc").text("75%");
                $("#myRange").val("75");
                showVal("75");

            }
            if(data==100){
                document.getElementById("hidden-text-4").style.color = "red";
                $("#device_table_dutycycle").text("    100%  ");
                $("#current_value_dc").text("100%");
                $("#myRange").val("100");
                showVal("100");

            }
            $(".loading_circle").css("display", "none");
        },
        //on error
        error: function(data){
                console.log(data); //You can remove here
        }
    });
}

function device_status($mac){
    $(".loading_circle").css("display", "block");
    $.ajax({
        url: "ajax/turn_on_off.php",
        data: {mac: $mac},
        type: "POST",
        success: function(data1){
            if(data1=="1"){
                console.log("Device is turned ON");
                $("#device_stauts_txt").text("ONLINE");
                $("p#device_stauts_txt").css("color", "green");
                $("#device_status_img").attr("src","images/green.png");
                $('.turnon-btn a').removeClass('device_turnon_btn').addClass('device_turnoff_btn');
                $(".turnon-btn a").text("SWITCH OFF");
                $("#device_table_status").text( "    Online    " );
            }if(data1=="0"){
                console.log("Device is turned OFF");
                $("#device_stauts_txt").text("OFFLINE");
                $("p#device_stauts_txt").css("color", "red");
                $("#device_status_img").attr("src","images/red.jpg");
                $('.turnon-btn a').removeClass('device_turnoff_btn').addClass('device_turnon_btn');
                $(".turnon-btn a").text("SWITCH ON");
                $("#device_table_status").text( "    Offline    " );
            }
        $(".loading_circle").css("display", "none");
        },
        error: function(data1){
            console.log(data1);
        }
    });
}

function showVal(newVal){
  document.getElementById("valBox").innerHTML=newVal;
}

function set_custom_value($range_bar,$device_id){
      $(".loading_circle").css("display", "block");
      //console.log($range_bar+'---'+$device_id);
    $.ajax({
        url: "ajax/range-bar.php",
        data: { val : $range_bar, id : $device_id},
        type: "POST",
        success: function(data){
            //$data=(string)$data;
            console.log("HII\n"+data); //You can remove here
            var aa=$range_bar+"%";
            $("#device_table_dutycycle").text(aa);
            $("#current_value_dc").text(aa);
            $(".loading_circle").css("display", "none");
            document.getElementById("hidden-text-1").style.color = "white";
            document.getElementById("hidden-text-2").style.color = "white";
            document.getElementById("hidden-text-3").style.color = "white";
            document.getElementById("hidden-text-4").style.color = "white";
        },
        //on error
        error: function(data){
                console.log(data); //You can remove here
        }
    });
}
