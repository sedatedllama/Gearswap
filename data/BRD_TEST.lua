-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
    
    ExtraSongsMode may take one of three values: None, Dummy, FullLength
    
    You can set these via the standard 'set' and 'cycle' self-commands.  EG:
    gs c cycle ExtraSongsMode
    gs c set ExtraSongsMode Dummy
    
    The Dummy state will equip the bonus song instrument and ensure non-duration gear is equipped.
    The FullLength state will simply equip the bonus song instrument on top of standard gear.
    
    
    Simple macro to cast a dummy Daurdabla song:
    /console gs c set ExtraSongsMode Dummy
    /ma "Shining Fantasia" <me>
    
    To use a Terpander rather than Daurdabla, set the info.ExtraSongInstrument variable to
    'Terpander', and info.ExtraSongs to 1.
--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.ExtraSongsMode = M{['description']='Extra Songs', 'None', 'Dummy', 'FullLength'}

    state.Buff['Pianissimo'] = buffactive['pianissimo'] or false

    -- For tracking current recast timers via the Timers plugin.
    custom_timers = {}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal','Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    brd_daggers = S{'Aeneas','Kali'}
    pick_tp_weapon()
    
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
    -- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
    
    -- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(true, 'Use Custom Timers')
    
    -- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode') 
	send_command('bind !numpad1 gs c lshow')    
	send_command('bind !numpad2 gs c lhide')
	send_command('bind ! input /ma "Horde Lullaby II" <t>')
    send_command('bind ^ input /ma "Horde Lullaby" <t>')
    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
	send_command('unbind ^')
    send_command('unbind !')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC =  {main="Carnwenhan",
						head="Vanya Hood",
						body="Inyanga Jubbah +1",
						hands="Leyline Gloves",
						legs="Aya. Cosciales +2",
						feet="Navon Crackows",
						neck="Voltsurge Torque",
						waist="Witful Belt",
						left_ear="Enchntr. Earring +1",
						right_ear="Loquac. Earring",
						left_ring="Kishar Ring",
						right_ring="Prolix Ring",
						back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris",feet="Vanya Clogs"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {head="Umuthi Hat",waist="Siegel Sash"})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, 	{waist="Siegel Sash",})
																		

    sets.precast.FC.BardSong = {main="Carnwenhan",
								sub="Kali",
								head="Fili Calot +1",
								body="Brioso Justau. +3",
								hands="Leyline Gloves",
								legs="Aya. Cosciales +2",
								feet="Bihu Slippers +3",
								neck="Voltsurge Torque",
								waist="Embla Sash",
								left_ear="Enchntr. Earring +1",
								right_ear="Loquac. Earring",
								left_ring="Kishar Ring",
								right_ring="Prolix Ring",
								back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}}

    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
    sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})   
    
    -- Precast sets to enhance JAs
    
    sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
    sets.precast.JA.Troubadour = {body="Bihu Jstcorps. +3"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {range="Gjallarhorn",
        head="Nahtirah Hat",
        body="Gendewitha Bliaut",hands="Buremte Gloves",
        back="Kumbira Cape",legs="Gendewitha Spats",feet="Inyan. Crackows +2"}
    
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = 	{head="Aya. Zucchetto +2",
						body="Ayanmo Corazza +2",
						hands="Aya. Manopolas +2",
						legs="Aya. Cosciales +2",
						feet="Aya. Gambieras +2",
						neck="Fotia Gorget",
						waist="Fotia Belt",
						left_ear="Brutal Earring",
						right_ear="Moonshade Earring",
						left_ring="Hetairoi Ring",
						right_ring="Ilabrat Ring",
						back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}}
    
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS,{body="Bihu Jstcorps. +3",
																	ear1="Ishvara Earring",
																	ring1="Apate Ring",
																	range={ name="Linos", augments={'Accuracy+15','Weapon skill damage +2%','DEX+8',}},
					back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}}})

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS,{head="Bihu Roundlet +3",
																  ear2="Assuage Earring",
																  ring1="Petrov Ring",
																  feet="Bihu Slippers+3",
																  range={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}},
					back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}}})

    sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS,{head="Bihu Roundlet +3",
																   neck="Mnbw. Whistle +1",
																   body="Bihu Jstcorps. +3",
																   ear1="Regal Earring",
																   ear2="Ishvara Earring",
																   ring1="Metamor. Ring +1",
																   legs="Bihu Cannions +3",
																   feet="Bihu Slippers+3",
																   range={ name="Linos", augments={'Accuracy+15','Weapon skill damage +2%','DEX+8',}},
					back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}}})
    
    
    -- Midcast Sets

    -- General set for recast times.
    sets.midcast.FastRecast = {}
	
     -- For song buffs (duration and AF3 set bonus)
    sets.midcast.SongEffect = {main="Carnwenhan",range="Gjallarhorn",
        head="Brioso Roundlet +2",neck="Mnbw. Whistle +1",ear1="Genmei Earring",ear2="Etioliation Earring",
        body="Fili Hongreline +1",hands="Fili Manchettes +1",ring1="Defending Ring",ring2="Vocane Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
		waist="Flume Belt +1",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3"}
		
    -- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast['Honor March'] = set_combine(sets.midcast.SongEffect, {range="Marsyas"})
    sets.midcast.Ballad = set_combine(sets.midcast.SongEffect, {legs="Fili Rhingrave +1"})
    sets.midcast.Lullaby = set_combine(sets.midcast.SongEffect, {main="Daybreak",range="Blurred Harp +1",
												body="Fili Hongreline +1",hands="Brioso Cuffs +3",
												waist="Luminary Sash",left_ear="Regal Earring",right_ear="Gwati Earring",
												left_ring={ name="Stikini Ring"},right_ring="Stikini Ring",})
    sets.midcast.Madrigal = set_combine(sets.midcast.SongEffect, {head="Fili Calot +1"})
    sets.midcast.March = sets.midcast.SongEffect
    sets.midcast.Minuet = sets.midcast.SongEffect
    sets.midcast.Minne = sets.midcast.SongEffect
    sets.midcast.Paeon = set_combine(sets.precast.FC,{main="Carnwenhan",range="Daurdabla",head="Brioso Roundlet +2",})
    sets.midcast.Carol = set_combine(sets.midcast.SongEffect,{head="Fili Calot +1",body="Fili Hongreline +1",hands="Mousai Gages",
																feet="Fili Cothurnes +1"})
    sets.midcast["Sentinel's Scherzo"] = set_combine(sets.midcast.SongEffect, {feet="Fili Cothurnes +1"})
    sets.midcast['Magic Finale'] = set_combine(sets.midcast.Lullaby, {body="Brioso Justau. +3",legs="Fili Rhingrave +1",feet="Coalrake Sabots"})

    sets.midcast.Mazurka = {range=info.ExtraSongInstrument}
    sets.midcast['Enhancing Magic'] = 	{sub="Ammurapi Shield",
										body="Manasa Chasuble",
										hands="Inyan. Dastanas +2",
										legs="Portent Pants",
										neck="Colossus's Torque",
										waist="Embla Sash",
										left_ear="Andoaa Earring",
										right_ear="Mimir Earring",
										back="Perimede Cape",}

    -- For song defbuffs (duration primary, accuracy secondary)
    sets.midcast.SongDebuff = 	sets.midcast.Lullaby

    -- For song defbuffs (accuracy primary, duration secondary)
    sets.midcast.ResistantSongDebuff = 	{main="Daybreak",
										sub="Ammurapi Shield",
										range="Gjallarhorn",
										head="Inyanga Tiara +1",
										body="Brioso Justau. +3",
										hands="Inyan. Dastanas +1",
										legs="Brioso Cannions +2",
										feet="Inyan. Crackows +2",
										neck="Mnbw. Whistle +1",
										waist="Luminary Sash",
										left_ear="Regal Earring",
										right_ear="Gwati Earring",
										left_ring={ name="Metamor. Ring +1"},
										right_ring="Metamor. Ring",
										back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}}

    -- Song-specific recast reduction
    sets.midcast.SongRecast = sets.midcast['Magic Finale']

    --sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

    -- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = {range=info.ExtraSongInstrument,
        head="Fili Calot +1",neck="VoltsurgeTorque",ear1="Enchntr.  Earring +1",ear2="Loquac. Earring",
        body="Inyanga Jubbah +1",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
		waist="Embla Sash",legs="Aya. Cosciales +2",feet="Bihu Slippers +3"}

    -- Other general spells and classes.
    sets.midcast.Cure = {main="Daybreak",
						sub="Ammurapi Shield",
						head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
						body="Inyanga Jubbah +2",
						hands="Inyan. Dastanas +2",
						legs="Vanya Slops",
						feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
						neck="Colossus's Torque",
						waist="Luminary Sash",
						left_ear="Meili Earring",
						right_ear="Regal Earring",
						left_ring="Menelaus's Ring",
						right_ring="Sirona's Ring",
						back="Tempered Cape",}
        
    sets.midcast.Curaga = set_combine(sets.midcast.Cure,{neck="Imbodla Necklace",ear1="Regal Earring",legs="Bihu Cannions +3",
														ring1="Levia. Ring +1",ring2="Metamor. Ring +1",back="Pahtli Cape"})
        
    sets.midcast.Stoneskin = {
        head="Nahtirah Hat",neck="Nodens Gorget",
        body="Gendewitha Bliaut",hands="Gendewitha Gages",
        waist="Siegel Sash",feet="Gendewitha Galoshes"}
        
    sets.midcast.Cursna = set_combine(sets.midcast.Cure,{neck="Malison Medallion",
														ear2="Gwati Earring",ring1="Menelaus's Ring",
														ring2="Haoma's Ring",back="Tempered Cape",
														waist="Gishdubar Sash",legs="Inyanga Shalwar +2"})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {left_ring="Sheltered Ring",}
    
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {main="Carnwenhan",
				sub="Ammurapi Shield",
				range="Marsyas",
				head="Aya. Zucchetto +2",
				body="Bihu Jstcorps. +3",
				hands="Aya. Manopolas +1",
				legs="Brioso Cannions +2",
				feet="Bihu Slippers +3",
				neck="Loricate Torque +1",
				waist="Flume Belt +1",
				left_ear="Ethereal Earring",
				right_ear="Genmei Earring",
				left_ring="Inyanga Ring",
				right_ring="Defending Ring",
				back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}}

    sets.idle.PDT = {}

       
    sets.idle.Weak = {sets.idle}
    
    
    -- Defense sets

    sets.defense.PDT = {head="Aya. Zucchetto +2",
						body="Ayanmo Corazza +2",
						hands="Aya. Manopolas +2",
						legs="Aya. Cosciales +2",
						feet="Aya. Gambieras +2",
						neck="Loricate Torque +1",
						waist="Flume Belt +1",
						left_ear="Tuisto Earring",
						right_ear="Etiolation Earring",
						left_ring="Vocane Ring",
						right_ring="Defending Ring",
						back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}}

    sets.defense.MDT = {head="Aya. Zucchetto +2",
						body="Ayanmo Corazza +2",
						hands="Aya. Manopolas +2",
						legs="Aya. Cosciales +2",
						feet="Aya. Gambieras +2",
						neck="Loricate Torque +1",
						waist="Flume Belt +1",
						left_ear="Tuisto Earring",
						right_ear="Etiolation Earring",
						left_ring="Vocane Ring",
						right_ring="Defending Ring",
						back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}}

    sets.Kiting = {feet="Fili Cothurnes +1"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = { main={ name="Carnwenhan"},
						range={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}},
						head="Aya. Zucchetto +2",
						body="Ayanmo Corazza +2",
						hands={ name="Chironic Gloves", augments={'Attack+22','Mag. Acc.+25','Quadruple Attack +3','Accuracy+14 Attack+14','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
						legs="Aya. Cosciales +2",
						feet="Aya. Gambieras +2",
						neck="Bard's Charm +1",
						waist="Windbuffet Belt +1",
						left_ear="Brutal Earring",
						right_ear="Telos Earring",
						left_ring="Moonbeam Ring",
						right_ring="Chirich Ring +1",
						back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}}

sets.engaged.Acc = { main={ name="Aeneas", augments={'Path: A',}},
						range={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}},
						head="Aya. Zucchetto +2",
						body="Ayanmo Corazza +2",
						hands={ name="Chironic Gloves", augments={'Attack+22','Mag. Acc.+25','Quadruple Attack +3','Accuracy+14 Attack+14','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
						legs="Aya. Cosciales +2",
						feet="Aya. Gambieras +2",
						neck="Bard's Charm +1",
						waist="Windbuffet Belt +1",
						left_ear="Brutal Earring",
						right_ear="Telos Earring",
						left_ring="Moonbeam Ring",
						right_ring="Chirich Ring",
						back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}}

    -- Sets with weapons defined.
    sets.engaged.Dagger = 	{range={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}},
							head="Aya. Zucchetto +2",
							body="Ayanmo Corazza +2",
							hands={ name="Chironic Gloves", augments={'Attack+22','Mag. Acc.+25','Quadruple Attack +3','Accuracy+14 Attack+14','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
							legs="Aya. Cosciales +2",
							feet="Aya. Gambieras +2",
							neck="Bard's Charm +1",
							waist="Windbuffet Belt +1",
							left_ear="Brutal Earring",
							right_ear="Telos  Earring",
							left_ring="Moonbeam Ring",
							right_ring="Chirich Ring +1",
							back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}}

    -- Set if dual-wielding
    sets.engaged.DW = 	{range={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}},
						head="Aya. Zucchetto +2",
						body="Ayanmo Corazza +2",
						hands={ name="Chironic Gloves", augments={'Attack+22','Mag. Acc.+25','Quadruple Attack +3','Accuracy+14 Attack+14','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
						legs="Aya. Cosciales +2",
						feet="Aya. Gambieras +2",
						neck="Bard's Charm +1",
						waist="Reiki Yotai",
						left_ear="Brutal Earring",
						right_ear="Suppanomimi",
						left_ring="Moonbeam Ring",
						right_ring="Chirich Ring +1",
						back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
        -- Auto-Pianissimo
        if ((spell.target.type == 'PLAYER' and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) and
            not state.Buff['Pianissimo'] then
            
            local spell_recasts = windower.ffxi.get_spell_recasts()
            if spell_recasts[spell.recast_id] < 2 then
                send_command('@input /ja "Pianissimo" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
                eventArgs.cancel = true
                return
            end
        end
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        if spell.type == 'BardSong' then
            -- layer general gear on first, then let default handler add song-specific gear.
            local generalClass = get_song_class(spell)
            if generalClass and sets.midcast[generalClass] then
                equip(sets.midcast[generalClass])
            end
        end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
        if state.ExtraSongsMode.value == 'FullLength' then
            equip(sets.midcast.Daurdabla)
        end

        state.ExtraSongsMode:reset()
    end
end

-- Set eventArgs.handled to true if we don't want automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' and not spell.interrupted then
        if spell.target and spell.target.type == 'SELF' then
            adjust_timers(spell, spellMap)
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','ammo')
        else
            enable('main','sub','ammo')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    pick_tp_weapon()
end


-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Determine the custom class to use for the given song.
function get_song_class(spell)
    -- Can't use spell.targets:contains() because this is being pulled from resources
    if set.contains(spell.targets, 'Enemy') then
        if state.CastingMode.value == 'Resistant' then
            return 'ResistantSongDebuff'
        else
            return 'SongDebuff'
        end
    elseif state.ExtraSongsMode.value == 'Dummy' then
        return 'DaurdablaDummy'
    else
        return 'SongEffect'
    end
end


-- Function to create custom buff-remaining timers with the Timers plugin,
-- keeping only the actual valid songs rather than spamming the default
-- buff remaining timers.
function adjust_timers(spell, spellMap)
    if state.UseCustomTimers.value == false then
        return
    end
    
    local current_time = os.time()
    
    -- custom_timers contains a table of song names, with the os time when they
    -- will expire.
    
    -- Eliminate songs that have already expired from our local list.
    local temp_timer_list = {}
    for song_name,expires in pairs(custom_timers) do
        if expires < current_time then
            temp_timer_list[song_name] = true
        end
    end
    for song_name,expires in pairs(temp_timer_list) do
        custom_timers[song_name] = nil
    end
    
    local dur = calculate_duration(spell.name, spellMap)
    if custom_timers[spell.name] then
        -- Songs always overwrite themselves now, unless the new song has
        -- less duration than the old one (ie: old one was NT version, new
        -- one has less duration than what's remaining).
        
        -- If new song will outlast the one in our list, replace it.
        if custom_timers[spell.name] < (current_time + dur) then
            send_command('timers delete "'..spell.name..'"')
            custom_timers[spell.name] = current_time + dur
            send_command('timers create "'..spell.name..'" '..dur..' down')
        end
    else
        -- Figure out how many songs we can maintain.
        local maxsongs = 2
        if player.equipment.range == info.ExtraSongInstrument then
            maxsongs = maxsongs + info.ExtraSongs
        end
        if buffactive['Clarion Call'] then
            maxsongs = maxsongs + 1
        end
        -- If we have more songs active than is currently apparent, we can still overwrite
        -- them while they're active, even if not using appropriate gear bonuses (ie: Daur).
        if maxsongs < table.length(custom_timers) then
            maxsongs = table.length(custom_timers)
        end
        
        -- Create or update new song timers.
        if table.length(custom_timers) < maxsongs then
            custom_timers[spell.name] = current_time + dur
            send_command('timers create "'..spell.name..'" '..dur..' down')
        else
            local rep,repsong
            for song_name,expires in pairs(custom_timers) do
                if current_time + dur > expires then
                    if not rep or rep > expires then
                        rep = expires
                        repsong = song_name
                    end
                end
            end
            if repsong then
                custom_timers[repsong] = nil
                send_command('timers delete "'..repsong..'"')
                custom_timers[spell.name] = current_time + dur
                send_command('timers create "'..spell.name..'" '..dur..' down')
            end
        end
    end
end

-- Function to calculate the duration of a song based on the equipment used to cast it.
-- Called from adjust_timers(), which is only called on aftercast().
function calculate_duration(spellName, spellMap)
    local mult = 1
    if player.equipment.range == "Daurdabla" then mult = mult + 0.3 end -- change to 0.25 with 90 Daur
    if player.equipment.range == "Gjallarhorn" then mult = mult + 0.3 end -- change to 0.3 with 95 Gjall
    
    if player.equipment.main == "Carnwenhan" then mult = mult + 0.1 end -- 0.1 for 75, 0.4 for 95, 0.5 for 99/119
    if player.equipment.main == "Kali" then mult = mult + 0.05 end
    if player.equipment.sub == "Kali" then mult = mult + 0.05 end
    if player.equipment.neck == "Aoidos' Matinee" then mult = mult + 0.1 end
    if player.equipment.body == "Fili Hongreline +1" then mult = mult + 0.1 end
    if player.equipment.legs == "Inyanga Shalwar +2" then mult = mult + 0.1 end
    if player.equipment.feet == "Brioso Slippers" then mult = mult + 0.1 end
    if player.equipment.feet == "Brioso Slippers +3" then mult = mult + 0.11 end
    
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet" then mult = mult + 0.1 end
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +3" then mult = mult + 0.1 end
    if spellMap == 'Madrigal' and player.equipment.head == "Fili Calot +1" then mult = mult + 0.1 end
    if spellMap == 'Minuet' and player.equipment.body == "Fili Hongreline +1" then mult = mult + 0.1 end
    if spellMap == 'March' and player.equipment.hands == "Fili Manchettes +1" then mult = mult + 0.1 end
    if spellMap == 'Ballad' and player.equipment.legs == "Fili Rhingrave +1" then mult = mult + 0.1 end
    if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Fili Cothurnes +1" then mult = mult + 0.1 end
    
    if buffactive.Troubadour then
        mult = mult*2
    end
    if spellName == "Sentinel's Scherzo" then
        if buffactive['Soul Voice'] then
            mult = mult*2
        elseif buffactive['Marcato'] then
            mult = mult*1.5
        end
    end
    
    local totalDuration = math.floor(mult*120)

    return totalDuration
end


-- Examine equipment to determine what our current TP weapon is.
function pick_tp_weapon()
    if brd_daggers:contains(player.equipment.main) then
        state.CombatWeapon:set('Dagger')
        
        if S{'NIN','DNC'}:contains(player.sub_job) and brd_daggers:contains(player.equipment.sub) then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    else
        state.CombatWeapon:reset()
        state.CombatForm:reset()
    end
end

-- Function to reset timers.
function reset_timers()
    for i,v in pairs(custom_timers) do
        send_command('timers delete "'..i..'"')
    end
    custom_timers = {}
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 09)
end


windower.raw_register_event('zone change',reset_timers)
windower.raw_register_event('logout',reset_timers)

