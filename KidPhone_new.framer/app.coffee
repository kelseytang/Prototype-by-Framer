BG=new BackgroundLayer
	backgroundColor:"#666"
screenHeight=Screen.height
pageCtn=new PageComponent
	width:Screen.width
	height:Screen.height
	scrollVertical:false
#page 1
pg_home=new Layer
	width:Screen.width
	height:Screen.height
	superLayer:pageCtn.content
	backgroundColor:"#333"
	image:"images/wallpaper.png"

pg_2nd=new Layer
	width:Screen.width
	height:Screen.height
	superLayer:pageCtn.content
	x:Screen.width
	backgroundColor:"#eee"
	
#page 1 content
blackScreen=new Layer
	backgroundColor:"#000"
	opacity:0
	width:Screen.width
	height:screenHeight
	superLayer:pg_home
blackScreen.states.add
	open:{opacity:0.5}
panel=new Layer
	width:Screen.width-32
	height:screenHeight/4*3
	y:Screen.height
	backgroundColor:"#FFF"
	borderRadius:15
panel.centerX()	
panel.superLayer=pg_home
panel.states.add
	open:{y:Screen.height/2-panel.height/2}
panel.states.animationOptions =
    curve: "spring(400,30,0)"
avatar=new Layer
	borderRadius:150
	backgroundColor:"#d6d6d6"
	width:250
	height:250
	y:screenHeight/2-450/2
	image:"images/avatar.png"

avatar.centerX()
avatar.states.add
    open: { y: screenHeight-250/2-125,scale:.7}
avatar.states.animationOptions =
    curve: "spring(400,30,0)"
avatar.superLayer=pg_home
btn_close=new Layer
	backgroundColor:"red"
	width:avatar.width
	height:avatar.height
	borderRadius:avatar.borderRadius
	opacity:0
	scale:0.7
	superLayer:avatar
btn_close.center()
btn_close.states.add
	open:{opacity:.5,scale:1}
btn_close.states.animationOptions =
    curve: "spring(400,30,0)"
panelIsOpen=false
avatar.on Events.Click,->
	if panelIsOpen is true

		pageCtn.scrollHorizontal=true
		panelIsOpen=false
	else
		pageCtn.scrollHorizontal=false
		panelIsOpen=true
	blackScreen.states.next()
	btn_close.states.next()
	panel.states.next()
	avatar.states.next()
