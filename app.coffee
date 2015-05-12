
backgroundLayer = new BackgroundLayer
	backgroundColor: '#fff'

Framer.Defaults.Animation = {
	curve: "spring(100,25,0)"
}

# This imports all the layers for "Configuration" into configurationLayers2
s = Framer.Importer.load "imported/location"

s.container.draggable.enabled = true
s.container.draggable.speedY = 0
s.region2.visible = true
s.region2.opacity = 0
s.location2.visible = true
s.location2.opacity = 0

s.north_tooltip.opacity = 0

s.card2.on Events.Click, ->
	s.container.animate
		properties: {x: -920}
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

s.card3.on Events.Click, ->
	s.container.animate
		properties: {x: -1840}
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

s.card1.on Events.Click, ->
	s.container.animate
		properties: {x: 0}
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


s.east.on Events.Click, ->
	s.container.animate
		properties: {x: -1840}
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

s.north.on Events.Click, ->
	s.container.animate
		properties: {x: -0}
	s.bottom_bar.animate
		properties: {x: -0}

	s.region1.animate
		properties: {opacity: 1}
	s.region2.animate
		properties: {opacity: 0}

	s.north_tooltip.animate
		properties: {opacity: 0}
	s.east_tooltip.animate
		properties: {opacity: 1}

	s.location1.animate
		properties: {opacity: 1}
	s.location2.animate
		properties: {opacity: 0}

