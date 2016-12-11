background = new BackgroundLayer backgroundColor: "#DDD"
####################
coverImg = new Layer
	width:Screen.width, height:screen.height
	backgroundColor:"#666"
	y:0
	image:"images/bg.jpg"
coverImg.originY=0
####################
square = new Layer
	width: Screen.width, height: Screen.height-320,backgroundColor: "rgba(29,91,255,1)",y:520
square.draggable.constraints = { x: 0, y: 500, width: 200, height: Screen.height }
square.draggable.enabled=true
square.draggable.horizontal=false
#### action #####
posY=0
posY_new=0
scaleNum=0
distant=0
square.on Events.DragStart,->
	posY=square.y

square.on Events.DragMove,->
	posY_new=square.y
	distant=posY_new-posY
	scaleNum=distant/4000
	if distant>1
		coverImg.scale=scaleNum+coverImg.scale
		print scaleNum
square.on Events.DragEnd,->
	coverImg.animate
		properties:
			scale:1
	

		