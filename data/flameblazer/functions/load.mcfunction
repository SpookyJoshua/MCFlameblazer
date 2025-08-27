# === Objectives ===
scoreboard objectives add flameLife dummy
scoreboard objectives add fb_fire trigger
scoreboard objectives add fb_menu trigger
scoreboard objectives add fb_dur_plus trigger
scoreboard objectives add fb_dur_minus trigger
scoreboard objectives add fb_spd_plus trigger
scoreboard objectives add fb_spd_minus trigger
scoreboard objectives add fb_color trigger
scoreboard objectives add fb_smoke trigger
scoreboard objectives add fb_height_plus trigger
scoreboard objectives add fb_height_minus trigger
scoreboard objectives add fb_continuous trigger
scoreboard objectives add fb_len_plus trigger
scoreboard objectives add fb_len_minus trigger

# Storage (fake player 'fb')
scoreboard objectives add fbDuration dummy
scoreboard objectives add fbSpeed dummy
scoreboard objectives add fbColor dummy
scoreboard objectives add fbSmoke dummy
scoreboard objectives add fbHeight dummy
scoreboard objectives add fbContinuous dummy
scoreboard objectives add fbLength dummy

# Defaults
execute unless score fb fbDuration matches 1.. run scoreboard players set fb fbDuration 2
execute unless score fb fbSpeed matches 1.. run scoreboard players set fb fbSpeed 2
execute unless score fb fbColor matches 0..1 run scoreboard players set fb fbColor 0
execute unless score fb fbSmoke matches 0..1 run scoreboard players set fb fbSmoke 1
execute unless score fb fbHeight matches 1.. run scoreboard players set fb fbHeight 2
execute unless score fb fbContinuous matches 0..1 run scoreboard players set fb fbContinuous 0
execute unless score fb fbLength matches 1.. run scoreboard players set fb fbLength 3

function flameblazer:setup
