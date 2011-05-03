

show_message = (msg) -> 
        $('#testing').hide().text(msg).fadeIn(2222, 
          -> $('#testing').append('!') 
        )
              
      $ -> show_message "world"
      $('#testing').click -> show_message "you"
