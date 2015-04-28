backgroundLayer = new BackgroundLayer
	backgroundColor: '#f2f2f2'

Framer.Defaults.Animation = {
	curve: "spring(100,25,0)"
}

# This imports all the layers for "Configuration" into configurationLayers2
s = Framer.Importer.load "imported/Configuration"

s.container.height = 1608
s.container.scrollVertical = true

s.dots.draggable.enabled = true
s.dots.draggable.speedY = 0

s.dots.on Events.DragEnd, (e, layer) ->
	if layer.x > 91
		layer.animate
			properties: { x: 91 }
	
	if layer.x < -475
		layer.animate
			properties: { x: -475 }
			
s.titles.draggable.enabled = true
s.titles.draggable.speedY = 0

isTitlesDragged = false

activateBhk1 = ->
	s.bhk1.animate
		properties: { opacity: 1 }
	s.bhk2.animate
		properties: { opacity: 0.5 }
	s.bhk3.animate
		properties: { opacity: 0.5 }
	
	s.titles.animate
		properties: { x: 200 }
	
activateBhk2 = ->
	s.bhk2.animate
		properties: { opacity: 1 }
	s.bhk1.animate
		properties: { opacity: 0.5 }
	s.bhk3.animate
		properties: { opacity: 0.5 }
	
	s.titles.animate
		properties: { x: -356 }
	
activateBhk3 = ->
	s.bhk3.animate
		properties: { opacity: 1 }
	s.bhk2.animate
		properties: { opacity: 0.5 }
	s.bhk1.animate
		properties: { opacity: 0.5 }
		
	s.titles.animate
		properties: { x: -940 }
	
activateBhk1()

s.titles.on Events.DragMove, (e, layer) ->
	isTitlesDragged = true

s.titles.on Events.DragEnd, (e, layer) ->
	if Math.floor(layer.x) > -33 then activateBhk1()
	if Math.floor(layer.x) <= -33 and Math.floor(layer.x) > -593 then activateBhk2()
	if Math.floor(layer.x) <= -593 then activateBhk3()
	
	isTitlesDragged = false

s.bhk1.on Events.Click, (e, layer) ->
	if isTitlesDragged is false then activateBhk1()
s.bhk2.on Events.Click, (e, layer) ->
	if isTitlesDragged is false then activateBhk2()
s.bhk3.on Events.Click, (e, layer) ->
	if isTitlesDragged is false then activateBhk3()