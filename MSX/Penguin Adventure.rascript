// Penguin Adventure
// #ID = 4025
// Penguin Adventure (Japan, Europe).rom (No-Intro)
// md5: 9c3b9492f2b565cbddf562195f540993 
// https://retroachievements.org/game/4025
// https://gamefaqs.gamespot.com/msx/582337-penguin-adventure/faqs/65535


// Challenges
// Finish Stage X with XXX or more time left
// Finish a stage without pressing left or right
// Finish a stage without slowing down past 6 bars (Hold up while starting until reaching 6 bars)


// ==== Distances / Bonus / Warp / Secret Bag====
//  1 - 600  / 420 / 240 / 
//  2 - 600  /     /     / 
//  3 - 800  / 380 / 147 / 297
//  4 - 500  /     /     / 
//  5 - 500  /     /     / 
//  6 - 600  /     /     / 
//  7 - 800  / 700 /     / 
//  8 - 600  /     /     / 
//  9 - 700  / 300 / 335 / 305
// 10 - 700  /     /     / 
// 11 - 700  / 300 /     / 
// 12 - 900  / 520 /     / 
// 13 - 700  /     / 335 / 580
// 14 - 600  /     /     / Crack
// 15 - 800  /     /  77 /
// 16 - 1100 /     /     / Pause
// 17 - 700  / 550 /     / 
// 18 - 1100 /     / 419 /
// 19 - 1200 /     /     / 
// 20 - 800  /     /     / 
// 21 - 1400 / 510 /     / 
// 22 - 1300 /     /     / 
// 23 - 1000 /     /     / 
// 24 - 1400 /     /     / 



// ==== Helper Functions ====
function game_state() => byte(0x2000)
title = 1
demo = 2
difficulty_select = 3
overworld = 4
playing = 5
stage_victory = 6
fighting_boss = 7
entering_bonus = 8
leaveing_bonus = 9
warp = 10
shop = 12
death = 14
game_over = 15

// Progression Helpers
function current_level() => byte(0x2082)
function current_stage() => byte(0x2091)
function current_scene() => byte(0x2cb2)

// Etc Helpers
function current_lives() => byte(0x2090)
function current_fish() => word(0x2089)
function current_speed() => byte(0x24c0)
function current_bonus_fish() => byte(0x20d0)
function current_fish_bet() => word(0x2135)
function shop_type() => byte(0x20a2)
santa = 5
function slot_status() => byte(0x212a)
dispensing = 9
finished = 11
function heart() => byte(0x20c0)
none = 0
pink = 1
green = 2
cyan = 3
yellow = 4

//Item Helpers
function has_green_shoe() => bit0(0x2160)
function has_propellar() => bit0(0x2161)
function has_gun() => bit0(0x2162)
function has_bell() => bit0(0x2166)
function has_bracelet() => bit0(0x2167)
function has_ring() => bit0(0x2168)
function has_necklace() => bit0(0x2169)
function has_map() => bit0(0x216c)
function has_golden_feather() => bit0(0x216f)

// Limited Use Item Helpers
function has_metal_helmet() => bit0(0x2163) // 3 Uses
function has_silver_helmet() => bit0(0x2164) // 3 Uses
function has_heros_cloth() => bit0(0x2165) // 3 Uses
function has_goggles() => bit0(0x216a) // 3 Stages
function has_torch() => bit0(0x216b) // 3 Stages

// Secret Item Helpers
function has_blue_boots() => bit0(0x216d)
function has_red_shoes() => bit0(0x216e)
function has_crossed_tiara() => bit0(0x2170)
function has_priest_robe() => bit0(0x2171)
function has_armor() => bit0(0x2172)

// Stage Select (Difficulty)
function difficulty() => bit0(0x2082)
normal = 0
hard = 1

// 0x2086	Score 0000XX - 8-bit - Decimal
// 0x2087	Score 00XX00 - 8-bit - Decimal
// 0x2088	Score XX0000 - 8-bit - Decimal

// 0x2089	Fish - 0XX - 8-bit - Decimal
// 0x208a	Fish - X00 - 8-bit - Decimal

// 0x208b	TIME 0XX - 8-bit - Decimal
// 0x208c	TIME X00 - 8-bit - Decimal

// 0x208d	DIST 00XX - 8-bit - Decimal
// 0x208e	DIST XX00 - 8-bit - Decimal

// 0x24c0	Speed - 8-bit - Hex
// There are values in between, listed are cutoffs
//      0 - In Pit or hit Obstacle
//      0x19 - Slowest moving Speed
//      0x14 - Two Bars
//      0xf - Three Bars
//      0xb - Four Bars
//      0x8 - Five Bars
//      0x6 - Default Fastest Speed (6 bars)
//      ??? - Upgrades

function trigger_game_start() => once(game_state() == difficulty_select)
function trigger_stage_start() => prev(game_state()) == overworld && game_state() == playing
function trigger_stage_win(stage) => current_stage() == stage &&  prev(game_state()) == 7 && game_state() == 6
function trigger_cutscene(stage,scene,wait) => never(current_stage() != stage) && game_state() == 6 && repeated(wait, current_scene() == scene)
function reset_short(stage) => never(current_stage() == stage)
function check_short() => reset_short(2) && reset_short(3) && reset_short(4) && reset_short(5) && reset_short(7) && reset_short(8)
&& reset_short(10) && reset_short(11) && reset_short(14) && reset_short(16) && reset_short(17) && reset_short(19) && reset_short(20)


// NOROKO - Continue with items
function cheat_noroko() => byte(0x30f8) == 4 && byte(0x30f9) == 5 && byte(0x30fa) == 6 && byte(0x30fb) == 1 && byte(0x30fc) == 2 && byte(0x30fd) == 5
// KAZUMI - Continue without items
function cheat_kazumi() => byte(0x30f8) == 2 && byte(0x30f9) == 0 && byte(0x30fa) == 8 && byte(0x30fb) == 7 && byte(0x30fc) == 3 && byte(0x30fd) == 1

// Check for enabled cheats
function check_cheats() => !cheat_noroko() && !cheat_kazumi()

function trigger_todo() => always_true()




// Stages 3,6,9,12,15,18,21,24 have bosses
// Stage 12 has a cutscene after boss
// Stage 24 has a cutscene for each ending after boss

// ===================================================================================================================
// ===== Progression =====

function achievement_progression_normal(stage, stage_hex, points) {
    achievement (
        title = "Freezaurus " + stage/3,
        description = "Defeat the Boss of Stage " + stage,
        points = points,
        trigger = trigger_stage_win(stage_hex) && check_cheats()
    )
}

function achievement_progression_cutscene(stage_hex, scene, wait, title, description, points) {
    achievement (
        title = title,
        description = description,
        points = points,
        trigger = trigger_cutscene(stage_hex, scene, wait) && check_cheats()
    )
}

achievement_progression_normal(3, 0x3, 5)
achievement_progression_normal(6, 0x6, 5)
achievement_progression_normal(9, 0x9, 5)
achievement_progression_cutscene(0x12, 0x75, 560, "Do Penguins Eat Apples?", "Get the Apple of Life." , 5)
achievement_progression_normal(15, 0x15, 5)
achievement_progression_normal(18, 0x18, 5)
achievement_progression_normal(21, 0x21, 5)
achievement_progression_cutscene(0x24, 0x7e, 550, "She's Dead Jim", "Complete the game with the Bad ending.", 25)
achievement_progression_cutscene(0x24, 0x41, 100, "Happily Ever After", "Complete the game with the Good ending.", 25)

achievement (
        title = "Hard as Ice",
        description = "Beat the game on Level 2 difficulty",
        points = 25,
        trigger = current_level() == 1 && trigger_stage_win(0x24) && check_cheats()
    )

// ===== Progression =====
// ===================================================================================================================




// ===================================================================================================================
// ==== Secret Bags ====

function achievement_secret(stage, stage_hex, item_name, item_address, points) {
    achievement(
        title = item_name,
        description = "Get the " + item_name + " in stage " + stage,
        points = points,
        trigger = current_stage() == stage_hex && prev(bit0(item_address)) == 0 && bit0(item_address) == 1
    )
}

achievement_secret(6,0x6,"Blue Boots",0x216d,5) //Stage 6 - 297KM to get Bracelet - Get 5 fish on left
achievement_secret(9,0x9,"Priest Robe",0x2171,5) //Stage 9 - Enter Bonus at 305 and keep flying as soon as you ascend
achievement_secret(13,0x13,"Red Shoes",0x216e,5) // Stage 13 - Stay on left at start until around 580
achievement_secret(14,0x14,"Crossed Tiara",0x2170,5) // Stage 14 - In any crack press left then right
achievement_secret(16,0x16,"Armor",0x2172,5) // Stage 16 - Pauase and press U R D L

// ==== Secret Bags ====
// ===================================================================================================================




// 28  ==== Bonuses ==== 8
//  2 - Enter the Bonus Area on Stage 1 - 420
//  2 - Enter the Bonus Area on Stage 3 - 380
//  3 - Enter the Bonus Area on Stage 7 - 700
//  3 - Enter the Bonus Area on Stage 9 - 300
//  4 - Enter the Bonus Area on Stage 11 - 300
//  4 - Enter the Bonus Area on Stage 12 - 520
//  5 - Enter the Bonus Area on Stage 17 - 550
//  5 - Enter the Bonus Area on Stage 21 - 510

// ===================================================================================================================
// ==== Bonus Area Achievements ====

function achievement_bonus(stage, stage_hex, points) {
    achievement(
        title = "Bonus " + stage,
        description = "Enter the bonus level in Stage " + stage,
        points = points,
        trigger = current_stage() == stage_hex && game_state() == entering_bonus
    )
}

achievement_bonus(1,0x1,2)
achievement_bonus(3,0x3,2)
achievement_bonus(7,0x7,2)
achievement_bonus(9,0x9,2)
achievement_bonus(11,0x11,2)
achievement_bonus(12,0x12,2)
achievement_bonus(17,0x17,2)
achievement_bonus(21,0x21,2)

// ==== Bonus Area Achievements ====
// ===================================================================================================================




// ===================================================================================================================
// ==== Warp Achievements ====
function achievement_warp(stage,stage_hex,points) {
    achievement (
        title = "Warp " + stage,
        description = "Use the Warp in stage " + stage,
        points = points,
        trigger = current_stage() == stage_hex && game_state() == warp
    )
}


achievement_warp(1,0x1,2)
achievement_warp(6,0x6,2)
achievement_warp(9,0x9,2)
achievement_warp(13,0x13,2)
achievement_warp(15,0x15,2)
achievement_warp(18,0x18,2)
// ==== Warp Achievements ====
// ===================================================================================================================

//------- X - Collect every color heart in a single playthrough
//------- X - Find all 3 Santa's in a single playthrough

// ===================================================================================================================
// ==== Challenge Achievements ====

achievement(
    title = "No Warp", description = "Beat the game without using any Warps", points = 25,
    trigger = trigger_game_start() && trigger_when(trigger_stage_win(0x24)) && trigger_when(prev(game_state()) == 7) && trigger_when(game_state() == 6) && never(game_state() == warp) && never(game_state() == title)
)

Not_Shortest = [0x2,0x3,0x4,0x5,0x7,0x8,0x10,0x11,0x14,0x16,0x17,0x19,0x20]

trigger = trigger_game_start() && trigger_when(trigger_stage_win(0x24))
    for i in Not_Shortest 
    trigger = trigger && never(current_stage() == i)

achievement(
    title = "Time is of the Essence", description = "Beat the game using the shortest path", points = 10,
    trigger = trigger && never(game_state() == title)
)

achievement(
    title = "Solid Penguin", description = "Beat the game without dying", points = 25,
    trigger = trigger_game_start() && trigger_when(trigger_stage_win(0x24)) && never(game_state() == death)
)

achievement(
    title = "Extra Noot", description = "Score 50000 or more points to gain an extra life", points = 10,
    trigger = prev(byte(0x2088)) == 0x4 && byte(0x2088) == 0x5 && check_cheats()
)

achievement(
    title = "High Roller", description = "Score 100000 or more points", points = 10,
    trigger = prev(high4(0x2088)) == 0 && high4(0x2088) == 1 && check_cheats()
)

achievement(
    title = "Pentarou Learned from the Best", description = "Defeat a Freezaurus with the gun", points = 2,
    trigger = game_state() == fighting_boss && has_gun() == 1 && trigger_when(prev(byte(0x253c)) == 19 && byte(0x253c) == 20) && check_cheats()
)

achievement (
    title = "On a Diet", description = "Finish any 5 stages without collecting any fish", points = 5,
    trigger = never(game_state() == title) && tally(5, (prev(game_state()) == playing || prev(game_state()) == fighting_boss) && game_state() == stage_victory ) && disable_when( current_fish() > prev(current_fish()), current_stage() > prev(current_stage()) ) && check_cheats()
)

achievement(
    title = "pinguupinguu's Posse", description = "Have a full dance party of 8 Red Penguins after defeating a Freezaurus [Continue OK]", points = 2,
    trigger = prev(game_state()) == fighting_boss && (game_state()) == stage_victory && low4(0x208b) == 8
)

achievement(
    title = "Feeding Frenzy", description = "Grab 20 or more fish in any single Bonus level [Continue OK]", points = 3,
    trigger = (
    trigger_when(tally(20,prior(game_state()) == entering_bonus && game_state() == playing && current_bonus_fish() > prev(current_bonus_fish())) ) ||
    measured(tally(20,prior(game_state()) == entering_bonus && game_state() == playing && current_bonus_fish() > prev(current_bonus_fish())) ))
    && never(prior(game_state()) != entering_bonus)
)

achievement(
    title = "All Stocked Up", description = "Grab 3 or more extra lives in any single Bonus level [Continue OK]", points = 5,
    trigger = (
    trigger_when(tally(3,prior(game_state()) == entering_bonus && game_state() == playing && current_lives() > prev(current_lives())) )) ||
    measured(tally(3,prior(game_state()) == entering_bonus && game_state() == playing && current_lives() > prev(current_lives())) )
    && never(prior(game_state()) != entering_bonus)
)

achievement(
    title = "Thanks JAM!", description = "Find Santa", points = 2,
    trigger = game_state() == shop && shop_type() == santa && byte(0x2203) == 0 && check_cheats()
)

achievement(
    title = "Gambling Problem", description = "Win 500 or more fish in a single pull at the slots [Continue OK]", points = 5,
    trigger = never (slot_status() != dispensing) && measured(tally(500,game_state() == shop && prev(current_fish_bet()) > current_fish_bet())) && never(game_state() == title)
)

achievement(
    title = "Feel the Love", description = "Grab 25 or more Pink Hearts in a single playthrough", points = 5,
    trigger = never(game_state() == title) && measured(tally(25,(prev(heart()) == pink && heart() == none && byte(0x2087) - prev(byte(0x2087)) == 0x10 ), (prev(heart()) == pink && heart() == none && prev(byte(0x2087)) - byte(0x2087) == 0x90))) && check_cheats()
)

achievement(
    title = "Za Warudo", description = "Beat Stage 1 without going over 3 bars of speed, entering bonuses, using warps or dying", points = 5,
    trigger = trigger_when(game_state() == stage_victory) && game_state() > 3 && current_stage() == 1 && unless(once(game_state() == playing && byte(0x24c0) > 0 && byte(0x24c0) <= 0xb)) &&
    unless( once( game_state() == entering_bonus || game_state() == death ) ) && (always_true() || never(game_state() == title ) )
)

achievement(
    title = "Drunken Penguin", description = "Reach the Freezaurus in Stage 3 without pressing left/right, bumping anything, falling in a crevice or dying [Continue OK]", points = 5,
    trigger = trigger_when(prev(game_state()) == playing && game_state() == stage_victory) && 
    unless( once( (prev(current_lives()) < current_lives()) || current_speed() == 0 || bit2(0x2007) == 1 || (bit3(0x2007) == 1) && game_state() == playing ) ) && 
    (always_true() || never(game_state() == title) && never(game_state() == game_over ) && never(current_stage() != 3 ))
)

achievement(
    title = "Flying Fish", description = "Grab 50 or more fish while on a Cloud in a single playthrough", points = 5,
    trigger = never(game_state() == title) && measured(tally(20,(game_state() == playing && word(0x21f4) > 0 && current_fish() > prev(current_fish())))) && check_cheats()
)

achievement(
    title = "Juggernaut", description = "Destroy 50 or more Boulders in a single playthrough", points = 5,
    trigger = never(game_state() == title) && measured(tally(50,bit0(0x21f1) == 1 && ( byte(0x2087) - prev(byte(0x2087)) == 0x3 ))) && check_cheats()
)

achievement(
    title = "Naked Penguin", description = "Beat the game without collecting any items besides the Gun and Goggles (excluding Map)", points = 25,
    trigger = trigger_game_start() && trigger_when(trigger_stage_win(0x24)) && never(
    game_state() == title ||
    has_green_shoe() == 1 || 
    has_propellar() == 1 || 
    has_bell() == 1 || 
    has_bracelet() == 1 ||
    has_ring() == 1 ||
    has_necklace() == 1 ||
    has_golden_feather() == 1 ||
    has_blue_boots() == 1 || 
    has_red_shoes() == 1 ||
    has_crossed_tiara() == 1 ||
    has_priest_robe() == 1 ||
    has_bracelet() == 1 ||
    has_armor() == 1 ||
    has_metal_helmet() >= 1 ||
    has_silver_helmet() >= 1 ||
    has_heros_cloth() >= 1 ||
    has_torch() >= 1
    ) && check_cheats()
)

achievement(
    title = "Standard Loadout", description = "Collect all 8 normal items in a single playthrough", points = 5,
    trigger = (
    (game_state() == playing || game_state() == shop) && 
    prev(has_green_shoe()) + 
    prev(has_propellar()) + 
    prev(has_gun()) + 
    prev(has_bell()) + 
    prev(has_bracelet()) +
    prev(has_ring()) + 
    prev(has_necklace()) + 
    prev(has_golden_feather()) == 7 &&
    measured(
    has_green_shoe() + 
    has_propellar() + 
    has_gun() + 
    has_bell() + 
    has_bracelet() +
    has_ring() + 
    has_necklace() + 
    has_golden_feather() == 8)
    && check_cheats()
    )
)

achievement(
    title = "Limited Use", description = "Collect all 6 limited use items at least once in a single playthrough", points = 5,
    trigger = (
        never(current_stage() == 255) && never(game_state() < 3) &&
        tally(5,
            once((prev(has_metal_helmet()) == 1)),
            once((prev(has_silver_helmet()) == 1)),
            once((prev(has_heros_cloth()) == 1)),
            once((prev(has_goggles()) == 1)),
            once((prev(has_torch()) == 1)),
            once((prev(has_map()) == 1))
        ) &&
        tally(6,
           once(has_metal_helmet() >= 1),
           once(has_silver_helmet() >= 1), 
           once(has_heros_cloth() >= 1), 
           once(has_goggles() >= 1),
           once(has_torch() >= 1),
           once(has_map() >= 1)
        ) && check_cheats()
    )
)

achievement(
    title = "Top Secret", description = "Collect all 5 secret items in a single playthrough", points = 5,
    trigger = (
    (game_state() == playing || game_state() == shop) && 
    prev(has_blue_boots()) + 
    prev(has_red_shoes()) + 
    prev(has_crossed_tiara()) + 
    prev(has_priest_robe()) + 
    prev(has_armor()) == 4 &&
    measured(
    has_blue_boots() + 
    has_red_shoes() + 
    has_crossed_tiara() + 
    has_priest_robe() + 
    has_bracelet() + 
    has_armor() == 5)
    && check_cheats()
    )
)

achievement(
    title = "Over Geared", description = "Collect every item at least once in a single playthrough", points = 10,
    trigger = (
        never(current_stage() == 255) && never(game_state() < 3) && 
        tally(18,
            once(prev(has_green_shoe()) == 1),
            once(prev(has_propellar()) == 1),
            once(prev(has_gun()) == 1),
            once(prev(has_bell()) == 1),
            once(prev(has_bracelet()) == 1),
            once(prev(has_ring()) == 1),
            once(prev(has_necklace()) == 1),
            once(prev(has_golden_feather()) == 1),
            once(prev(has_metal_helmet()) == 1), 
            once(prev(has_silver_helmet()) == 1),
            once(prev(has_heros_cloth()) == 1),
            once(prev(has_goggles()) == 1),
            once(prev(has_torch()) == 1),
            once(prev(has_map()) == 1),
            once(prev(has_blue_boots()) == 1),
            once(prev(has_red_shoes()) == 1),
            once(prev(has_crossed_tiara()) == 1),
            once(prev(has_priest_robe()) == 1),
            once(prev(has_armor()) == 1)
        ) &&
        measured(
            tally(19,
                once(has_green_shoe() == 1),
                once(has_propellar() == 1),
                once(has_gun() == 1),
                once(has_bell() == 1),
                once(has_bracelet() == 1),
                once(has_ring() == 1),
                once(has_necklace() == 1),
                once(has_golden_feather() == 1),
                once(has_metal_helmet() >= 1),
                once(has_silver_helmet() >= 1), 
                once(has_heros_cloth() >= 1), 
                once(has_goggles() >= 1),
                once(has_torch() >= 1),
                once(has_map() >= 1),
                once(has_blue_boots() == 1),
                once(has_red_shoes() == 1),
                once(has_crossed_tiara() == 1),
                once(has_priest_robe() == 1),
                once(has_bracelet() == 1),
                once(has_armor() == 1)
            )
        )
        && check_cheats()
    )
)

//Item Helpers
function has_green_shoe() => bit0(0x2160)
function has_propellar() => bit0(0x2161)
function has_gun() => bit0(0x2162)
function has_bell() => bit0(0x2166)
function has_bracelet() => bit0(0x2167)
function has_ring() => bit0(0x2168)
function has_necklace() => bit0(0x2169)
function has_golden_feather() => bit0(0x216f)


// Limited Use Item Helpers
function has_metal_helmet() => byte(0x2163) // 3 Uses
function has_silver_helmet() => byte(0x2164) // 3 Uses
function has_heros_cloth() => byte(0x2165) // 3 Uses
function has_goggles() => byte(0x216a) // 3 Stages
function has_torch() => byte(0x216b) // 3 Stages
function has_map() => byte(0x216c) // 1 Stage

// Secret Item Helpers
function has_blue_boots() => bit0(0x216d)
function has_red_shoes() => bit0(0x216e)
function has_crossed_tiara() => bit0(0x2170)
function has_priest_robe() => bit0(0x2171)
function has_armor() => bit0(0x2172)


// ==== Challenge Achievements ====
// ===================================================================================================================




// ===================================================================================================================
// ==== Rich Presence ====

function Score()
{
    return byte(0x2088) * 10000 + byte(0x2087)*100 + byte(0x2086)
}

rich_presence_conditional_display(current_stage() == 255, "Penta is prearing to save Penko")
rich_presence_conditional_display(game_state() <= 2, "Penta is prearing to save Penko")
rich_presence_display("Penta is on his way to save Penko | 🚩: {0} | 🐧: {1}| 💯:  {2}",
    rich_presence_value("Stage", current_stage()),
    rich_presence_value("Lives", current_lives()),
    rich_presence_value("Score", Score())
)
// ==== Rich Presence ====
// ===================================================================================================================

// ===================================================================================================================
// ==== Leaderboards ====
// High Score
// Fastest time to beat the game
// Fastest time to 999 fish
// Fastest time for each stage (24)

leaderboard(
title = "High Score Game 1", 
description = "High Score Game 1",
start = prev(game_state()) == 3 && game_state() == 4 && difficulty() == 0 && check_cheats(),
cancel = game_state() == 1,
submit = (current_stage() == 0x24 && game_state() == 6 && (current_scene() == 0x7e || current_scene() == 0x41 )) || game_state() == 0xf,
value = bcd(byte(0x2088)) *100000 + bcd(byte(2087)) *1000 + bcd(byte(0x2086)),
format = "VALUE"
)

leaderboard(
title = "High Score Game 2", 
description = "High Score Game 2",
start = prev(game_state()) == 3 && game_state() == 4 && difficulty() == 1 && check_cheats(),
cancel = game_state() == 1,
submit = (current_stage() == 0x24 && game_state() == 6 && (current_scene() == 0x7e || current_scene() == 0x41 )) || game_state() == 0xf,
value = bcd(byte(0x2088)) *100000 + bcd(byte(2087)) *1000 + bcd(byte(0x2086)),
format = "VALUE"
)

leaderboard(
title = "999 Fish Speedrun",
description = "Fastest time to get 999 fish", 
start = prev(game_state()) == 3 && game_state() == 4 && difficulty() == 1 && check_cheats(),
cancel = game_state() == 1,
submit = byte(0x208a) == 0x9 && byte(0x2089) == 0x99, 
value = 0, 
format = "FRAMES")

//Speedrun Individual Levels
//TODO update submit - (i % 3 == 0) { submit = submit && prev(game_state() == 7)}
for i in range(1, 24)
    leaderboard(
    title = "Stage " + i + " Speedrun",
    description = "Fastest time to complete Stage " + i, 
    start = byte(0x2092) == i, 
    cancel = game_state() == 0xf || byte(0x208b) == 0 && byte(0x208c) == 0,
    submit = current_level() == i && game_state() == 6,
    value = bcd(byte(0x208c)) * 100 + bcd(byte(0x208b)), 
    format = "SECS")

    
//leaderboard(
//title = "Title",
//description = "Description", 
//start = 0 == 1, 
//cancel = 0 == 1,
//submit = 0 == 1, 
//value = 0, 
//format = "VALUE") // format - VALUE,SECS,FRAMES,POINTS,MILLISECS,MINUTES,SECS_AS_MINS
// Have to copy manually

// ==== Leaderboards ====
// ===================================================================================================================