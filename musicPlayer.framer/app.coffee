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
fontSize="font-size":"30px"
# create music list
musicItem_0= new Object
	title:"Hey Love - Video Edit"
	albumInfo:"Adam Stacks - Love Affairs"
	cover:"images/cover.png"
musicItem_1= new Object
	title:"Inside - Gernica Remix"
	albumInfo:"James Teej - Moonstalker Affairs"
	cover:"images/cover1.png"
musicItem_2= new Object
	title:"Mars - Ripperton Roots Version"
	albumInfo:"Roots Panorma - Mars"
	cover:"images/cover2.png"
musicItem_3= new Object
	title:"Equal - Orignal Mix"
	albumInfo:"Marco Resmann - Olympia EP"
	cover:"images/cover3.png"
playList= [musicItem_0, musicItem_1, musicItem_2, musicItem_3]

CurrentPlay=2 # initial play item.

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
songName.html=playList[CurrentPlay].title
songName.style=
	"text-align": "center"
	"font-size":"42px"
artistName=new Layer
	x: Align.center
	y: songName.maxY
	width: deviceWidth
	height: 64
	backgroundColor: "transparent"
	color: "#888888"
artistName.html=playList[CurrentPlay].albumInfo
artistName.style=
	"text-align": "center"
	"font-size":"36px"

controller=new Layer
	backgroundColor: "#222222"
	x: Align.center
	y:artistName.maxY
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
	width: 620
	height: 620
	x:Align.center
	maxY: deviceHeight-130
	borderRadius: coverRadius
	image: playList[CurrentPlay].cover
	brightness: 100

coverIMG.states=
	pause:
		scale:.9
		brightness: 60
		animationOptions:
			curve:"spring(250, 25, 0)"
	playing:
		scale: 1
		brightness: 100
		animationOptions:
			curve:"spring(250, 25, 0)"

btn_play.states=
	pause:
		image: "images/play.svg"
	playing:
		image: "images/pause.svg"

volumeControl=new Layer
	width: 640
	x: Align.center
	height: 80
	maxY: coverIMG.y-50
	backgroundColor: "transparent"
slider = new SliderComponent
	x:Align.center
	width: progressBar.width-160
	height: 9
	parent: volumeControl
	y: Align.center
# slider style
slider.borderRadius = 4
slider.fill.backgroundColor="#FFF"
slider.backgroundColor=barBgColor
slider.knobSize = 45
sound_mute=new Layer
	image: "images/sound_mute.svg"
	width: 64
	height: 64
	parent: volumeControl
	y: Align.center
	x: 0
sound_up=new Layer
	image: "images/sound_up.svg"
	width: 64
	height: 64
	parent: volumeControl
	y: Align.center
	maxX: slider.maxX+86

newItem = (updateNumber) ->
	coverIMG.image= playList[updateNumber].cover
	songName.html= playList[updateNumber].title
	artistName.html= playList[updateNumber].albumInfo

# Play button interaction
btn_play.onTap ->
	coverIMG.stateCycle("pause", "playing")
	btn_play.stateCycle("pause", "playing")
btn_play.onTouchStart ->
	btn_play.brightness=0
btn_play.onTouchEnd ->
	btn_play.brightness=100

# Rewind button interaction 
btn_rewind.onTap ->
	if CurrentPlay >0
		CurrentPlay=CurrentPlay-1
		newItem(CurrentPlay)
	else
		newItem(0)
btn_rewind.onTouchStart ->
	btn_rewind.brightness=10
btn_rewind.onTapEnd ->
	btn_forward.brightness=100
	if CurrentPlay <= 0
		btn_rewind.brightness=40
	else
		btn_rewind.brightness=100

# Forward button interaction 
btn_forward.onTap ->
	if CurrentPlay <3
		CurrentPlay = CurrentPlay+1
		newItem(CurrentPlay)
	else
		newItem(3)
		btn_forward.brightness= 40
btn_forward.onTouchStart ->
	btn_forward.brightness=0
btn_forward.onTapEnd ->
	btn_rewind.brightness=100
	if CurrentPlay >2
		btn_forward.brightness= 40
	else
		btn_forward.brightness= 100
		
# Play button interaction


