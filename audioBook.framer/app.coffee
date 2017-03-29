# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: "Story Time"
	author: "Kelsey Tang"
	description: ""
### 
All Variables
----------------------------------- 
###
deviceWidth= Framer.Device.screen.width
deviceHeight= Framer.Device.screen.height
bookCoverWidth= deviceWidth/2-30
flow=
recentPlayed_arry=[]
detailPage= 
detailTest=

# ///Home---------------------------- 

home= new Layer
	backgroundColor: "#25232A"
	width: deviceWidth
	height: deviceHeight
home_header=new Layer
	width: deviceWidth
	height: 140
	parent: home
	image: "images/header_1.png"
homeDrag= new ScrollComponent
	width: deviceWidth
	height: deviceHeight-home_header.height
	y: home_header.maxY-10
	parent: home
homeDrag.scrollHorizontal=false
homeDrag.contentInset =
    top: 16
h_recentPlay= new Layer
	parent: homeDrag.content
	image: "images/h_recentPlay.png"
	y: 30
	width: 280
	height: 48
recentPlayed_list = new ScrollComponent
    width: deviceWidth
    height: 360
    y: 90
    parent: homeDrag.content
recentPlayed_list.scrollVertical = false
recentPlayed_list.onScrollStart ->
	homeDrag.scrollVertical=false
recentPlayed_list.onScrollEnd ->
	homeDrag.scrollVertical=true
homeDrag.onScrollStart ->
	recentPlayed_list.scrollHorizontal= false
homeDrag.onScrollEnd ->
	recentPlayed_list.scrollHorizontal=true

for i in [0...4]
	imageFile="images/book_"+i+".png"
	played_cover= new Layer
		width: 320
		height: 320
		parent: recentPlayed_list.content
		y: 20
		x:350*i+30
		borderRadius: 10
		image: imageFile
	recentPlayed_arry.push(played_cover)
	played_cover.onTap ->
		test= this.index
		detailTest="images/albumInformation_"+test+".png"
		#print this.index
		detailPg_albumInfo.image= detailTest
		flow.showNext(detailPage)
		

#recentPlayed_arry[1].onTap ->
#	
		
h_myCollection = new Layer
	width: deviceWidth
	height:70
	y: recentPlayed_list.maxY+32
	image: "images/h_myCollection.png"
	parent: homeDrag.content

myCollection_list= new Layer
	width: deviceWidth
	height: 900
	y: h_myCollection.maxY
	parent: homeDrag.content
myCollection_list.scrollHorizontal=false

for s in [0...5]
	itemImage="images/list_"+s+".png"
	myCollection_item= new Layer
		width: deviceWidth
		height: 180
		parent: myCollection_list
		y: 180*s
		image: itemImage
	myCollection_play=new Layer
		parent: myCollection_item
		width: 90
		height: 90
		maxX:myCollection_item.maxX-30
		y:45
	myCollection_item.onTap ->
		flow.showNext(detailPage)
homeDrag.sendToBack()

# ///Detaile Page----------------------------
detailPage = new Layer
	width: deviceWidth
	height: deviceHeight
	backgroundColor: "#25232A"


detailPg_albumInfo= new Layer
	width: deviceWidth
	height: 320
	image: "images/albumInformation.png"
	parent: detailPage
	y: 140
	originY: 0

detailPg_ctn= new ScrollComponent
	width: deviceWidth
	height: deviceHeight-140
	y: 140
	backgroundColor: "transparent"
	parent: detailPage
	scrollHorizontal: false
detailPg_header = new Layer
	width: deviceWidth
	height: 140
	y: 0
	image: "images/header_2.png"
	parent: detailPage

text = new Layer
	width: deviceWidth
	height: 1436
	y: 524
	image: "images/text.png"
	parent: detailPg_ctn.content
detailPg_btnGroup = new Layer
	parent: detailPg_ctn.content
	width: deviceWidth
	height: 204
	backgroundColor: "rgba(37,35,42,0.9)"
	y: 320

btn_play= new Layer
	image: "images/btn_play.png"
	width: 370
	height: 124
	x: 344
	y: 60
	parent: detailPg_btnGroup


btn_preview = new Layer
	image: "images/btn_preview.png"
	width: 160
	height: 72
	y: 66
	parent: detailPg_btnGroup
	x: 36
btn_preview.states =
    default:
        image: "images/btn_preview.png"
    clicked:
        image: "images/btn_playing.png"
btn_preview.onTap ->
    this.stateCycle("clicked", "default")

detailPg_ctn.on Events.Move, (offset) ->
	updateYposition= -offset.y
	percentage=1-updateYposition/320
	detailPg_albumInfo.opacity=percentage
	#detailPg_albumInfo.blur=updateYposition/15
	if updateYposition > 320
		detailPg_btnGroup.y=updateYposition-10
	else
		detailPg_btnGroup.y=320

### 
Create Flow
----------------------------------- 
###


flow=new FlowComponent
flow.showNext(home)
detailPg_header.onTap ->
	flow.showPrevious() 


		
### 
Music Bar
----------------------------------- 
###
musicBar= new Layer
		width: deviceWidth
		height: 128
		image: "images/miniBar.png"
		maxY:deviceHeight+200
musicBar_setting= new Layer
	parent: musicBar
	image: "images/miniBar_setting.png"
	width: 72
	height: 72
	x: deviceWidth-102
	y: 30

musicBar_pause= new Layer
	parent: musicBar
	image: "images/miniBar_pause.png"
	width: 72
	height: 72
	x: 36
	y: 30
musicBar_pause.states =
    pause:
        image: "images/miniBar_pause.png"
    play:
        image: "images/miniBar_play.png"
musicBar_pause.onTap ->
	this.stateCycle("play", "pause")

musicBar_setting.onTap ->
	controlPN.animate("show")	
# music bar animation		
showMusicBar = new Animation musicBar,
    maxY:deviceHeight
    options:
        curve: "spring(250, 25, 0)"
        time:.4
# display music

btn_play.onTap ->
	showMusicBar.start()
	isPlay=true
	homeDrag.contentInset =
		bottom: 160


###
Control panel
----------------------------------- 
###
controlPN_itemArry=[]
controlPN = new Layer
	width: deviceWidth
	height: deviceHeight
	backgroundColor: "#2C313F"
	x: Align.center
	y: deviceHeight
	#y: 0
	shadowSpread: 5
	shadowColor: "rgba(0,0,0,1)"
	shadowBlur: 10
controlPN_statusBar = new Layer
	width: deviceWidth
	height: 128
	image: "images/header_3.png"
	parent: controlPN
controlPN_hub= new Layer
	x: Align.center
	y: 150
	width: 360
	height: 420
	image: "images/hub-on.png"
	parent: controlPN
controlPN_optGP=new Layer
	width: deviceWidth
	height: deviceHeight-626
	backgroundColor: "#25232A"
	y: controlPN_hub.maxY+62
	parent: controlPN
for d in [0...3]
	itemImage="images/option_item"+d+".png"
	controlPN_item= new Layer
		width: deviceWidth
		height: 128
		parent: controlPN_optGP
		y:130*d
		image: itemImage
		
	controlPN_itemArry.push(controlPN_item)
controlPN_switch=new Layer
	parent:controlPN_itemArry[1]
	height: 72
	width: 140
	y:26
	x: 560
	image: "images/light-on.png"
	
slider = new SliderComponent
	width: 520
	parent: controlPN_optGP
	x: Align.center
	y: 475

# Customize the appearance 
slider.knob.shadowY = 2
slider.knob.shadowBlur = 4
slider.knob.borderRadius = 20
slider.knobSize = 40
slider.fill.backgroundColor = "#93FF1D"
slider.value=.5
slider.max=1

controlPN_close= new Layer
	width: 300
	height: 80
	borderRadius: 40
	backgroundColor: "#FFFFFF"
	parent: controlPN_optGP
	y: 580
	x: Align.center


#------------------------#
controlPN.states=
	hide:
		y: deviceHeight
		animationOptions:
			time:.4
	show:
		y: 0
		animationOptions:
			time:.4
#-----------------------#
controlPN_hub.states=
	lightOn:
		image:"images/hub-on.png"
	lightOff:
		image:"images/hub-off.png"
controlPN_switch.states=
	lightOn:
		image:"images/light-on.png"
	lightOff:
		image:"images/light-off.png"

controlPN_switch.onTap ->
	this.stateCycle("lightOff", "lightOn")
	controlPN_hub.stateCycle("lightOff", "lightOn")
controlPN_close.onTap ->
	controlPN.animate("hide")

