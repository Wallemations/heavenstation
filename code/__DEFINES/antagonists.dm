#define NUKE_RESULT_FLUKE 0
#define NUKE_RESULT_NUKE_WIN 1
#define NUKE_RESULT_CREW_WIN 2
#define NUKE_RESULT_CREW_WIN_SYNDIES_DEAD 3
#define NUKE_RESULT_DISK_LOST 4
#define NUKE_RESULT_DISK_STOLEN 5
#define NUKE_RESULT_NOSURVIVORS 6
#define NUKE_RESULT_WRONG_STATION 7
#define NUKE_RESULT_WRONG_STATION_DEAD 8

//fugitive end results
#define FUGITIVE_RESULT_BADASS_HUNTER 0
#define FUGITIVE_RESULT_POSTMORTEM_HUNTER 1
#define FUGITIVE_RESULT_MAJOR_HUNTER 2
#define FUGITIVE_RESULT_HUNTER_VICTORY 3
#define FUGITIVE_RESULT_MINOR_HUNTER 4
#define FUGITIVE_RESULT_STALEMATE 5
#define FUGITIVE_RESULT_MINOR_FUGITIVE 6
#define FUGITIVE_RESULT_FUGITIVE_VICTORY 7
#define FUGITIVE_RESULT_MAJOR_FUGITIVE 8

#define APPRENTICE_DESTRUCTION "destruction"
#define APPRENTICE_BLUESPACE "bluespace"
#define APPRENTICE_ROBELESS "robeless"
#define APPRENTICE_HEALING "healing"


//Blob
/// blob gets a free reroll every X time
#define BLOB_REROLL_TIME 2400
#define BLOB_SPREAD_COST 4
/// blob refunds this much if it attacks and doesn't spread
#define BLOB_ATTACK_REFUND 2
#define BLOB_REFLECTOR_COST 15


//ERT Types
#define ERT_BLUE "Blue"
#define ERT_RED  "Red"
#define ERT_AMBER "Amber"
#define ERT_DEATHSQUAD "Deathsquad"

//ERT subroles
#define ERT_SEC "sec"
#define ERT_MED "med"
#define ERT_ENG "eng"
#define ERT_LEADER "leader"
#define DEATHSQUAD "ds"
#define DEATHSQUAD_LEADER "ds_leader"

//Shuttle hijacking
/// Does not stop hijacking but itself won't hijack
#define HIJACK_NEUTRAL 0
/// Needs to be present for shuttle to be hijacked
#define HIJACK_HIJACKER 1
/// Prevents hijacking same way as non-antags
#define HIJACK_PREVENT 2

//Syndicate Contracts
#define CONTRACT_STATUS_INACTIVE 1
#define CONTRACT_STATUS_ACTIVE 2
#define CONTRACT_STATUS_BOUNTY_CONSOLE_ACTIVE 3
#define CONTRACT_STATUS_EXTRACTING 4
#define CONTRACT_STATUS_COMPLETE 5
#define CONTRACT_STATUS_ABORTED 6

#define CONTRACT_PAYOUT_LARGE 1
#define CONTRACT_PAYOUT_MEDIUM 2
#define CONTRACT_PAYOUT_SMALL 3

#define CONTRACT_UPLINK_PAGE_CONTRACTS "CONTRACTS"
#define CONTRACT_UPLINK_PAGE_HUB "HUB"

///It is faster as a macro than a proc
#define IS_HERETIC(mob) (mob.mind?.has_antag_datum(/datum/antagonist/heretic))
#define IS_HERETIC_MONSTER(mob) (mob.mind?.has_antag_datum(/datum/antagonist/heretic_monster))

#define PATH_SIDE "Side"

#define PATH_ASH "Ash"
#define PATH_RUST "Rust"
#define PATH_FLESH "Flesh"

#define CAN_SEE_EXPOITABLE_INFO (1<<0)

/// Initial / base TC for advanced traitors.
#define TRAITOR_PLUS_INITIAL_TC 8
/// Max amount of TC advanced traitors can get.
#define TRAITOR_PLUS_MAX_TC 40

/// Initial / base processing points for malf AI advanced traitors.
#define TRAITOR_PLUS_INITIAL_MALF_POINTS 20
/// Max amount of processing points for malf AI advanced traitors.
#define TRAITOR_PLUS_MAX_MALF_POINTS 60

/// Max amount of goals an advanced traitor can add.
#define TRAITOR_PLUS_MAX_GOALS 5
/// Max amount of similar objectives an advanced traitor can add.
#define TRAITOR_PLUS_MAX_SIMILAR_OBJECTIVES 5

/// Max char length of goals.
#define TRAITOR_PLUS_MAX_GOAL_LENGTH 250
/// Max chat length of notes.
#define TRAITOR_PLUS_MAX_NOTE_LENGTH 175

/// List of strings - Intensity levels for advanced traitors.
/// The first char is converted to a num when selected.
#define TRAITOR_PLUS_INTENSITIES list( \
	"5 = Mass killings, destroying entire departments", \
	"4 = Mass sabotage (engine delamination)", \
	"3 = Assassination / Grand Theft", \
	"2 = Kidnapping / Theft", \
	"1 = Minor theft or basic antagonizing" )
