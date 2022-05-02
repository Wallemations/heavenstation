// -- Extra mob/ level procs and extensions --
// This is pretty much just a mirror of atom/proc/prepare_huds().
// There's probably be a better way of doing this...

//Yes I just took this from Maplestation, Melbert fixes problems I have before I even get to them.
/atom/proc/prepare_heavenstation_huds()
	hud_list = list()
	for(var/hud in hud_possible)
		var/hint = hud_possible[hud]
		switch(hint)
			if(HUD_LIST_LIST)
				hud_list[hud] = list()
			else
				var/image/I = image('modular_heaven/modules/jobs/cards/huds.dmi', src, "")
				I.appearance_flags = RESET_COLOR|RESET_TRANSFORM
				hud_list[hud] = I
