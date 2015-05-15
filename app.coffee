
backgroundLayer = new BackgroundLayer
	backgroundColor: '#fff'

Framer.Defaults.Animation = {
	curve: "spring(100,25,0)"
}

# This imports all the layers for "Configuration" into configurationLayers2
s = Framer.Importer.load "imported/location"

s.container.draggable.enabled = true
s.container.draggable.speedY = 0

s.bottom_bar.draggable.enabled = true
s.bottom_bar.draggable.speedY = 0

s.region2.visible = true
s.region2.opacity = 0
s.location2.visible = true
s.location2.opacity = 0

s.north_tooltip.opacity = 0

gotoFirstReg = ->
	s.container.animate
		properties: {x: 100}
	s.region1.animate
		properties: {opacity: 1}
	s.region2.animate
		properties: {opacity: 0}
	s.bottom_bar.animate
		properties: {x: -0}

	s.north_tooltip.animate
		properties: {opacity: 0}
	s.east_tooltip.animate
		properties: {opacity: 1}

	s.location1.animate
		properties: {opacity: 1}
	s.location2.animate
		properties: {opacity: 0}

gotoSecondReg = ->
	s.container.animate
		properties: {x: -810}
	s.region1.animate
		properties: {opacity: 0}
	s.region2.animate
		properties: {opacity: 1}
	s.bottom_bar.animate
		properties: {x: -0}

	s.north_tooltip.animate
		properties: {opacity: 0}
	s.east_tooltip.animate
		properties: {opacity: 1}

	s.location1.animate
		properties: {opacity: 1}
	s.location2.animate
		properties: {opacity: 0}

gotoThirdReg = ->
	s.container.animate
		properties: {x: -1740}
	s.region1.animate
		properties: {opacity: 0}
	s.region2.animate
		properties: {opacity: 1}
	s.bottom_bar.animate
		properties: {x: -600}

	s.location1.animate
		properties: {opacity: 0}
	s.location2.animate
		properties: {opacity: 1}

	s.north_tooltip.animate
		properties: {opacity: 1}
	s.east_tooltip.animate
		properties: {opacity: 0}

isTouched = false
plzDontTouch = false
# s.card2.on Events.TouchEnd, (layer, e)->
# 	if plzDontTouch is true then return
# 	gotoSecondReg()
# 	isTouched = true

# s.card3.on Events.TouchEnd, ->
# 	if plzDontTouch is true then return
# 	gotoThirdReg()
# 	isTouched = true

# s.card1.on Events.TouchEnd, ->
# 	if plzDontTouch is true then return
# 	gotoFirstReg()
# 	isTouched = true

# s.east.on Events.TouchEnd, ->
# 	if plzDontTouch is true then return
# 	gotoThirdReg()
# 	isTouched = true

# s.north.on Events.TouchEnd, ->
# 	if plzDontTouch is true then return
# 	gotoFirstReg()
# 	isTouched = true

# s.container.on Events.DragStart, (layer, e) ->
# 	if isTouched is false
# 		plzDontTouch = false

s.container.on Events.DragEnd, (layer, e) ->
	isTouched = false
	if s.container.x >= -492
		gotoFirstReg()

	if s.container.x < -492 and s.container.x > -1350
		gotoSecondReg()

	if s.container.x <= -1350
		gotoThirdReg()

s.bottom_bar.on Events.DragEnd, (layer, e) ->
	isTouched = false
	if s.bottom_bar.x >= -492
		gotoFirstReg()

	if s.bottom_bar.x < -492
		gotoThirdReg()