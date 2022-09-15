function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','NoRefresh','DT')
	state.Weapons:options('None','Naegling','Aeneas','DualWeapons','DualNaegling','DualTauret','DualAeolian')

--	gear.melee_jse_back = {name="Intarabus's Cape",augments={'Accuracy+20 Attack+20'}}
--	gear.magic_jse_back = {name="Intarabus's Cape",augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !r gs c weapons None;gs c update')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
--	sets.weapons.Aeneas = {main="Aeneas",sub="Genmei Shield"}
--	sets.weapons.DualWeapons = {main="Aeneas",sub="Blurred Knife +1"}
--	sets.weapons.DualNaegling = {main="Naegling",sub="Blurred Knife +1"}
--	sets.weapons.Naegling = {main="Naegling",sub="Genmei Shield"}
--	sets.weapons.DualTauret = {main="Tauret",sub="Blurred Knife +1"}
--	sets.weapons.DualAeolian = {main="Tauret",sub="Malevolence"}

--    sets.buff.Sublimation = {waist="Embla Sash"}
--    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
    main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Kali",
    range="Daurdabla",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body="Inyanga Jubbah +2",
    hands="Gendewitha Gages +1",
    legs="Aya. Cosciales +2",
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck="Aoidos' Matinee",
    waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Naji's loop",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
		
--	sets.precast.FC.DT = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
--		head="Bunzi's Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
--		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
--		back=gear.magic_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Bihu Slippers +1"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC)

--	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
--	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	sets.precast.FC.BardSong = {
    main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Kali",
    range="Daurdabla",
    head="Fili Calot",
    body="Inyanga Jubbah +2",
    hands="Gendewitha Gages +1",
    legs="Aya. Cosciales +2",
    feet="Weath. Souliers +1",
    neck="Aoidos' Matinee",
    waist="Aoidos' Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

--	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
--	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC.Lullaby = {range="Blurred Harp +1"}
	sets.precast.FC.Lullaby.Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'] = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'].Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'] = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'].Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Blurred Harp +1"}
		
--	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
--	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
--	sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
--	sets.precast.JA.Troubadour = {body="Bihu Jstcorps +1"}
--	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
--	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
--	sets.precast.WS = {ammo="Aurgelmir Orb +1",
--		head="Aya. Zucchetto +2",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Mache Earring +1",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
--		back=gear.melee_jse_back,waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
--	sets.precast.WS.Acc = {ammo="Aurgelmir Orb +1",
--		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Moonshade Earring",ear2="Mache Earring +1",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
--		back=gear.melee_jse_back,waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
--	sets.precast.WS['Savage Blade'] = {ammo="Aurgelmir Orb +1",
--		head="Aya. Zucchetto +2",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Rufescent Ring",ring2="Ilabrat Ring",
--		back=gear.melee_jse_back,waist="Sailfi Belt +1",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
--	sets.precast.WS['Aeolian Edge'] = {ammo="Aurgelmir Orb +1",
--		head="Cath Palug Crown",neck="Baetyl Pendant",ear1="Moonshade Earring",ear2="Friomisi Earring",
--		body="Chironic Doublet",hands=gear.chironic_enfeeble_hands,ring1="Metamorph Ring +1",ring2="Shiva Ring +1",
--		back=gear.melee_jse_back,waist="Refoccilation Stone",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
--	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
--	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
--	sets.midcast.FastRecast = {
--    main="Legato Dagger",
--    sub="Culminus",
--    range="Gjallarhorn",
--    head="Fili Calot",
--    body="Fili Hongreline +1",
--    hands="Fili Manchettes",
--    legs="Inyanga Shalwar +2",
--    feet="Weath. Souliers +1",
--    neck="Mnbw. Whistle +1",
--    waist="Aoidos' Belt",
--    ear1="Mendi. Earring",
--    ear2="Aoidos' Earring",
--    ring1="Stikini Ring +1",
--    ring2="Stikini Ring +1",
--    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
--	}


	-- Gear to enhance certain classes of songs
--	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast.Lullaby = {range="Blurred Harp +1"}
--	sets.midcast.Lullaby.Resistant = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby'] = {range="Blurred Harp +1"}
--	sets.midcast['Horde Lullaby'].Resistant = {range="Blurred Harp +1"}
--	sets.midcast['Horde Lullaby'].AoE = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby II'] = {range="Blurred Harp +1"}
--	sets.midcast['Horde Lullaby II'].Resistant = {range="Blurred Harp +1"}
--	sets.midcast['Horde Lullaby II'].AoE = {range="Blurred Harp +1"}
--	sets.midcast.Madrigal = {head="Fili Calot +1"}
--	sets.midcast.Paeon = {}
--	sets.midcast.March = {hands="Fili Manchettes +1"}
--	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
--	sets.midcast.Minuet = {body="Fili Hongreline +1 +1"}
--	sets.midcast.Minne = {}
--	sets.midcast.Carol = {}
--	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = {range="Blurred Harp +1"}
--	sets.midcast.Mazurka = {range="Marsyas"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {
    main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Kali",
    range="Daurdabla",
    head="Fili Calot",
    body="Fili Hongreline +1",
    hands="Fili Manchettes",
    legs="Inyanga Shalwar +2",
    feet="Brioso slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Aoidos' Belt",
    ear1="Mendi. Earring",
    ear2="Aoidos' Earring",
    ring1="Stikini Ring +1",
    ring2="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}
		
--	sets.midcast.SongEffect.DW = {main="Kali",sub="Kali"}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
    main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Kali",
    range="Daurdabla",
    head="Inyanga tiara +1",
    body="Inyanga Jubbah +2",
    hands="Inyanga Dastanas +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Ovate Rope",
    ear1="Enchntr. Earring +1",
    ear2="Aoidos' Earring",
    ring1="Stikini Ring +1",
    ring2="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}
	
    sets.midcast.Stun = {
    main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Culminus",
    range="Daurdabla",
    head="Inyanga tiara +1",
    body="Inyanga Jubbah +2",
    hands="Inyanga Dastanas +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Ovate Rope",
    ear1="Enchntr. Earring +1",
    ear2="Aoidos' Earring",
    ring1="Stikini Ring +1",
    ring2="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}	
		
--	sets.midcast.SongDebuff.DW = {main="Kali",sub="Kali"}

	-- For song defbuffs (accuracy primary, duration secondary)
--	sets.midcast.SongDebuff.Resistant = {main="Daybreak",sub="Ammurapi Shield",range="Blurred Harp +1",ammo=empty,
--		head="Inyanga Tiara +2",neck="Mnbw. Whistle +1",ear1="Regal Earring",ear2="Digni. Earring",
--		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Metamorph Ring +1",ring2="Stikini Ring +1",
--		back=gear.magic_jse_back,waist="Acuity Belt +1",legs="Inyanga Shalwar +2",feet="Aya. Gambieras +2"}

	-- Song-specific recast reduction
--	sets.midcast.SongRecast = {
--    main="Legato Dagger",
--    sub="Culminus",
--    range="Gjallarhorn",
--    head="Fili Calot",
--    body="Fili Hongreline +1",
--    hands="Fili Manchettes",
--    legs="Inyanga Shalwar +2",
--    feet="Weath. Souliers +1",
--    neck="Mnbw. Whistle +1",
--    waist="Aoidos' Belt",
--    left_ear="Mendi. Earring",
--    right_ear="Aoidos' Earring",
--    left_ring="Stikini Ring +1",
--    right_ring="Stikini Ring +1",
--    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
--	}
		
--	sets.midcast.SongDebuff.DW = {}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
    main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Culminus",
    range="Daurdabla",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck="Mnbw. Whistle +1",
    waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
    left_ear="Mendi. Earring",
    right_ear="Calamitous Earring",
    left_ring="Sirona's Ring",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
--	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
--	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
--	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
--	sets.midcast['Enhancing Magic'] = {main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
--		head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
--		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
--		back=gear.magic_jse_back,waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
--	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
--	sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
--		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
--		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
--		back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
--	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
--		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
--		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
--		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
--	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
--		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
--	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
--	sets.resting = {main="Chatoyant Staff",sub="Umbra Strap",ammo="Staunch Tathlum +1",
--		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
--		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
--		back="Umbra Cape",waist="Flume Belt +1",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
	
	sets.idle = {
    main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    sub="Culminus",
    range="Daurdabla",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Inyanga Crackows +2",
    neck="Mnbw. Whistle +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back="Umbra Cape",
}
		
	sets.idle.NoRefresh = {
    main="Tauret",
    sub="Kali",
    range="Daurdabla",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Mnbw. Whistle +1",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Chirich Ring +1",
    right_ring="Rajas Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}

--	sets.idle.DT = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
--		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
--		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
--		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	-- Defense sets

--	sets.defense.PDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum +1",
--		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
--		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
--		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

--	sets.defense.MDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum +1",
--		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
--		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
--		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

--	sets.Kiting = {feet="Fili Cothurnes +1"}
--	sets.latent_refresh = {waist="Fucho-no-obi"}
--	sets.latent_refresh_grip = {sub="Oneiros Grip"}
--	sets.TPEat = {neck="Chrys. Torque"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {    
	main="Tauret",
    sub="Culminus",
    range="Daurdabla",
    head="Aya. Zucchetto +2",
    body="Aya. Corazza +2",
    hands="Aya. Manapolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Mnbw. Whistle +1",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring",
    back="Aptitude Mantle +1",
}
--	sets.engaged.DT = {main="Aeneas",sub="Genmei Shield",ammo="Aurgelmir Orb +1",
--		head="Nyame Helm",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back=gear.melee_jse_back,waist="Windbuffet Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
--	sets.engaged.Acc = {main="Aeneas",sub="Genmei Shield",ammo="Aurgelmir Orb +1",
--		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
--		back=gear.melee_jse_back,waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	sets.engaged.DW = {
    main="Tauret",
    sub="Kali",
    range="Daurdabla",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Mnbw. Whistle +1",
    waist="Windbuffet Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Brutal Earring",
    left_ring="Chirich Ring +1",
    right_ring="Rajas Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}
--	sets.engaged.DW.DT = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
--		head="Nyame Helm",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Brutal Earring",
--		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
--	sets.engaged.DW.Acc = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
--		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
--		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
--	sets.engaged.DW.Acc.DT = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
--		head="Nyame Helm",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
--		body="Ayanmo Corazza +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Ilabrat Ring",
--		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 10)
end

state.Weapons:options('None','Naegling','Aeneas','DualWeapons','DualNaegling','DualTauret','DualAeolian')

autows_list = {['Naegling']='Savage Blade',['Aeneas']="Rudra's Storm",['DualWeapons']="Rudra's Storm",['DualNaegling']='Savage Blade',['DualTauret']='Evisceration',
     ['DualAeolian']='Aeolian Edge'}