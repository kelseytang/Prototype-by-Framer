# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Kelsey Tang"
	twitter: ""
	description: ""
### 
All Variables
----------------------------------- 
###
deviceWidth= Framer.Device.screen.width
deviceHeight= Framer.Device.screen.height
bookCoverWidth= deviceWidth/2-30
flow=
recentPlayed_listGP=[]
downloadedGP=[]
detailPage= 

# ///Home---------------------------- 

home= new Layer
	backgroundColor: "#25232A"
	width: deviceWidth
	height: deviceHeight
header=new Layer
	width: deviceWidth
	height: 140
	parent: home
	image: "images/header_1.png"
recentPlayed_list = new ScrollComponent
    width: deviceWidth
    height: 360
    y: 160
    parent: home

recentPlayed_list.scrollVertical = false

for i in [0...4]
	played_cover= new Layer
		width: 320
		height: 320
		parent: recentPlayed_list.content
		y: 20
		x:340*i+30
	played_cover.onTap ->
		flow.showNext(detailPage)
	recentPlayed_listGP.push(played_cover)

for a in [0...4]
	imageFile="images/book_"+a+".png"
	recentPlayed_listGP[a].image=imageFile

downloaded_list= new ScrollComponent
	width: deviceWidth
	height: deviceHeight-500
	y: recentPlayed_list.maxY+30
	parent: home
downloaded_list.scrollHorizontal=false

for s in [0...10]
	downloaded_item= new Layer
		width: deviceWidth
		height: 200
		parent: downloaded_list.content
		y: 202*s
		backgroundColor: "rgba(66,66,66,1)"


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
	backgroundColor: "#25232A"
	y: 320

btn_play= new Layer
	image: "images/btn_play.png"
	width: 370
	height: 124
	x: 344
	y: 60
	parent: detailPg_btnGroup
btn_like = new Layer
	image: "images/btn_like_default.png"
	width: 76
	height: 76
	x: 36
	y: 66
	parent: detailPg_btnGroup
btn_like.states =
    default:
        image: "images/btn_like_default.png"
    clicked:
        image: "images/btn_like_clicked.png"
btn_like.onTap ->
    this.stateCycle("clicked", "default")
btn_preview = new Layer
	image: "images/btn_preview.png"
	width: 160
	height: 72
	y: 66
	parent: detailPg_btnGroup
	x: btn_like.maxX+24
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
		height: 146
		image: "images/miniBar.png"
		maxY:deviceHeight+200
musicBar_pause= new Layer
	parent: musicBar
	image: "images/miniBar_pause.png"
	width: 72
	height: 72
	x: deviceWidth-102
	y: 50
musicBar_pause.states =
    pause:
        image: "images/miniBar_pause.png"
    play:
        image: "images/miniBar_play.png"
musicBar_pause.onTap ->
    this.stateCycle("play", "pause")

# music bar animation		
showMusicBar = new Animation musicBar,
    maxY:deviceHeight
    options:
        curve: "spring(250, 25, 0)"
        time:.4
# display music

btn_play.onTap ->
	showMusicBar.start()




