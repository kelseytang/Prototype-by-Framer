# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Kelsey"
	twitter: ""
	description: ""


# Put variable here!
coverRadius=18
deviceWidth= Framer.Device.screen.width
deviceHeight= Framer.Device.screen.height
barBgColor="#555555"
fontSize="font-size":"36px"
# end vairable
bg=new BackgroundLayer
	backgroundColor: "rgba(8,14,33,1)"
# Create item here!
progressBar=new Layer
	x:Align.center
	width: 600
	height: 9
	y: 100
	backgroundColor: barBgColor
	borderRadius: 3
progressBarFill= new Layer
	width: progressBar.width/3
	height: progressBar.height
	backgroundColor: "#FFF"
	borderRadius: 3
progressBarFill.parent=progressBar
currentTime=new Layer
	backgroundColor: "transparent"
	y:30
currentTime.html = "0:35"
currentTime.style = fontSize
currentTime.parent=progressBar
totleTime=new Layer
	backgroundColor: "transparent"
	y:30
	x:progressBar.width-65
totleTime.html = "4:20"
totleTime.style = fontSize
totleTime.parent=progressBar

songName=new Layer
	x: Align.center
	y: 200
	width: deviceWidth
	height: 64
	backgroundColor: "transparent"
	color: "#FFF" #text color
songName.html="Hey Love - Video Edit"
songName.style=
	"text-align": "center"
	"font-size":"48px"
artistName=new Layer
	x: Align.center
	y: songName.maxY
	width: deviceWidth
	height: 64
	backgroundColor: "transparent"
	color: "#888888"
artistName.html="Adam Stacks - Love Affairs"
artistName.style=
	"text-align": "center"
	"font-size":"36px"

controller=new Layer
	backgroundColor: "#222222"
	x: Align.center
	y:artistName.maxY+10
	width: deviceWidth
	height: 120
	backgroundColor: "transparent"
btn_play=new Layer
	image: "images/pause.svg"
	width: 120
	height: 120
	x: Align.center
	parent:controller
btn_forward=new Layer
	image: "images/forward.svg"
	width: 120
	height: 120
	x: btn_play.maxX+80
	parent:controller
btn_rewind=new Layer
	image: "images/rewind.svg"
	width: 120
	height: 120
	maxX: btn_play.minX-80
	parent:controller

coverIMG=new Layer
	width: 600
	height: 600
	x:Align.center
	maxY: deviceHeight-130
	borderRadius: coverRadius
	image: "images/cover.png"

coverIMG.states=
	pause:
		scale:.95
		animationOptions:
			curve:"spring(250, 25, 0)"
	playing:
		scale: 1
		animationOptions:
			curve:"spring(250, 25, 0)"

btn_play.states=
	pause:
		image: "images/play.svg"
	playing:
		image: "images/pause.svg"



coverMask=new Layer
	backgroundColor: "#000000"
	width: coverIMG.width
	height: coverIMG.height
	opacity: 0
	borderRadius: coverRadius
coverMask.parent=coverIMG
coverMask.states=
	pause:
		opacity:.5
		animationOptions:
			curve:"spring(250, 25, 0)"
	playing:
		opacity: 0
		animationOptions:
			curve:"spring(250, 25, 0)"


slider = new SliderComponent
	x:Align.center
	y:coverIMG.minY-100
	width: progressBar.width-100
	height: 9
# slider style
slider.borderRadius = 4
slider.fill.backgroundColor="#FFF"
slider.backgroundColor=barBgColor
slider.knobSize = 45
# Write interaction code here!
btn_play.onTap ->
	coverIMG.stateCycle("pause", "playing")
	coverMask.stateCycle("pause", "playing")
	btn_play.stateCycle("pause", "playing")
	#print deviceHeight