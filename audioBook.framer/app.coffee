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
	backgroundColor: "#2C313F"
detailPg_ctn= new Layer
	width: deviceWidth
	height: deviceHeight-128
	y:128
	backgroundColor: "#2C313F"
	parent: detailPage
detailPg_albumInfo= new Layer
	parent: detailPg_ctn
	width: deviceWidth
	height: 560
	image: "images/albumInformation.png"
btn_play= new Layer
	image: "images/btn_play.png"
	width: 370
	height: 124
	x: 344
	y: 404
	parent: detailPg_albumInfo
detailPg_header = new Layer
	width: deviceWidth
	height: 140
	image: "images/header_2.png"
	parent: detailPage
# Create a ScrollComponent 
scroll = new ScrollComponent
    width: deviceWidth
    height: detailPg_ctn.height-detailPg_albumInfo.height
    y: detailPg_albumInfo.maxY
    parent: detailPg_ctn
scroll.contentInset =
    bottom: 0
scroll.scrollHorizontal = false
text = new Layer
	parent: scroll.content
	width: scroll.width
	height: 1472
	image: "images/text.png"

detailPg_header.onTap ->
	flow.showPrevious()

flow=new FlowComponent
flow.showNext(home)
# create music bar
musicBar= new Layer
		width: deviceWidth
		height: 146
		image: "images/miniBar.png"
		maxY:deviceHeight+200
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
	listView.contentInset=
		bottom:146
	scroll.contentInset =
		bottom: 146
	
