# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Kelsey Tang"
	twitter: ""
	description: ""
# ----- #
deviceWidth= Framer.Device.screen.width
deviceHeight= Framer.Device.screen.height
bookCoverWidth= deviceWidth/2-30
audioBook=[]
# ----- #

home= new Layer
	backgroundColor: "#25232A"
	width: deviceWidth
	height: deviceHeight
header=new Layer
	width: deviceWidth
	height: 140
	parent: home
	image: "images/header_1.png"
listView = new ScrollComponent
	width: deviceWidth
	height: deviceHeight-128
	y: 128
	parent: home
listView.scrollHorizontal=false
listView.contentInset =
    top: 20
    left: 20
    bottom: 20
for a in [0...4]
	for b in [0...2]
		d=new Layer
			width: bookCoverWidth
			height: bookCoverWidth
			x: (bookCoverWidth+20)*b
			y: (bookCoverWidth+20)*a
			borderRadius: 12
			parent: listView.content
		audioBook.push(d)
for x in [0...8]
	imageFile="images/book_"+x+".png"
	audioBook[x].image= imageFile

	
# create detail page
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
#detailPg_ctn= new Layer
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

#detailPg_ctn.draggable.enabled=true
#detailPg_ctn.draggable.horizontal = false
text = new Layer
	width: deviceWidth
	height: 1376
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
	print updateYposition
	if updateYposition > 320
		detailPg_btnGroup.y=updateYposition-10
	else
		detailPg_btnGroup.y=320
		#print "hit!"		
#create flow #
flow=new FlowComponent
flow.showNext(home)
detailPg_header.onTap ->
	flow.showPrevious()

# create music bar
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
audioBook[0].onTap ->
	flow.showNext(detailPage)
btn_play.onTap ->
	showMusicBar.start()
	print "play is clicked"




