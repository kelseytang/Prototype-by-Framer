# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Kelsey Tang"
	twitter: ""
	description: ""

deviceWidth= Framer.Device.screen.width
deviceHeight= Framer.Device.screen.height
bookCoverWidth= deviceWidth/2-30
audioBook=[]
listView = new ScrollComponent
	width: deviceWidth
	height: deviceHeight-120
	backgroundColor: "#FFFFFF"
	y:120
listView.scrollHorizontal=false
listView.contentInset =
    top: 20
    left: 20
    bottom: 130
for a in [0...4]
	for b in [0...2]
		d=new Layer
			width: bookCoverWidth
			height: bookCoverWidth
			x: (bookCoverWidth+20)*b
			y: (bookCoverWidth+20)*a
			borderRadius: 24
			parent: listView.content
		audioBook.push(d)
for x in [0...8]
	imageFile="images/book_"+x+".png"
	audioBook[x].image= imageFile

musicBar= new Layer
		width: deviceWidth
		height: 120
		backgroundColor: "rgba(226,238,250,1)"
		maxY:deviceHeight

