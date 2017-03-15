svg=new Layer
	width: 300
	height: 300
svg.html="""
<svg width=300 height=300 viewBox="-5 0 170 60">
<rect x="0" y="0" width="160" height="60" rx="30" ry="30" style="stroke:#AA95FE;stroke-width:10"></rect>
</svg>"""
#---- Preview button ----#
btn_preview = new Layer
	borderRadius: 50
	width: 240
	height: 100
	backgroundColor: "rgba(29,51,71,1)"
	x: Align.center
	y: Align.center
bg_preview = new Layer
	borderRadius: 50
	width: 240
	height: 100
	scaleX: .85
	scaleY: .9
	opacity: 0
	x: Align.center
	parent: btn_preview
	backgroundColor: "rgba(114,210,215,1)"
bg_preview.states=
	stateA:
		scaleX:1
		scaleY: 1
		opacity: 1
		animationOptions:
			time:.7
			curve: Spring(damping: 0.5)
	stateB:
		scaleX: .85
		scaleY: .9
		opacity: 0
		animationOptions:
			time:.2
			curve: Bezier.ease

btn_preview.onTap -> 
	bg_preview.stateCycle("stateA", "stateB")