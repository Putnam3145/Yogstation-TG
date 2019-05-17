#define PINPOINTER_MINIMUM_RANGE 1
#define PINPOINTER_PING_TIME 40

/datum/antagonist/thanos
	name = "Balance Seeker"
	roundend_category = "balance seeker" //just in case
	antagpanel_category = "Wizard"
	job_rank = ROLE_THANOS
	antag_moodlet = /datum/mood_event/focused
	can_hijack = HIJACK_HIJACKER
	var/datum/outfit/antag_outfit = /datum/outfit/thanos //the actual only differences are name and outfit, a minion can carry on the work
	var/datum/team/thanos/thanos_team

/datum/antagonist/thanos/on_gain()
	if(!owner)
		return
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return
	H.delete_equipment()
	H.set_species(/datum/species/human)
	H.equipOutfit(antag_outfit)
	. = ..()

/datum/antagonist/thanos/proc/register()
	SSticker.mode.balance_seekers |= owner

/datum/antagonist/thanos/proc/unregister()
	SSticker.mode.balance_seekers -= owner

/datum/antagonist/thanos/greet()
	to_chat(owner, "<span class='boldannounce'>You are the Gauntlet-bearer!</span>")
	to_chat(owner, "<B>You must gather the infinity gems and bring balance to the universe!</B>")
	to_chat(owner, "You have a pinpointer showing you where a nearby gem is at all times.")
	to_chat(owner, "Once you have a gem, simply place it into the infinity gauntlet and you gain its powers!.")
	to_chat(owner, "You have already found the space gem, which you may use to travel to the station.")

/datum/antagonist/thanos/farewell()
	to_chat(owner, "<span class='userdanger'>Oh god, what were you thinking? The population's going to bounce back in 50 years anyway...</span>")

/datum/antagonist/thanos/apply_innate_effects()
	.=..()
	if(owner && owner.current)

/datum/antagonist/thanos/remove_innate_effects()
	.=..()
	if(owner && owner.current)

/datum/antagonist/thanos/minion
	name = "Minion"
	antag_outfit = /datum/outfit/thanos_minion

/datum/antagonist/thanos/minion/greet()
	to_chat(owner, "<span class='boldannounce'>You are a child of the Gauntlet-barer!</span>")
	to_chat(owner, "<B>Help the bearer gather the infinity gems and bring balance to the universe!</B>")
	to_chat(owner, "You have a pinpointer showing you where a nearby gem is at all times.")
	to_chat(owner, "Once you have a gem, give it to the gauntlet-bearer so they may use its powers!.")
	to_chat(owner, "When the bearer is ready, you will be sent onto the station by the bearer to find the gems.")
