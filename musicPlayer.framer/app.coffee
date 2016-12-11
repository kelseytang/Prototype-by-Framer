# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Kelsey"
	twitter: ""
	description: ""


bg=new BackgroundLayer
	backgroundColor: "rgba(27,72,242,1)"
# Create item here!
btn_play=new Layer
	width: 600
	height: 600
	x:Align.center
	y: Align.center
	backgroundColor: "#4DF494"
	borderRadius: 27

btn_play.states=
	pause:
		scale:.9
		shadowX:0
		shadowY:0
		shadowBlur: 0
		backgroundColor: "rgba(62,198,121,1)"
		animationOptions:
			curve:"spring(250, 25, 0)"
	playing:
		scale: 1
		shadowX:10
		shadowY:10
		shadowColor: "rgba(14,39,128,1)"
		shadowBlur: 27
		backgroundColor: "#4DF494"
		animationOptions:
			curve:"spring(250, 25, 0)"
btn_play.stateSwitch("playing")
slider = new SliderComponent
	x:Align.center
	y:btn_play.maxY+200
	width: btn_play.width-40
	height: 9
# slider style
slider.borderRadius = 4
slider.fill.backgroundColor="#FE8F19"
slider.backgroundColor="#112F9B"
slider.knobSize = 45
# Write interaction code here!
btn_play.onTap ->
	btn_play.stateCycle("pause", "playing")
	#btn_play.stateSwitch("pause")