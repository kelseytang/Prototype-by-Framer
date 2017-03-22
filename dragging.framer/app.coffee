layerA = new Layer
	borderWidth: 10
	borderColor: "#FFFFFF"
	backgroundColor: "transparent"
	opacity: .5

layerC = new Layer
	borderWidth: 10
	borderColor: "#FFFFFF"
	backgroundColor: "transparent"
	x: 640-200
	opacity: .5

layerB = new Layer
	backgroundColor: "rgba(255,64,255,1)"
	x: Align.center
	y: Align.center

layerB.draggable.enabled = true

position=


moveToLeft = new Animation layerB,
    x: 0
    y: 0
    options:
        time: .2
moveToRight = new Animation layerB,
    x: layerC.x
    y: layerC.y
    options:
        time: .2
moveToCenter = new Animation layerB,
    x: Align.center
    y: 0
    options:
        time: .2
layerB.onDragMove ->
	position=layerB.x
	print position
	layerB.opacity=.5
	if position <180
		layerA.opacity=1
		layerC.opacity=.5
	else if position > 250
		layerA.opacity=.5
		layerC.opacity=1
	else 
		layerA.opacity=.5
		layerC.opacity=.5
layerB.onDragEnd ->
	layerB.opacity=1
	test=position
	if test< 180
		moveToLeft.start()
	else if test > 250
		moveToRight.start()	
	else
		moveToCenter.start()
			

