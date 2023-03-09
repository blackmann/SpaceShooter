extends Label

func _process(delta):
	text = "SC %0*d" % [5, Global.score]
