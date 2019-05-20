<script>
 $(function() {
   $('#ajax_button').on('click', function() {
     console.log('Ajax button pressed.');
     var form = $('#form').get()[0];
     var formdata = new FormData(form);

     $.ajax({
       url : '/api/restdemo_api/hello',
       type : 'POST',
       data : formdata,
       cache : false,
       contentType : false,
       processData : false
     }).done(function(data, textStatus, jqXHR) {
       console.log('------------ ajax response -----------');
       console.log(data);
       if(data.status == 'ok') {
         alert(data.message);
       }
     }).fail(function(jqXHR, textStatus, errorThrown) {
       alert('fail');
     });
   });
 });
</script>
