// Donkey Konga [USA]
// #ID = 13727
// Donkey Konga (USA) (Redump)
// md5: 858afe0fe5ba117339908ad06eec3e52  
// https://retroachievements.org/game/13727
// https://gamefaqs.gamespot.com/gamecube/918811-donkey-konga

// RATools Wiki: https://github.com/Jamiras/RATools/wiki

// Set Design

// Important Information

// Progression

// Completion

// Misc

// Challenge

// Rich Presence
// Playtime?, Coins, total medals

// Leaderboards
// Monkey, Chimp, Gorilla for each song

// Helper Functions
function game_mode() => dword_be(0x115f90)
street = 0
challenge = 1
battle = 2
jam = 3
arcade = 4
town = 5

function street_mode() => dword_be(0x115f98)
monkey = 0
chimp = 1
gorilla = 2
monkey_jam = 3
chimp_jam = 4
gorilla_jam = 5

function arcade_mode() => dword_be(0x1276e0)
bash = 0
juggle = 1
climb = 3

// Song dictionary
// key: current song value
// [0]: gorrilla gold medal address
// [1]: gold points
// [2]: FC points
// [3]: song title
song_dict = {
     0x0: [0x3342bc, 5, 10, "Diddy's Ditties"], // 4 barrels
     0x1: [0x3342bb, 5, 10, "Bingo"], // 2 barrels
     0x2: [0x3342bd, 5, 10, "Campfire Medley"], // 3 barrels
     0x3: [0x3342bf, 5, 10, "Pokemon Theme"], // 5 barrels
     0x4: [0x3342be, 5, 10, "Kirby:Right Back At Ya!"], // 4 barrels
     0x5: [0x3342c8, 5, 10, "We Will Rock You"], // 4 barrels
     0x6: [0x3342c1, 5, 10, "Like Wow"], // 6 barrels
     0x7: [0x3342c4, 5, 10, "Wild Thing"], // 7 barrels
     0x8: [0x3342d9, 5, 10, "I Think I Love You"], // 3 barrels
     0x9: [0x3342c3, 5, 10, "Louie Louie"], // 7 barrels
     0xa: [0x3342c2, 5, 10, "The Loco-Motion"], // 4 barrels
     0xb: [0x3342c0, 5, 10, "Shining Star"], // 4 barrels
     0xc: [0x3342d8, 5, 10, "All The Small Things"], // 3 barrels
     0xd: [0x3342cd, 5, 10, "Rock This Town"], // 6 barrels
     0xe: [0x3342cb, 5, 10, "You Can't Hurry Love"], // 6 barrels
     0xf: [0x3342ce, 5, 10, "Right Here, Right Now"], // 4 barrels
    0x10: [0x3342ca, 5, 10, "Dancing in the Street"], // 8 barrels
    0x11: [0x3342cc, 5, 10, "Rock Lobster"], // 3 barrels
    0x12: [0x3342d7, 5, 10, "Stupid Cupid"], // 2 barrels
    0x13: [0x3342d2, 5, 10, "The Impression That I Get"], // 3 barrels
    0x14: [0x3342cf, 5, 10, "What I Like About You"], // 3 barrels
    0x15: [0x3342d0, 5, 10, "Whip It"], // 1 barrels
    0x16: [0x3342c7, 5, 10, "Busy Child"], // 8 barrels
    0x17: [0x3342d1, 5, 10, "Para Los Rumberos"], // 7 barrels
    0x18: [0x3342ba, 5, 10, "Sing, Sing, Sing (With A Swing)"], // 6 barrels
    0x19: [0x3342c9, 5, 10, "Oye Como Va"], // 8 barrels
    0x1a: [0x3342c6, 5, 10, "On the Road Again"], // 6 barrels
    0x1b: [0x3342c5, 5, 10, "Hungarian Dance No.5 in G Minor"], // 4 barrels
    0x1c: [0x3342da, 5, 10, "Turkish March"], // 2 barrels
    0x1d: [0x3342d4, 5, 10, "DK Rap"], // 1 barrels
    0x1e: [0x3342d6, 5, 10, "The Legend of Zelda Theme"], // 3 barrels
    0x1f: [0x3342d5, 5, 10, "Mario Bros. Theme"], // 6 barrels
    0x20: [0x3342d3, 5, 10, "Donkey Konga Theme"] // 5 barrels
}

difficulty_dict = {
    0x0: "Monkey",
    0x1: "Chimp",
    0x2: "Gorilla"
}

flags_dict = {
    0: [0x3342db,0x3342fb], //songs
    1: [0x3342fe,0x33430f], //bongos
    2: [0x334310,0x334312]  //minigames
}

_jams = 0
_bongos = 1
_shines = 2

regular_clear_dict = {
    0: [0x334278,0x334298], //Monkey difficulty
    1: [0x334299,0x3342b9] // Chimp difficulty
}
_monkey = 0
_chimp = 1

// #region Memory Symbols -----------------------------------------------------------------------------------------------------------------
// #endregion

// #region Memory -------------------------------------------------------------------------------------------------------------------------
// #endregion

// #region Constants ----------------------------------------------------------------------------------------------------------------------
songCurrent = dword_be(0x115FA0)
songScore = dword_be(0x4DEC7C)
songEnd = dword_be(0x4DE924)
songDifficulty = dword_be(0x115f98)
songBadCount = word_be(0x4dec6c)
songMissCount = word_be(0x4dec6e)
songCoin = dword_be(0x4dec78)
songTimer = dword_be(0x4de928)
// Minigames
miniGameBashScore = dword_be(0x4e99d4)
miniGameBashTime = dword_be(0x4e99d8)
miniGameJuggleTime = dword_be(0x4dea08)
miniGameJuggleEndScore = dword_be(0x4dfb64)
miniGameClimbHeigh = dword_be(0x4de95c)
miniGameClimbPoints = dword_be(0x4df004)

// #endregion

// #region Utils --------------------------------------------------------------------------------------------------------------------------
// #endregion

// #region Rich Presence ------------------------------------------------------------------------------------------------------------------
// #endregion

// #region Achievement Functions ----------------------------------------------------------------------------------------------------------
// #endregion

// #region Achievements -------------------------------------------------------------------------------------------------------------------

// Regular Unlocks
    achievement(title = "Don't Blue It",
                description = "Successfully hit a special note to get a blue surprise",
                points = 5,
                trigger = 
                            game_mode() == street
                         && ( (songCoin - prev(songCoin)) == 200
                            || (songCoin - prev(songCoin)) == 100
                         )
                         && songEnd == 0
                         && prev(songTimer) > 0
)  

function medalClearCheck(diffClear){
	startAddress = diffClear[0]
	endAddress = diffClear[1]

	result = 0
	totalClears = 0
	
    for address in range(startAddress, endAddress){				
        result = result + bitcount(address)
        totalClears = totalClears + 1
    }

	return measured(result == totalClears)
}

function prevMedalClearCheck(diffClear){
	startAddress = diffClear[0]
	endAddress = diffClear[1]

	result = 0
	totalClears = 0
	
    for address in range(startAddress, endAddress){				
        result = result + prev(bitcount(address))
        totalClears = totalClears + 1
    }

	return result == totalClears - 1
}

// Gold Medal Gorilla Songs

function goldGorillaAchievement(song){
	
    title = "[Golden Gorilla] " + song_dict[song][3]
	
	points = song_dict[song][1]
	
	description = format("Earn a Gold Medal in \"{0}\" on Gorilla difficulty", song_dict[song][3])
	
	trigger = game_mode() == street
			&& street_mode() == gorilla
			&& songCurrent == song
			&& songEnd == 1
            && prev(bit1(song_dict[song][0])) == 0
            && bit1(song_dict[song][0]) == 1
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

function allClears(diffIndex, title, description, points){
	
	clears = regular_clear_dict[diffIndex]
	type = "progression"
	trigger = game_mode() == street
            &&medalClearCheck(clears) 
			&& prevMedalClearCheck(clears)
	
	achievement(title = title, points = points, description = description, trigger = trigger. type=type)
}

allClears(_monkey, "Monkeying Around", "Get a Medal for every song on Monkey difficulty", 5)
allClears(_chimp, "Gone Gorilla", "Get a Medal for every song on Chimp difficulty", 10)

// Perfect Gorilla Songs

function perfectGorillaAchievement(song){
	
    title = "[Perfect Gorilla] " + song_dict[song][3]
	
	points = song_dict[song][2]
	
	description = format("Earn a Full Combo in \"{0}\" on Gorilla difficulty", song_dict[song][3])
	
	trigger = game_mode() == street
			&& street_mode() == gorilla
			&& songCurrent == song
            && prev(songEnd) == 7 
            && songEnd == 8 
            && songBadCount == 0
            && songMissCount == 0
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for song in song_dict {
        goldGorillaAchievement(song)
        perfectGorillaAchievement(song)
}
	



// Shop Achievements

function flagCounter(flags) {
	startAddress = flags[0]
	endAddress = flags[1]
	result = 0	

    for address in range(startAddress, endAddress){				
        result = result + bit0(address)
    }
	
	return result
}

function unlockedBitflags(flags){
	startAddress = flags[0]
	endAddress = flags[1]

	result = 0
	totalFlags = 0
	
    for address in range(startAddress, endAddress){				
        result = result + bit0(address)
        totalFlags = totalFlags + 1
    }

	return measured(result == totalFlags)
}

function unlockedBitflagsV2(flags){
	startAddress = flags[0]
	endAddress = flags[1]

	result = 0
	totalFlags = 0
	
    for address in range(startAddress, endAddress){				
        result = result + bitcount(address)
        totalFlags = totalFlags + 1
    }

	return measured(result == totalFlags)
}

function prevUnlockedBitflags(flags){
	startAddress = flags[0]
	endAddress = flags[1]

	result = 0
	totalFlags = 0
	
    for address in range(startAddress, endAddress){				
        result = result + prev(bit0(address))
        totalFlags = totalFlags + 1
    }

	return result == totalFlags - 1
}

function prevUnlockedBitflagsV2(flags){
	startAddress = flags[0]
	endAddress = flags[1]

	result = 0
	totalFlags = 0
	
    for address in range(startAddress, endAddress){				
        result = result + prev(bitcount(address))
        totalFlags = totalFlags + 1
    }

	return result == totalFlags - 1
}

function allFlagsAchievement(flagIndex, title, description, points){
	
	flags = flags_dict[flagIndex]
	
	trigger = game_mode() == town
            &&unlockedBitflags(flags) 
			&& prevUnlockedBitflags(flags)
	
	achievement(title = title, points = points, description = description, trigger = trigger)
}

function allFlagsAchievementV2(flagIndex, title, description, points){
	
	flags = flags_dict[flagIndex]
	
	trigger = game_mode() == town
            &&unlockedBitflagsV2(flags) 
			&& prevUnlockedBitflagsV2(flags)
	
	achievement(title = title, points = points, description = description, trigger = trigger)
}

allFlagsAchievementV2(_jams, "Jungle Jammin'", "Unlock all Jungle Jams", 25)
allFlagsAchievementV2(_bongos, "Bountiful Bongos", "Unlock all bongos", 25)
allFlagsAchievementV2(_shines, "Shining Monkies", "Unlock all mini-games", 5)

// Minigames
    achievement(title = "I Rool, You Drool",
                description = "Clear Bash K.Rool with a score of 35 or above",
                points = 5,
                trigger = 
                            game_mode() == arcade
                         && arcade_mode() == bash
                         && miniGameBashTime == 0
                         && prev(miniGameBashTime) == 1
                         && miniGameBashScore >= 35

)  

    achievement(title = "Jungle Juggler",
                description = "Clear Banana Juggle with a score of 100 or above",
                points = 5,
                trigger = 
                            game_mode() == arcade
                         && arcade_mode() == juggle
                         && miniGameJuggleEndScore >= 100
                         && miniGameJuggleEndScore < 0xffffffff
                         && prev(miniGameJuggleEndScore) == 0xffffffff
                         && miniGameJuggleTime == 0
)  

    achievement(title = "Fruit Frenzy",
                description = "Clear 100m Vine Climb with a score of 35 or above",
                points = 5,
                trigger = 
                            game_mode() == arcade
                         && arcade_mode() == climb
                         && miniGameClimbHeigh == 0x65
                         && prev(miniGameClimbHeigh) < 0x65
                         && miniGameClimbPoints >= 35
)  

// #endregion

// #region Leaderboards -------------------------------------------------------------------------------------------------------------------

function songLeaderboard(song, diff){

	title = format("{0} ({1})", song_dict[song][3], difficulty_dict[diff])
    description = format("Finish {0} on {1} with the highest score", song_dict[song][2], difficulty_dict[diff])
		
    start = game_mode() == street 
        && street_mode() == diff 
        && prev(songEnd) == 7 
        && songEnd == 8 
        && songCurrent == song	
    cancel = always_false()
	submit = start	
    value = songScore
	
    leaderboard(title, description, start, cancel, submit, value, "SCORE")    
}

for song in song_dict {
	for diff in difficulty_dict {
		songLeaderboard(song, diff)
	}
}

    leaderboard(
    title = "Bash K.Rool",
    description = "Minigame Highscore",
    start  = game_mode() == arcade && arcade_mode() == bash && miniGameBashTime == 0 && prev(miniGameBashTime) == 1,
    cancel = always_false(),
    submit = always_true(),
    value = miniGameBashScore,
    format = "VALUE",
    lower_is_better=true
)   

    leaderboard(
    title = "Banana Juggle",
    description = "Minigame Highscore",
    start  = game_mode() == arcade && arcade_mode() == juggle && miniGameJuggleEndScore != prev(miniGameJuggleEndScore) && prev(miniGameJuggleEndScore) == 0xffffffff && miniGameJuggleTime == 0,
    cancel = always_false(),
    submit = always_true(),
    value = miniGameJuggleEndScore,
    format = "VALUE",
    lower_is_better=true
)   

    leaderboard(
    title = "100m Vine Climb",
    description = "Minigame Highscore",
    start  = game_mode() == arcade && arcade_mode() == climb && miniGameClimbHeigh == 0x65 && prev(miniGameClimbHeigh) < 0x65,
    cancel = always_false(),
    submit = always_true(),
    value = miniGameClimbPoints,
    format = "VALUE",
    lower_is_better=true
)   