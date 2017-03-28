posX=
posY=
deviceW= Framer.Device.screen.width
deviceH= Framer.Device.screen.height
#-----------------------------//
baseArea= new Layer
	width: deviceW
	height: deviceH/2
	maxY: deviceH

leftBlk = new Layer
	borderWidth: 10
	borderColor: "#FFFFFF"
	backgroundColor: "transparent"
	opacity: .5

rightBlk = new Layer
	borderWidth: 10
	borderColor: "#FFFFFF"
	backgroundColor: "transparent"
	maxX: deviceW
	opacity: .5

pink = new Layer
	backgroundColor: "rgba(255,64,255,1)"
	x: 0
	y: 0
	parent: baseArea
pink.draggable.enabled = true


#--// interaction  //
moveToLeft = new Animation pink,
    x: 0
    y: 0
    options:
        time: .2
moveToRight = new Animation pink,
    x: rightBlk.x
    y: rightBlk.y
    options:
        time: .2
moveToCenter = new Animation pink,
    x: 0
    y: 0
    options:
        time: .5
pink.onDragMove ->
	posX=pink.x
	posY=pink.y
	pink.opacity=.5
	if posX <170 
		leftBlk.opacity=1
		rightBlk.opacity=.5
	else if posX > 380
		leftBlk.opacity=.5
		rightBlk.opacity=1
	else 
		leftBlk.opacity=.5
		rightBlk.opacity=.5
pink.onDragEnd ->
	pink.opacity=1
	endX=posX
	endY=posY
	if endX< 170 
		moveToLeft.start()
		this.parent="" # leave parent
	else if endX > 380
		this.parent=""# leave parent
		moveToRight.start()	
	else
		this.parent=baseArea
		this.x=0
		this.y=0
		#moveToCenter.start()

