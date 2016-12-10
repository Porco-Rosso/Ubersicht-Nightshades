# For use with Übersicht ==> http://tracesof.net/uebersicht/
# Coded by Porco-Rosso ==> https://github.com/Porco-Rosso
# from Stereostance.com
# v1.1.0
# GNU GPL V2

command: ""

refreshFrequency: 300000000

render: (output) -> """

<div class="shade"></div>

<div class="blur-layer"></div>

<div class="container">
    <img class="shades-icon" src="NightShades.widget/Shadesdark.png">
    <span class="table">
      <tr>
      <th><span class="level">.3</span></th>
      <th><span class="level selected">.5</span></th>
      <th><span class="level">.8</span></th>
      </tr>
    </span>
    <span class="bluricon blurred-icon">◍</span>

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
    overflow:hidden

  .blur-layer
    width: 10000px
    height: 10000px
    position: absolute
    overflow: hidden
    top: 0px
    left: 0px
    z-index: -101
    -webkit-backdrop-filter: blur(0px)

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

  span.bluricon
    font-size: 20px
    position: absolute
    margin-left: 3px
    margin-bottom: 5px
    margin-top: -1px
"""

update: (output, domEl) ->
# Add/remove Shade
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

# Change level of shade
    $(domEl).find('.level').click ->
             $('.level.selected').removeClass('selected')
             $(this).addClass('selected')
             opacity = $(".table").find('.level.selected').html();
             $('.shade').css({'opacity': opacity})

# Add/remove Blur
    $(domEl).find('.bluricon').click ->
        if $('.blur-layer').hasClass( "blurred" )
             $('.blur-layer').css({'-webkit-backdrop-filter': 'blur(0px)'})
             $('.bluricon').html("◍")
             $('.bluricon').css({'margin-top': '-1px'})
             $('.blur-layer').removeClass( "blurred" )
             console.log("unblurred")

        else
             $('.blur-layer').css({'-webkit-backdrop-filter': 'blur(10px)'})
             $('.bluricon').html("●")
             $('.bluricon').css({'margin-top': '0px'})
             $('.blur-layer').addClass( "blurred" )
             console.log("blurred")

        return
