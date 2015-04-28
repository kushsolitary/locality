Framer.Device.deviceType = "iphone-5s-gold"

backgroundLayer = new BackgroundLayer
	backgroundColor: '#fff'

Framer.Defaults.Animation = {
	curve: "spring(100,25,0)"
}

# This imports all the layers for "Configuration" into configurationLayers2
s = Framer.Importer.load "imported/card"

flipCard = (front, back, perspective, flipCurve) ->
	# Create a new container layer
	perspectiveLayer = new Layer
		width: front.width + 24
		height: front.height + 100
		backgroundColor: "transparent"
	perspectiveLayer.perspective = perspective
	perspectiveLayer.y = 55

	container = new Layer
		width: front.width
		height: front.height
		backgroundColor: "transparent"
		superLayer: perspectiveLayer

	front.x = 0;
	front.y = 0;
	back.x = 0;
	back.y = 0;

	s.keyboardFront.states.add
		front: {visible: true}
		back: {visible: false}

	# Center the container
	container.center()

	#Set superLayer for both front and back layers
	back.superLayer = container
	front.superLayer = container

	# Rotate the back image on intial
	back.rotationY = 180

	#######################
	# States
	#######################
	front.states.add
		front: {opacity: 1}
		back: {opacity: 0}
	front.states.animationOptions =
		curve: flipCurve
	front.states.switchInstant("front")

	back.states.add
		front: {opacity: 0}
		back: {opacity: 1}
	back.states.animationOptions =
		curve: flipCurve

	container.states.add
		front: {rotationY: 0}
		back: {rotationY: 180}
	container.states.animationOptions =
		curve: flipCurve

	s.button.states.add
		front: {rotationY: 0}
		back: {rotationY: 180}

	s.button.states.animationOptions =
		curve: flipCurve

	container.states.switchInstant("front")
	container.on Events.Click, ->
		this.states.next(["back","front"])
		s.button.states.next(["back","front"])
		s.keyboardFront.states.next(["back","front"])
		front.states.next(["back","front"])

	s.button.on Events.Click, ->
		this.states.next(["back","front"])
		container.states.next(["back","front"])
		s.keyboardFront.states.next(["back","front"])
		front.states.next(["back","front"])

flipCard(s.front, s.back, 1600, "spring(300,20,0)")
