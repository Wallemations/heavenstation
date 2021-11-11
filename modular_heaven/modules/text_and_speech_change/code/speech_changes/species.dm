/// -- Extensions of species and species procs. --
/datum/species
	/// Assoc list of [sounds that play on speech for mobs of this species] to [volume].
	var/species_speech_sounds = list('modular_heaven/modules/text_and_speech_change/sounds/speak_1.ogg' = 120, \
									'modular_heaven/modules/text_and_speech_change/sounds/speak_2.ogg' = 120, \
									'modular_heaven/modules/text_and_speech_change/sounds/speak_3.ogg' = 120, \
									'modular_heaven/modules/text_and_speech_change/sounds/speak_4.ogg' = 120)
	/// Assoc list of [sounds that play on question for mobs of this species] to [volume].
	var/species_speech_sounds_ask = list('modular_heaven/modules/text_and_speech_change/sounds/speak_1_ask.ogg' = 120, \
										'modular_heaven/modules/text_and_speech_change/sounds/speak_2_ask.ogg' = 120, \
										'modular_heaven/modules/text_and_speech_change/sounds/speak_3_ask.ogg' = 120, \
										'modular_heaven/modules/text_and_speech_change/sounds/speak_4_ask.ogg' = 120)
	/// Assoc list of [sounds that play on exclamation for mobs of this species] to [volume].
	var/species_speech_sounds_exclaim = list('modular_heaven/modules/text_and_speech_change/sounds/speak_1_exclaim.ogg' = 120, \
											'modular_heaven/modules/text_and_speech_change/sounds/speak_2_exclaim.ogg' = 120, \
											'modular_heaven/modules/text_and_speech_change/sounds/speak_3_exclaim.ogg' = 120, \
											'modular_heaven/modules/text_and_speech_change/sounds/speak_4_exclaim.ogg' = 120)
