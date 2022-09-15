function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Nyame')
	state.HybridMode:options('Normal','DT')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','NoRefresh','DT','Nyame','Bunzi')
	state.Weapons:options('None','Naegling','Aeneas','DualWeapons','DualNaegling','DualTauret','DualAeolian','DualCarn','NaegCarn','CarnGlet','NaegGlet')

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
	send_command('@wait 5;input /lockstyleset 7')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Naegling = {main="Naegling",sub="Genmei Shield"}
	sets.weapons.Naegling = {main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.Aeneas = {main="Aeneas",sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Gleti's Knife"}
	sets.weapons.DualNaegling = {main="Naegling",sub="Centovente"}
	sets.weapons.DualTauret = {main="Tauret",sub="Blurred Knife +1"}
	sets.weapons.DualAeolian = {main="Tauret",sub="Malevolence"}
	sets.weapons.DualCarn = {main="Carnwenhan",sub="Centovente"}
	sets.weapons.NaegCarn = {main="Naegling",sub="Carnwenhan"}
	sets.weapons.NaegGlet = {main="Naegling",sub="Gleti's Knife"}
	sets.weapons.CarnGlet = {main="Carnwenhan",sub="Gleti's Knife"}

--    sets.buff.Sublimation = {waist="Embla Sash"}
--    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
    main="Kali",
    sub="Genmei Shield",
	range={ name="Linos", augments={'"Fast Cast"+4',}},
    head="Nahtirah Hat",
    body="Inyanga Jubbah +2",
    hands="Gendewitha Gages +1",
    legs="Aya. Cosciales +2",
    feet="Chelona Boots",
    neck="Orunmila's Torque",
    waist="Witful belt",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
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
    main="Kali",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +2",
    body="Inyanga Jubbah +2",
    hands="Gendewitha Gages +1",
    legs="Aya. Cosciales +2",
    feet="Bihu Slippers +3",
    neck="Orunmila's Torque",
    waist="Aoidos' Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

--	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
--	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC.Lullaby = {range="Marsyas"}
	sets.precast.FC.Lullaby.Resistant = {range="Marsyas"}
	sets.precast.FC['Horde Lullaby'] = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby'].Resistant = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby II'] = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby II'].Resistant = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Daurdabla"}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	sets.precast.JA.Troubadour = {body="Bihu Justaucorps +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

	-- Waltz set (chr and vit)
--	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
		head={ name="Chironic Hat", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','Attack+5','Weapon skill damage +9%',}},
		neck="Bard's Charm +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Bihu Jstcorps. +3",
		hands="Bihu Cuffs +3",
		ring1="Ifrit Ring +1",
		ring2="Epaminondas's ring",
		back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		waist="Sailfi Belt +1",
		legs="Bihu Cannions +3",
		feet="Bihu Slippers +3"
		}
		
	sets.precast.WS.Acc = {
		range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
		head={ name="Chironic Hat", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','Attack+5','Weapon skill damage +9%',}},
		neck="Bard's Charm +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Bihu Jstcorps. +3",
		hands="Bihu Cuffs +3",
		ring1="Ifrit Ring +1",
		ring2="Epaminondas's ring",
		back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		waist="Sailfi Belt +1",
		legs="Bihu Cannions +3",
		feet="Bihu Slippers +3"
		}
		
	sets.precast.WS['Savage Blade'] = {
		range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
		head={ name="Chironic Hat", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','Attack+5','Weapon skill damage +9%',}},
		neck="Bard's Charm +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Bihu Jstcorps. +3",
		hands="Bihu Cuffs +3",
		ring1="Ifrit Ring +1",
		ring2="Epaminondas's ring",
		back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		waist="Sailfi Belt +1",
		legs="Bihu Cannions +3",
		feet="Bihu Slippers +3"
		}
		
	sets.precast.WS['Mordant Rime'] = {
		range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
		head={ name="Chironic Hat", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','Attack+5','Weapon skill damage +9%',}},
		neck="Bard's Charm +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Bihu Jstcorps. +3",
		hands="Bihu Cuffs +3",
		ring1="Ifrit Ring +1",
		ring2="Epaminondas's ring",
		back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		waist="Sailfi Belt +1",
		legs="Bihu Cannions +3",
		feet="Bihu Slippers +3"
		}

	sets.precast.WS['Evisceration'] = {
		range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
		head={ name="Chironic Hat", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','Attack+5','Weapon skill damage +9%',}},
		neck="Bard's Charm +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Bihu Jstcorps. +3",
		hands="Bihu Cuffs +3",
		ring1="Ifrit Ring +1",
		ring2="Epaminondas's ring",
		back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		waist="Sailfi Belt +1",
		legs="Bihu Cannions +3",
		feet="Bihu Slippers +3"
		}
		
	sets.precast.WS['Aeolian Edge'] = {
		range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
		head={ name="Chironic Hat", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','Attack+5','Weapon skill damage +9%',}},
		neck="Bard's Charm +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Bihu Jstcorps. +3",
		hands="Bihu Cuffs +3",
		ring1="Ifrit Ring +1",
		ring2="Epaminondas's Ring",
		back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		waist="Sailfi Belt +1",
		legs="Bihu Cannions +3",
		feet="Bihu Slippers +3"
		}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
--	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
--	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets


	-- Gear to enhance certain classes of songs
--	sets.midcast.Ballad = {range="Daurdabla"}
	sets.midcast.Lullaby = {
		main="Carnwenhan",
		sub="Ammurapi Shield",
		range="Marsyas",
		head="Brioso Roundlet +3",
		body="Fili Hongreline +2",
		hands="Brioso Cuffs +3",
		legs="Inyanga Shalwar +2",
		feet={ name="Bihu Slippers +3", augments={'Enhances "Nightingale" effect',}},
		neck="Mnbw. Whistle +1",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Darkside Earring",
		right_ear="Enchntr. Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}

	sets.midcast['Horde Lullaby'] = {
		main="Carnwenhan",
		sub="Ammurapi Shield",
		range="Daurdabla",
		head="Brioso Roundlet +3",
		body="Brioso Justau. +3",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet={ name="Bihu Slippers +3", augments={'Enhances "Nightingale" effect',}},
		neck="Mnbw. Whistle +1",
		waist="Harfner's Sash",
		left_ear="Darkside Earring",
		right_ear="Enchntr. Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}

	sets.midcast['Horde Lullaby II'] = {
		main="Carnwenhan",
		sub="Ammurapi Shield",
		range="Daurdabla",
		head="Brioso Roundlet +3",
		body="Brioso Justau. +3",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet={ name="Bihu Slippers +3", augments={'Enhances "Nightingale" effect',}},
		neck="Mnbw. Whistle +1",
		waist="Harfner's Sash",
		left_ear="Darkside Earring",
		right_ear="Enchntr. Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}

	sets.midcast.Madrigal = {head="Fili Calot +2"}
	sets.midcast.Paeon = set_combine(sets.precast.FC,{range="Daurdabla",head="Brioso Roundlet +3",})
	sets.midcast.March = {hands="Fili Manchettes +2"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +2"}
	sets.midcast.Minne = {legs="Mousai seraweels +1"}
	sets.midcast.Etude = {head="Mousai turban +1"}
	sets.midcast.Threnody = {body="Mousai manteel +1"}
	sets.midcast.Carol = {hands="Mousai gages +1"}
	sets.midcast.Mambo = {hands="Mousai crackows +1"}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +2"}
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	sets.midcast.Mazurka = {range="Marsyas"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {
    main="Carnwenhan",
    sub="Kali",
    range="Gjallarhorn",
    head="Fili Calot +2",
    body="Fili Hongreline +2",
    hands="Fili Manchettes +2",
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
    main="Carnwenhan",
    sub="Ammurapi shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +3",
    body="Brioso justaucorps +3",
    hands="Brioso Cuffs +3",
    legs="Brioso Cannions +3",
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
    range="Gjallarhorn",
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
--    head="Fili Calot +2",
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
    main="Daybreak",
    sub="Culminus",
    range="Gjallarhorn",
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
    right_ring="Mephitas's Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
--	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
--	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
--	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {
	main="",
	sub="",
	ammo="",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands="Inyan. Dastanas +2",
    legs="Shedir Seraweels",
    feet="Kaykaus Boots +1",
	neck="Incanter's Torque",
	ear1="",
	ear2="Andoaa Earring",
	ring1="Stikini Ring +1",
	ring2="Stikini Ring +1",
	back="",
	waist="",
	}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {head="Chironic hat",sub="Ammurapi Shield",neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Chironic hat",sub="Ammurapi Shield",neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
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
		main="Mpaca's Staff",
		sub="Enki Strap",
		range="Daurdabla",
		head="Fili Calot +2",
		body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
		hands="Fili Manchettes +2",
		legs="Fili Rhingrave +2",
		feet="Bunzi's sabots",
		neck="Loricate torque +1",
		waist="Flume Belt +1",
		left_ear="Gifted Earring",
		right_ear="Ethereal Earring",
		left_ring="Stikini ring +1",
		right_ring="Stikini ring +1",
		back="Moonlight Cape",
	}
	
	sets.idle.Town = {
		main="Carnwenhan",
		sub="Ammurapi Shield",
		range="Daurdabla",
		head="Bihu Roundlet +3",
		neck="Bard's Charm +2",
		ear1="Balder Earring +1",
		ear2="Cessance Earring",
		body="Bihu Jstcorps. +3",
		hands="Bihu Cuffs +3",
		ring1="Chirich Ring +1",
		ring2="Epaminondas's Ring",
		back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		waist="Sailfi Belt +1",
		legs="Bihu Cannions +3",
		feet="Bihu Slippers +3"
	}
		
	sets.idle.NoRefresh = {
		main="Daybreak",
		sub="Genmei Shield",
		range="Daurdabla",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame sollerets",
		neck="Loricate torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Stikini ring +1",
		back="Moonlight Cape",
	}

	sets.idle.DT = {
		main="Daybreak",
		sub="Genmei Shield",
		range="Daurdabla",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame sollerets",
		neck="Loricate torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Stikini ring +1",
		back="Moonlight Cape",
	}

	sets.idle.Bunzi = {
		main="Daybreak",
		sub="Genmei Shield",
		range="Daurdabla",
		head="Bunzi's hat",
		body="Bunzi's Robe",
		hands="Bunzi's gloves",
		legs="Bunzi's pants",
		feet="Bunzi's sabots",
		neck="Loricate torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Stikini ring +1",
		back="Moonlight Cape",
	}

	sets.idle.Nyame = {
		main="Daybreak",
		sub="Genmei Shield",
		range="Daurdabla",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame sollerets",
		neck="Loricate torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Stikini ring +1",
		back="Moonlight Cape",
	}
	
	-- Defense sets

--	sets.defense.PDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum +1",
--		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
--		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
--		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

--	sets.defense.MDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum +1",
--		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
--		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
--		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.Kiting = {feet="Fili Cothurnes +2"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
--	sets.TPEat = {neck="Chrys. Torque"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {
    range={ name="Linos", augments={'Accuracy+18','"Dbl.Atk."+2','Quadruple Attack +3',}},
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Bunzi's gloves",
    legs={ name="Telchine Braconi", augments={'Accuracy+15 Attack+15','"Store TP"+6','DEX+10',}},
    feet={ name="Telchine Pigaches", augments={'Accuracy+15 Attack+15','"Store TP"+6','DEX+10',}},
    neck="Bard's Charm +2",
    waist="Sailfi Belt +1",
    left_ear="Cessance Earring",
    right_ear="Balder earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}
	sets.engaged.Nyame = {
    range={ name="Linos", augments={'Accuracy+18','"Dbl.Atk."+2','Quadruple Attack +3',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame sollerets",
    neck="Bard's Charm +2",
    waist="Sailfi Belt +1",
    left_ear="Cessance Earring",
    right_ear="Balder earring +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}
--	sets.engaged.Acc = {main="Aeneas",sub="Genmei Shield",ammo="Aurgelmir Orb +1",
--		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
--		back=gear.melee_jse_back,waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	sets.engaged.DW = {
    range={ name="Linos", augments={'Accuracy+18','"Dbl.Atk."+2','Quadruple Attack +3',}},
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Bunzi's gloves",
    legs={ name="Telchine Braconi", augments={'Accuracy+15 Attack+15','"Store TP"+6','DEX+10',}},
    feet={ name="Telchine Pigaches", augments={'Accuracy+15 Attack+15','"Store TP"+6','DEX+10',}},
    neck="Bard's Charm +2",
    waist="Sailfi Belt +1",
    left_ear="Cessance Earring",
    right_ear="Balder earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}
	sets.engaged.DW.Nyame = {
    range={ name="Linos", augments={'Accuracy+18','"Dbl.Atk."+2','Quadruple Attack +3',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame sollerets",
    neck="Bard's Charm +2",
    waist="Sailfi Belt +1",
    left_ear="Cessance Earring",
    right_ear="Balder earring +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}
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