device_w=Screen.size.width
device_h=Screen.size.height
array_recent=[btn_recent_1,btn_recent_2,btn_recent_3]
arrary_myCollection=[listItem_1,listItem_2,listItem_3,listItem_4,listItem_5 ]
for s in array_recent 
	s.states=
		nothing:
			opacity:.1
		play:
			opacity: 1
		pause:
			opacity:.5
	s.stateSwitch("nothing")
	s.onTap ->
		whichState= this.states.current.name
		for x in array_recent
			x.stateSwitch("nothing")
		
		if whichState is "nothing"
			this.stateSwitch("play")
		else if whichState is "play"
			this.stateSwitch("pause")
		else
			this.stateSwitch("play")
		
	
	
homeScroll=new ScrollComponent
	width: device_w
	height: device_h-64
	y:64
	parent: home
	scrollHorizontal: false
homeScroll.sendToBack()
recentPlay=new ScrollComponent
	parent: homeScroll.content
	width: Screen.size.width
	height: recentPlay_feed.height
	y: 0
	scrollVertical:false

recentPlay.onScrollStart ->
	#print "scrolling"
	recentPlay.propagateEvents = false
recentPlay.onScrollEnd ->
	recentPlay.propagateEvents = true
recentPlay_feed.parent=recentPlay.content
myStory_feed.parent=homeScroll.content
myStory_feed.y=recentPlay.maxY
homeScroll.updateContent()

