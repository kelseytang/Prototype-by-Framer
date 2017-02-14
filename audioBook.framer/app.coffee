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
scrollBottom=120
# ----- #
home= new Layer
	backgroundColor: "#FFFFFF"
	width: deviceWidth
	height: deviceHeight
listView = new ScrollComponent
	width: deviceWidth
	height: deviceHeight-120
	y: 120
	parent: home
listView.scrollHorizontal=false
listView.contentInset =
    top: 20
    left: 20
    bottom: scrollBottom
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
	backgroundColor: "#eeeeee"
detailPage.onTap ->
	flow.showPrevious()
flow=new FlowComponent
flow.showNext(home)
# create music bar
musicBar= new Layer
		width: deviceWidth
		height: 130
		backgroundColor: "rgba(0,0,0,1)"
		maxY:deviceHeight+200
# music bar animation		
showMusicBar = new Animation musicBar,
    maxY:deviceHeight
    options:
        #curve: "spring(250, 25, 0)"
        time:.4
# display music
audioBook[0].onTap ->
	# showMusicBar.start()
	flow.showNext(detailPage)
	listView.bottom=musicBar.height
