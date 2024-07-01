
/*
Town access doors
Sheriff/Deputy, Gatehouse etc: 62 ACCESS_GATEWAY
General access: 25 ACCESS_BAR
Clinic surgery/storage: 68 ACCESS_CLONING
Shopkeeper: 34 ACCESS_CARGO_BOT
Barkeep : 28 ACCESS_KITCHEN - you jebronis made default bar for no reason bruh
Banker : 48 ACCESS_MINING
Mayor : 4 ACCESS_FORENSICS_LOCKERS
here's a tip, go search DEFINES/access.dm

Slowly fixing town access because FUCK, someone handed the BoS Bar/Kitchen access which gives them free access to General Town and Bighorn's bar.
General Access : 136 ACCESS_TOWN
Barkeep : 137 ACCESS_TOWN_BAR
Reactor : 138 ACCESS_FUSION
Shopkeeper : 139 ACCESS_SHOPKEEP
Banker Shutters? : 52 ACCESS_MINT_VAULT

Will probably start phasing more of this to actual custom access as we go.

*/

/datum/job/bighorn
	exp_type = EXP_TYPE_BIGHORN
	faction = FACTION_BIGHORN

/*
Mayor
*/

/datum/job/bighorn/f13mayor
	title = "Mayor"
	flag = F13MAYOR
	department_flag = DEP_BIGHORN
	total_positions = 1
	spawn_positions = 1
	supervisors = "Dusty Trails Caravan Company"
	description = "You are the overseer of the company town of Waypoint, owned by the Dusty Trails Caravan Company. \
	 You have been entrusted by the Company to protect citizens, distribute funds, and make beneficial deals with the regional powers. \
	 The mercenaries defending Waypoint are under your control, though matters are often left to your subordinate the Lieutenant. \
	 There is great flexibility for personal gain and to run things as you see fit, but always remember your true benefactors."
	selection_color = "#d7b088"
	exp_type = EXP_TYPE_BIGHORN
	exp_requirements = 1440
	outfit = /datum/outfit/job/bighorn/f13mayor
	access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_FORENSICS_LOCKERS, ACCESS_FUSION, ACCESS_TOWN)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_FORENSICS_LOCKERS, ACCESS_FUSION, ACCESS_TOWN)

/datum/outfit/job/bighorn/f13mayor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, REF(src))
	ADD_TRAIT(H, TRAIT_GENERIC, REF(src))

/datum/outfit/job/bighorn/f13mayor
	name = "Mayor"
	jobtype = 	/datum/job/bighorn/f13mayor
	ears =		/obj/item/radio/headset/headset_sheriff
	id =		/obj/item/card/id/silver/mayor
	backpack = 	/obj/item/storage/backpack/satchel/explorer
	satchel = 	/obj/item/storage/backpack/satchel/explorer
	l_pocket = 	/obj/item/storage/bag/money/small/settler
	r_pocket = 	/obj/item/flashlight/flare
	belt = 		/obj/item/gun/ballistic/revolver/colt357
	shoes = 	/obj/item/clothing/shoes/laceup
	uniform = 	/obj/item/clothing/under/suit/checkered
	suit = 		/obj/item/clothing/suit/armor/f13/kit
	head = 		/obj/item/clothing/head/fedora
	backpack_contents = list(
		/obj/item/clothing/head/f13/town/big = 1,
		/obj/item/storage/box/citizenship_permits = 1,
		/obj/item/ammo_box/a357 = 2,
		/obj/item/pen/fountain/captain = 1,
		/obj/item/storage/bag/money/small/mayor = 1, //Cash for payouts. Incredible amount, seeing as next to the Banker, he's the closest thing to a treasury keeper.
		/obj/item/pda = 1,
		)
/*--------------------------------------------------------------*/
/datum/job/bighorn/f13sheriff
	title = "Lieutenant"
	flag = F13SHERIFF
	department_flag = DEP_BIGHORN
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Mayor and Dusty Trails Caravan Company"
	description = "You are the chief law enforcer of the company town of Waypoint, owned by the Dusty Trails Caravan Company. \
	 You have been entrusted by the Company to keep the peace, settle local disputes, and keep townsfolk safe and alive. \
	 The mercenaries defending Waypoint are under your management, though ultimately answer to the Mayor. \
	 Never leave the town undefended, utilising bounties or trusty mercenaries on missions far beyond the walls."

	selection_color = "#d7b088"
	exp_type = EXP_TYPE_BIGHORN
	exp_requirements = 1200
	outfit = /datum/outfit/job/bighorn/f13sheriff
	access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_FUSION, ACCESS_TOWN)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_FUSION, ACCESS_TOWN)

/datum/outfit/job/bighorn/f13sheriff
	name = "Lieutenant"
	jobtype = /datum/job/bighorn/f13sheriff
	id = /obj/item/card/id/dogtag/sheriff
	backpack = /obj/item/storage/backpack/enclave
	satchel = /obj/item/storage/backpack/satchel/enclave
	ears = /obj/item/radio/headset/headset_sheriff
	uniform = /obj/item/clothing/under/syndicate/mercpadded
	belt = /obj/item/storage/belt/military/army
	neck = /obj/item/storage/belt/holster/townlt
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/f13/military
	suit = /obj/item/clothing/suit/armor/f13/usmcriot/dusty
	head = /obj/item/clothing/head/helmet/f13/enclave/usmcriot/dusty
	l_pocket = /obj/item/storage/bag/money/small/bighorn
	r_pocket = /obj/item/flashlight/flare

	backpack_contents = list(
		/obj/item/storage/box/deputy_badges=1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/melee/classic_baton=1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/book/granter/crafting_recipe/ODF = 1)

/datum/outfit/job/bighorn/f13sheriff/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/combatcarbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/combatrifle)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, REF(src))
	ADD_TRAIT(H, TRAIT_LIFEGIVER, REF(src))
	ADD_TRAIT(H, TRAIT_SELF_AWARE,REF(src))
	ADD_TRAIT(H, TRAIT_IRONFIST, REF(src))
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)

/*--------------------------------------------------------------*/
/datum/job/bighorn/f13deputy
	title = "Mercenary"
	flag = F13DEPUTY
	department_flag = DEP_BIGHORN
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Mayor, Lieutenant and Dusty Trails Caravan Company"
	description = "You are a hired law enforcer of the company town of Waypoint, owned by the Dusty Trails Caravan Company. \
	 You have been entrusted by the Company to keep the peace, settle local disputes, and keep townsfolk safe and alive. \
	 Patrol town, the perimeter of the walls, and follow the orders of the Lieutenant, and their superior the Mayor. \
	 Never leave the town undefended, yet orders may send you further afield on bounties or doomed diplomatic missions."
	selection_color = "#dcba97"
	exp_type = EXP_TYPE_BIGHORN
	exp_requirements = 600
	outfit = /datum/outfit/job/bighorn/f13deputy
	access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_FUSION, ACCESS_TOWN)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_FUSION, ACCESS_TOWN)

	loadout_options = list(
		/datum/outfit/loadout/waypointmerca,
		/datum/outfit/loadout/waypointmercb,
		)

/datum/outfit/job/bighorn/f13deputy
	name = "Mercenary"
	jobtype = /datum/job/bighorn/f13deputy
	ears = /obj/item/radio/headset/headset_sheriff
	id = /obj/item/card/id/dogtag/deputy
	backpack = /obj/item/storage/backpack/enclave
	satchel = /obj/item/storage/backpack/satchel/enclave
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	belt = /obj/item/storage/belt/military/army
	neck = /obj/item/storage/belt/holster/legholster
	shoes = /obj/item/clothing/shoes/jackboots
	uniform = /obj/item/clothing/under/syndicate/mercpadded
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/ammo_box/a357 = 2,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/book/granter/crafting_recipe/ODF = 1,
		)

/datum/outfit/loadout/waypointmerca
	name = "Militarised Officer"
	head = /obj/item/clothing/head/helmet/f13/combat/swat/dusty
	suit = /obj/item/clothing/suit/armor/f13/combat/dusty
	suit_store = /obj/item/gun/ballistic/automatic/infantry_rifle
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m5mm = 1,
		)

/datum/outfit/loadout/waypointmercb
	name = "Frontier Justicier"
	head = /obj/item/clothing/head/cowboyhat/black/dusty
	suit = /obj/item/clothing/suit/armor/f13/leather_jacket/combat/dusty
	suit_store = /obj/item/gun/ballistic/shotgun/police
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		)

/datum/outfit/job/bighorn/f13deputy/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/combatcarbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/combatrifle)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, REF(src))

/*--------------------------------------------------------------*/

/datum/job/bighorn/f13barkeep
	title = "Barkeep"
	flag = F13BARKEEP
	department_flag = DEP_BIGHORN
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Mayor, Lieutenant and Dusty Trails Caravan Company"
	description = "You are a hired contractor of the company town of Waypoint, owned by the Dusty Trails Caravan Company. \
	 You have been entrusted by the Company to run a place of food, drink, and rest for the populace. \
	 While you have full domain over the running of your business, remember to work in the interests of your superiors."
	selection_color = "#dcba97"
	exp_type = EXP_TYPE_BIGHORN
	exp_requirements = 90

	outfit = /datum/outfit/job/bighorn/f13barkeep

	loadout_options = list(
	/datum/outfit/loadout/rugged,
	/datum/outfit/loadout/frontier,
	/datum/outfit/loadout/richmantender,
	/datum/outfit/loadout/diner)

	access = list(ACCESS_BAR, ACCESS_KITCHEN, ACCESS_TOWN_BAR, ACCESS_TOWN, ACCESS_FUSION)
	minimal_access = list(ACCESS_BAR, ACCESS_KITCHEN, ACCESS_TOWN_BAR, ACCESS_TOWN)


/datum/outfit/job/bighorn/f13barkeep
	name = "Barkeep"
	jobtype = /datum/job/bighorn/f13barkeep

	uniform = /obj/item/clothing/under/f13/bartenderalt
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	belt = /obj/item/gun/ballistic/revolver/caravan_shotgun
	shoes = /obj/item/clothing/shoes/workboots/mining
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/ammo_box/shotgun/bean = 2,
		/obj/item/book/manual/nuka_recipes = 1,
		/obj/item/stack/f13Cash/caps/onezerozero = 1,
		/obj/item/reagent_containers/food/drinks/bottle/rotgut = 1,
		)

/datum/outfit/loadout/rugged
	name = "Rugged"
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat
	uniform = /obj/item/clothing/under/f13/cowboyb
	suit = /obj/item/clothing/suit/f13/cowboybvest
	gloves = /obj/item/clothing/gloves/color/brown
	shoes = /obj/item/clothing/shoes/f13/brownie

/datum/outfit/loadout/frontier
	name = "Frontier"
	head = /obj/item/clothing/head/bowler
	mask = /obj/item/clothing/mask/fakemoustache
	uniform = /obj/item/clothing/under/f13/westender
	suit = /obj/item/clothing/suit/f13/westender
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/f13/fancy

/datum/outfit/loadout/richmantender
	name = "Fancy"
	head = /obj/item/clothing/head/fedora
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/bartender
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/f13/fancy
	neck = /obj/item/clothing/neck/tie/black

/datum/outfit/loadout/diner
	name = "Diner"
	glasses = /obj/item/clothing/glasses/orange
	uniform = /obj/item/clothing/under/f13/brahminf
	neck = /obj/item/clothing/neck/apron/chef
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/f13/military/ncr

/*-----------------------------------------------------*/

/datum/job/bighorn/f13shopkeeper
	title = "Shopkeeper"
	flag = F13SHOPKEEPER
	department_flag = DEP_BIGHORN
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Mayor, Lieutenant and Dusty Trails Caravan Company"
	description = "You are a hired contractor of the company town of Waypoint, owned by the Dusty Trails Caravan Company. \
	 You have been entrusted by the Company to run a store and have been given a generous initial stock. \
	 While you have full domain over the running of your business, remember to work in the interests of your superiors."
	selection_color = "#dcba97"
	exp_type = EXP_TYPE_BIGHORN
	exp_requirements = 400

	outfit = /datum/outfit/job/bighorn/f13shopkeeper
	access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_TOWN, ACCESS_SHOPKEEP, ACCESS_FUSION)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_TOWN, ACCESS_SHOPKEEP)

/datum/outfit/job/bighorn/f13shopkeeper
	name = "Shopkeeper"
	jobtype = /datum/job/bighorn/f13shopkeeper

	id = /obj/item/card/id/dogtag/town
	uniform = /obj/item/clothing/under/f13/roving
	ears = /obj/item/radio/headset/headset_town
	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	gloves = /obj/item/clothing/gloves/fingerless
	l_pocket = /obj/item/storage/bag/money/small/bighorn
	r_pocket = /obj/item/flashlight/glowstick
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list(/obj/item/storage/box/shopkeeper = 1)

/datum/outfit/job/bighorn/f13shopkeeper/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, REF(src))
	ADD_TRAIT(H, TRAIT_GENERIC, REF(src))
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)

	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/trail_carbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/smg22)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/varmintrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/thatgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/uzi)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/smg10mm)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/frag_shrapnel)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/concussion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/explosive/shrapnelmine)

/datum/outfit/job/bighorn/f13shopkeeper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/*--------------------------------------------------------------*/

/datum/job/bighorn/f13settler
	title = "Citizen"
	flag = F13SETTLER
	department_flag = DEP_BIGHORN
	total_positions = -1
	spawn_positions = -1
	supervisors = "the Mayor, Lieutenant and Dusty Trails Caravan Company"
	description = "You are a citizen of the company town of Waypoint, owned by the Dusty Trails Caravan Company. \
	In return for their protection you are expected to help maintain the streets and set an example as a law-abiding townsperson. \
	You may occasionally be contracted out to the Lieutenant or their superior the Mayor, for some dark task or another."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/bighorn/f13settler

	loadout_options = list(
		/datum/outfit/loadout/provisioner,
		/datum/outfit/loadout/groundskeeper,
		/datum/outfit/loadout/farmer,
		/datum/outfit/loadout/artisan,
		/datum/outfit/loadout/outdoorsman,
		/datum/outfit/loadout/militia,
		/datum/outfit/loadout/singer,
	)
	access = list(ACCESS_BAR, ACCESS_FUSION, ACCESS_TOWN)
	minimal_access = list(ACCESS_BAR)

// Waystation Preacher
/datum/job/bighorn/f13preacher
	title = "Preacher"
	flag = F13PREACHER
	faction = FACTION_WASTELAND
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Mayor, Lieutenant and Dusty Trails Caravan Company"
	description = "You are a citizen of the company town of Waypoint, owned by the Dusty Trails Caravan Company. \
	In return for their protection you are expected to help maintain the spirits of the townsfolk and manage ceremonies. \
	Of course, you are no contractor to the Company like the Barkeep or Merchant. Following your faith may take you on a divergent path."
	selection_color = "#dcba97"
	exp_type = EXP_TYPE_BIGHORN
	exp_requirements = 90

	outfit = /datum/outfit/job/bighorn/f13preacher

	// Most of these loadout options are made for flavor but balanced for preacher being a single person.
	// That said, nothing could really be considered end game. -Possum
	loadout_options = list(
	/datum/outfit/loadout/rural_preacher, 	// Part preacher part farmer, good for druid types but not tribals.
	/datum/outfit/loadout/forge_priest, 	// Kind of a mix between tech priest and wasteland smith.
	/datum/outfit/loadout/warrior_priest,	// Finally, we can be a badass priest without roman larping.
	/datum/outfit/loadout/gun_priest,		// Badass gunslinging priest.
	/datum/outfit/loadout/healing_priest,	// Because religion can be more than violence.
	/datum/outfit/loadout/monk,				// Inward perfection!
	/datum/outfit/loadout/atom,				// Flavor from setting.
	/datum/outfit/loadout/hubology	 		// Flavor from setting.
	)

	access = list(ACCESS_BAR, ACCESS_TOWN, ACCESS_CHAPEL_OFFICE, ACCESS_FUSION)		//we can expand on this and make alterations as people suggest different loadouts
	minimal_access = list(ACCESS_BAR, ACCESS_TOWN, ACCESS_CHAPEL_OFFICE)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/wasteland/f13wastelander,
		),
	)


// A preacher who tills the land and the soil, a cowboy.
/datum/outfit/loadout/rural_preacher
	name = "Rural Preacher"
	backpack_contents = list(
		/obj/item/nullrod = 1,
		/obj/item/clothing/head/f13/cowboy = 1,
		/obj/item/clothing/shoes/f13/cowboy = 1,
		/obj/item/clothing/suit/f13/cowboybvest = 1,
		/obj/item/clothing/under/f13/cowboyb = 1,
		/obj/item/storage/belt = 1,
		/obj/item/stack/sheet/metal/fifty = 1,
		/obj/item/stack/sheet/mineral/wood/fifty = 1,
		/obj/item/pickaxe/mini = 1,
		/obj/item/cultivator = 1,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/storage/bag/plants/portaseeder = 1,
		/obj/item/gun/ballistic/shotgun/trench = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/book/granter/trait/trekking = 1
	) // Basically wastelander settler with a shotgun.

// A preacher who relies on technology, a wasteland savant.
/datum/outfit/loadout/forge_priest
	name = "Forge Priest"
	backpack_contents = list(
		/obj/item/nullrod = 1,
		/obj/item/clothing/shoes/f13/explorer = 1,
		/obj/item/clothing/gloves/f13/blacksmith = 1,
		/obj/item/clothing/neck/apron/labor/forge/khan = 1,
		/obj/item/storage/belt/utility/artisan/full = 1,
		/obj/item/clothing/glasses/welding = 1,
		/obj/item/stack/sheet/metal/fifty = 1,
		/obj/item/stack/sheet/mineral/sandstone/twenty = 1,
		/obj/item/stack/sheet/mineral/titanium/fifteen = 1,
		/obj/item/stack/sheet/mineral/wood = 10,
		/obj/item/lighter = 1,
		/obj/item/reagent_containers/glass/beaker = 1,
		/obj/item/screwdriver = 1,
		/obj/item/crowbar = 1,
		/obj/item/wrench = 1,
		/obj/item/wirecutters = 1,
		/obj/item/stack/crafting/metalparts = 5,
		/obj/item/book/granter/trait/techno = 1
	) // No weapons, you should be crafting them or using your null rod.

// A preacher who brings god's enemies to the sword, a warrior of faith.
/datum/outfit/loadout/warrior_priest
	name = "Witch Hunter"
	backpack_contents = list(
		/obj/item/nullrod = 1,
		/obj/item/clothing/suit/armor/riot/chaplain/witchhunter = 1,
		/obj/item/clothing/head/helmet/chaplain/witchunter_hat = 1,
		/obj/item/clothing/gloves/legion/plated = 1,
		/obj/item/clothing/shoes/f13/military/plated = 1,
		/obj/item/shield/riot/tower/scrap = 1,
		/obj/item/book/granter/trait/bigleagues = 1
	) // Nullrod is your melee weapon, but you get lovely armor on par with the town steel bib and heavy steel helmet with a tower shield.

// A preacher who delivers lead clots to god's enemies, a gunslinger.
/datum/outfit/loadout/gun_priest
	name = "Iron Priest"
	backpack_contents = list(
		/obj/item/nullrod = 1,
		/obj/item/grenade/homemade/coffeepotbomb = 2,
		/obj/item/gun/ballistic/revolver/m29 = 1,
		/obj/item/ammo_box/m44 = 2,
		/obj/item/ammo_box/m44box = 1,
		/obj/item/clothing/suit/armor/f13/leather_jacket/combat/coat = 1, // 10/10 drip
		/obj/item/book/granter/trait/gunslinger = 1
	) // Basically the cleanser but with a null rod and decent light armor.

// A priest who remembers a majority of them are charitable healers, a doctor of god.
/datum/outfit/loadout/healing_priest
	name = "Faith Healer"
	backpack_contents = list(
		/obj/item/nullrod = 1,
		/obj/item/clothing/neck/stethoscope = 1,
		/obj/item/storage/belt/medical = 1,
		/obj/item/reagent_containers/medspray/synthflesh = 1,
		/obj/item/smelling_salts = 1,
		/obj/item/healthanalyzer = 1,
		/obj/item/reagent_containers/glass/bottle/epinephrine = 1,
		/obj/item/storage/backpack/duffelbag/med/surgery = 1,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/nullrod/rosary = 1,
		/obj/item/book/granter/trait/midsurgery
	) // Wasteland doctor with a null rod.

// A priest who looks inward for answers, a pious monk.
/datum/outfit/loadout/monk
	name = "Monk"
	backpack_contents = list(
		/obj/item/nullrod = 1,
		/obj/item/clothing/shoes/f13/rag = 1,
		/obj/item/clothing/gloves/fingerless/pugilist/chaplain = 1,
		/obj/item/nullrod/rosary = 1,
		/obj/item/clothing/suit/hooded/robes = 1,
		/obj/item/book/granter/trait/iron_fist = 1
	) // Mostly for flavor, but starting with a rosary and gloves is a really nice bonus.

// Division is truth.
/datum/outfit/loadout/atom
	name = "Atom's Light"
	backpack_contents = list(
		/obj/item/nullrod = 1,
		/obj/item/clothing/suit/armor/f13/atomzealot = 1,
		/obj/item/clothing/under/f13/atombomb/atombeliever = 1,
		/obj/item/grenade/f13/radiation = 2,
		/obj/item/reagent_containers/blood/radaway = 2,
		/obj/item/book/granter/trait/explosives = 1 // So we can give people division with force.
	) // Mostly for flavor. The under clothes does give 100 rad protection though and the grenades could be fun if not really deadly.

// For the right price, you too can be saved!
/datum/outfit/loadout/hubology
	name = "Hubologist"
	backpack_contents = list(
		/obj/item/nullrod = 1,
		/obj/item/clothing/suit/f13/hubologist = 1,
		/obj/item/stack/f13Cash/caps/onezerozerozero = 1,
		/obj/item/stack/f13Cash/caps/onezerozerozero = 1,
		/obj/item/book/granter/trait/medical = 1 // You have some form of training to make those rad devices they use in lore.
	) // Mostly for flavor. Hubology is heavily focused on getting caps (snrk) so you at least start with alot more.

/datum/job/bighorn/f13preacher/after_spawn(mob/living/H, mob/M)
	. = ..()
	if(H.mind)
		H.mind.isholy = TRUE

	var/obj/item/storage/book/bible/booze/B = new

	if(GLOB.religion)
		B.deity_name = GLOB.deity
		B.name = GLOB.bible_name
		B.icon_state = GLOB.bible_icon_state
		B.item_state = GLOB.bible_item_state
		to_chat(H, "There is already an established religion in these parts. You are an acolyte of [GLOB.deity]. Defer to the Preacher.")
		H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)
		var/nrt = GLOB.holy_weapon_type || /obj/item/nullrod
		var/obj/item/nullrod/N = new nrt(H)
		H.put_in_hands(N)
		return

	var/new_religion = DEFAULT_RELIGION
	if(M.client && M.client.prefs.custom_names["religion"])
		new_religion = M.client.prefs.custom_names["religion"]

	var/new_deity = DEFAULT_DEITY
	if(M.client && M.client.prefs.custom_names["deity"])
		new_deity = M.client.prefs.custom_names["deity"]

	B.deity_name = new_deity


	switch(lowertext(new_religion))
		if("christianity") // DEFAULT_RELIGION
			B.name = pick("The Holy Bible","The Dead Sea Scrolls")
		if("buddhism")
			B.name = "The Sutras"
		if("clownism","honkmother","honk","honkism","comedy")
			B.name = pick("The Holy Joke Book", "Just a Prank", "Hymns to the Honkmother")
		if("chaos")
			B.name = "The Book of Lorgar"
		if("cthulhu")
			B.name = "The Necronomicon"
		if("hinduism")
			B.name = "The Vedas"
		if("homosexuality")
			B.name = pick("Guys Gone Wild","Coming Out of The Closet")
		if("imperium")
			B.name = "Uplifting Primer"
		if("islam")
			B.name = "Quran"
		if("judaism")
			B.name = "The Torah"
		if("lampism")
			B.name = "Fluorescent Incandescence"
		if("lol", "wtf", "gay", "penis", "ass", "poo", "badmin", "shitmin", "deadmin", "cock", "cocks", "meme", "memes")
			B.name = pick("Woodys Got Wood: The Aftermath", "War of the Cocks", "Sweet Bro and Hella Jef: Expanded Edition", "F.A.T.A.L. Rulebook")
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 100) // starts off dumb as fuck
		if("monkeyism","apism","gorillism","primatism")
			B.name = pick("Going Bananas", "Bananas Out For Harambe")
		if("mormonism")
			B.name = "The Book of Mormon"
		if("pastafarianism")
			B.name = "The Gospel of the Flying Spaghetti Monster"
		if("rastafarianism","rasta")
			B.name = "The Holy Piby"
		if("satanism")
			B.name = "The Unholy Bible"
		if("science")
			B.name = pick("Principle of Relativity", "Quantum Enigma: Physics Encounters Consciousness", "Programming the Universe", "Quantum Physics and Theology", "String Theory for Dummies", "How To: Build Your Own Warp Drive", "The Mysteries of Bluespace", "Playing God: Collector's Edition")
		if("scientology")
			B.name = pick("The Biography of L. Ron Hubbard","Dianetics")
		if("servicianism", "partying")
			B.name = "The Tenets of Servicia"
			B.deity_name = pick("Servicia", "Space Bacchus", "Space Dionysus")
			B.desc = "Happy, Full, Clean. Live it and give it."
		if("subgenius")
			B.name = "Book of the SubGenius"
		if("toolboxia","greytide")
			B.name = pick("Toolbox Manifesto","iGlove Assistants")
		if("weeaboo","kawaii")
			B.name = pick("Fanfiction Compendium","Japanese for Dummies","The Manganomicon","Establishing Your O.T.P")
		else
			B.name = "The Holy Book of [new_religion]"

	GLOB.religion = new_religion
	GLOB.bible_name = B.name
	GLOB.deity = B.deity_name

	H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)

	SSblackbox.record_feedback("text", "religion_name", 1, "[new_religion]", 1)
	SSblackbox.record_feedback("text", "religion_deity", 1, "[new_deity]", 1)


/datum/outfit/job/bighorn/f13preacher
	name = "Preacher"
	jobtype = /datum/job/bighorn/f13preacher

	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	belt = null
	uniform = 		/obj/item/clothing/under/f13/chaplain
	gloves =		/obj/item/clothing/gloves/fingerless
	shoes = 		/obj/item/clothing/shoes/jackboots
	r_pocket = 		/obj/item/flashlight/flare

	backpack =		/obj/item/storage/backpack/cultpack
	satchel = 		/obj/item/storage/backpack/cultpack
	backpack_contents = list(
		/obj/item/camera/spooky = 1,
		/obj/item/reagent_containers/food/drinks/flask = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/storage/fancy/candle_box = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/settler = 1,
		)
//end preacher

/datum/outfit/job/bighorn/f13settler
	name = "Citizen"
	jobtype = /datum/job/bighorn/f13settler
	ears = /obj/item/radio/headset/headset_town
	belt = null
	id = /obj/item/card/id/dogtag/town
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/jackboots
	backpack = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/book/granter/trait/selection
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/job/bighorn/f13settler/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)


/datum/outfit/loadout/provisioner
	name = "Provisioner"
	neck = /obj/item/clothing/neck/scarf/cptpatriot
	suit = /obj/item/clothing/suit/jacket/miljacket
	uniform = /obj/item/clothing/under/f13/merca
	gloves = /obj/item/clothing/gloves/f13/leather
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list(/obj/item/reagent_containers/food/drinks/flask = 1,
	/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
	/obj/item/ammo_box/magazine/m10mm = 1,
	)

/datum/outfit/loadout/groundskeeper
	name = "Groundskeeper"
	head = /obj/item/clothing/head/soft/grey
	belt = /obj/item/storage/belt
	suit = /obj/item/clothing/under/f13/mechanic
	gloves = /obj/item/clothing/gloves/color/yellow
	backpack_contents = list(/obj/item/storage/bag/trash = 1, /obj/item/reagent_containers/spray/cleaner = 1,
	/obj/item/gun/ballistic/revolver/hobo/piperifle = 1,
	/obj/item/ammo_box/a556mm/stripper = 2,
	)

/datum/outfit/loadout/farmer
	name = "Farmer"
	suit = /obj/item/clothing/suit/apron/overalls
	belt = /obj/item/storage/bag/plants
	gloves = /obj/item/clothing/gloves/botanic_leather
	shoes = /obj/item/clothing/shoes/workboots
	backpack_contents = list(
		/obj/item/cultivator=1,
		/obj/item/hatchet=1,
		/obj/item/shovel/spade=1,
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/ammo_box/magazine/m10mm = 1,
		)

/datum/outfit/loadout/artisan
	name = "Artisan"
	glasses = /obj/item/clothing/glasses/welding
	suit = /obj/item/clothing/under/f13/petrochico
	belt = /obj/item/storage/belt/utility
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	backpack_contents = list(/obj/item/twohanded/sledgehammer/simple = 1,
	/obj/item/stack/sheet/metal/twenty = 1,
	/obj/item/book/granter/crafting_recipe/ODF = 1,
	)

/datum/outfit/loadout/outdoorsman
	name = "Outdoorsman"
	head = /obj/item/clothing/head/f13/beaver
	suit = /obj/item/clothing/suit/f13/cowboybvest
	belt = /obj/item/storage/belt/bandolier
	uniform = /obj/item/clothing/under/f13/bartenderalt
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(/obj/item/fishingrod = 1,
	/obj/item/storage/fancy/cigarettes/cigars = 1,
	/obj/item/gun/ballistic/revolver/widowmaker = 1,
	/obj/item/ammo_box/shotgun/buck = 2,
	)

/datum/outfit/loadout/militia
	name = "Militia"
	head = /obj/item/clothing/head/helmet/armyhelmet
	suit = /obj/item/clothing/suit/armor/f13/metalarmor/steelbib
	uniform = /obj/item/clothing/under/f13/mercc
	r_hand = /obj/item/gun/ballistic/rifle/hunting
	gloves = /obj/item/clothing/gloves/f13/leather
	backpack_contents = list(/obj/item/ammo_box/a308 = 2,
	)

/datum/outfit/loadout/singer
	name = "Singer"
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(/obj/item/clothing/under/f13/classdress = 1,
	/obj/item/clothing/under/suit/black_really = 1,
	/obj/item/clothing/gloves/evening = 1,
	/obj/item/clothing/gloves/color/white = 1,
	/obj/item/gun/ballistic/revolver/police = 1,
	/obj/item/ammo_box/a357 = 2,
	)

/*--------------------------------------------------------------*/

/datum/job/bighorn/f13secretary
	title = "Secretary"
	flag = F13SECRETARY
	department_flag = DEP_BIGHORN
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Mayor, Lieutenant and Dusty Trails Caravan Company"
	description = "You are a hired contractor of the company town of Waypoint, owned by the Dusty Trails Caravan Company. \
	 You have been entrusted by the Company to handle paperwork and the menial tasks of the Lieutenant and their superior the Mayor. \
	 More quietly, you are expected to keep an eye on these two individuals and make sure they are aligned with Company goals."
	selection_color = "#dcba97"
	exp_type = EXP_TYPE_BIGHORN
	exp_requirements = 200
	outfit = /datum/outfit/job/bighorn/f13secretary
	access = list(ACCESS_BAR, ACCESS_FORENSICS_LOCKERS, ACCESS_FUSION)
	minimal_access = list(ACCESS_BAR, ACCESS_FORENSICS_LOCKERS)

/datum/outfit/job/bighorn/f13secretary
	name = "Secretary"
	jobtype = /datum/job/bighorn/f13secretary
	ears = 			/obj/item/radio/headset/headset_town
	l_pocket = /obj/item/storage/bag/money/small/settler
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(/obj/item/clothing/under/f13/classdress = 1,
	/obj/item/clothing/under/suit/black_really = 1,
	/obj/item/clothing/gloves/evening = 1,
	/obj/item/clothing/gloves/color/white = 1,
	/obj/item/pda = 1,
	)
