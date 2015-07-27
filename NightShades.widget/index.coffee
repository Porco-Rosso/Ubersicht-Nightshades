# For use with Übersicht ==> http://tracesof.net/uebersicht/
# Coded by Porco-Rosso ==> https://github.com/Porco-Rosso
# from Stereostance.com
# GNU GPL V2

command: ""

refreshFrequency: 300000000

render: (output) -> """
<div class="shade"></div>
  <div class="container">
    <img class="shades-icon" src="NightShades.widget/Shadesdark.png">
    <span class="table">
    <tr>
    <th><span class="level">.3</span></th>
    <th><span class="level selected">.5</span></th>
    <th><span class="level">.8</span></th>
  </tr>
  </span>
  
  </div>
  
"""

style: """
  font-size: 18px
  font-family: Helvetica Neue
  font-weight: 300
  color: rgba(#FFF, 0.5)

  .shade
    width: 10000px
    height: 10000px
    background-color: black
    opacity: 0.5
    position: absolute
    top: 0px
    left: 0px
    z-index: -100
    
  .container
    position: absolute
    top: 0px
    left: 08px
    width: 200px
    
  .table
    position: relative
    font-size: 12px
    padding: 0px
    color: rgba(#FFF, 0.3)
    border:1px solid rgba(#FFF, 0.3)
    border-radius: 2px
    
  .level.selected
     color: rgba(#000, 0.5)
     background: rgba(#FFF, 0.3)
     
  .shades-icon
    height: 10px
    -webkit-filter: drop-shadow(0px 0px 2px rgba(#FFF, 0.5))
    
    
"""

update: (output, domEl) ->
#    $('.shade').css({
#    width:  $('.content').width(),
#    height:  $('.content').height()
#    });
    $(domEl).find('.shades-icon').click ->
        if $('.shade').hasClass( "transparent" )
             opacity = $(".table").find('.level.selected').html();
             console.log(opacity)
             $('.shade').css({'background-color': 'black'})
             $('.shade').css({'opacity': opacity})
             $('.shades-icon').attr("src","NightShades.widget/Shadesdark.png")
             $('.shades-icon').css({'opacity': '1'})
             $('.shades-icon').css({'-webkit-filter': 'drop-shadow(0px 0px 2px rgba(#FFF, 0.5))'})
             $('.shade').removeClass( "transparent" )
             $('.level.selected').css({'color': 'rgba(#000, 0.0)'})
             console.log("shades on")
        else
             $('.shade').css({'background-color': 'transparent'})
             $('.shades-icon').attr("src","NightShades.widget/Shadeslight.png")
             $('.shades-icon').css({'opacity': '0.5'})
             $('.shades-icon').css({'-webkit-filter': 'drop-shadow(0px 0px 0px rgba(#FFF, 0.0))'})
             $('.shade').addClass( "transparent" )
            console.log("shades off")
    
    $(domEl).find('.level').click ->
             $('.level.selected').removeClass('selected')
             $(this).addClass('selected')
             opacity = $(".table").find('.level.selected').html();
             $('.shade').css({'opacity': opacity})
        
        return
        
