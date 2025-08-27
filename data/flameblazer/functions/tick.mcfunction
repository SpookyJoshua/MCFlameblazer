# Enable all triggers so /trigger always works
scoreboard players enable @a fb_fire
scoreboard players enable @a fb_menu
scoreboard players enable @a fb_dur_plus
scoreboard players enable @a fb_dur_minus
scoreboard players enable @a fb_spd_plus
scoreboard players enable @a fb_spd_minus
scoreboard players enable @a fb_color
scoreboard players enable @a fb_smoke
scoreboard players enable @a fb_height_plus
scoreboard players enable @a fb_height_minus
scoreboard players enable @a fb_continuous
scoreboard players enable @a fb_len_plus
scoreboard players enable @a fb_len_minus

# Fire & Menu
execute as @a[scores={fb_fire=1..}] at @s run function flameblazer:burst
scoreboard players set @a[scores={fb_fire=1..}] fb_fire 0
execute as @a[scores={fb_menu=1..}] run function flameblazer:menu
scoreboard players set @a[scores={fb_menu=1..}] fb_menu 0

# Adjustments and clamps
execute as @a[scores={fb_dur_plus=1..}] run scoreboard players add fb fbDuration 1
execute as @a[scores={fb_dur_minus=1..}] run scoreboard players remove fb fbDuration 1
scoreboard players set @a[scores={fb_dur_plus=1..}] fb_dur_plus 0
scoreboard players set @a[scores={fb_dur_minus=1..}] fb_dur_minus 0
execute if score fb fbDuration matches ..0 run scoreboard players set fb fbDuration 1
execute if score fb fbDuration matches 6.. run scoreboard players set fb fbDuration 5

execute as @a[scores={fb_spd_plus=1..}] run scoreboard players add fb fbSpeed 1
execute as @a[scores={fb_spd_minus=1..}] run scoreboard players remove fb fbSpeed 1
scoreboard players set @a[scores={fb_spd_plus=1..}] fb_spd_plus 0
scoreboard players set @a[scores={fb_spd_minus=1..}] fb_spd_minus 0
execute if score fb fbSpeed matches ..0 run scoreboard players set fb fbSpeed 1
execute if score fb fbSpeed matches 6.. run scoreboard players set fb fbSpeed 5

execute as @a[scores={fb_color=1..}] run scoreboard players operation fb fbColor += @s fb_color
scoreboard players set @a[scores={fb_color=1..}] fb_color 0
execute if score fb fbColor matches 2.. run scoreboard players set fb fbColor 0

execute as @a[scores={fb_smoke=1..}] run scoreboard players operation fb fbSmoke += @s fb_smoke
scoreboard players set @a[scores={fb_smoke=1..}] fb_smoke 0
execute if score fb fbSmoke matches 2.. run scoreboard players set fb fbSmoke 0

execute as @a[scores={fb_height_plus=1..}] run scoreboard players add fb fbHeight 1
execute as @a[scores={fb_height_minus=1..}] run scoreboard players remove fb fbHeight 1
scoreboard players set @a[scores={fb_height_plus=1..}] fb_height_plus 0
scoreboard players set @a[scores={fb_height_minus=1..}] fb_height_minus 0
execute if score fb fbHeight matches ..0 run scoreboard players set fb fbHeight 1
execute if score fb fbHeight matches 11.. run scoreboard players set fb fbHeight 10

execute as @a[scores={fb_continuous=1..}] run scoreboard players operation fb fbContinuous += @s fb_continuous
scoreboard players set @a[scores={fb_continuous=1..}] fb_continuous 0
execute if score fb fbContinuous matches 2.. run scoreboard players set fb fbContinuous 0
execute if score fb fbContinuous matches 0 run kill @e[type=minecraft:marker,tag=flameblazer_cont]

execute as @a[scores={fb_len_plus=1..}] run scoreboard players add fb fbLength 1
execute as @a[scores={fb_len_minus=1..}] run scoreboard players remove fb fbLength 1
scoreboard players set @a[scores={fb_len_plus=1..}] fb_len_plus 0
scoreboard players set @a[scores={fb_len_minus=1..}] fb_len_minus 0
execute if score fb fbLength matches ..0 run scoreboard players set fb fbLength 1
execute if score fb fbLength matches 11.. run scoreboard players set fb fbLength 10

# ===== PARTICLES =====
# Map fbLength (1..10) to vertical spread (dy) and count
# dy: 0.5,0.8,1.1,1.4,1.7,2.0,2.2,2.4,2.7,3.0
# ct: 80, 90,100,110,120,130,140,160,180,200

# Burst (orange)
execute if score fb fbColor matches 0 if score fb fbLength matches 1 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:flame ~ ~ ~ 0.15 0.5 0.15 0.001 80
execute if score fb fbColor matches 0 if score fb fbLength matches 2 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:flame ~ ~ ~ 0.15 0.8 0.15 0.001 90
execute if score fb fbColor matches 0 if score fb fbLength matches 3 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:flame ~ ~ ~ 0.15 1.1 0.15 0.001 100
execute if score fb fbColor matches 0 if score fb fbLength matches 4 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:flame ~ ~ ~ 0.15 1.4 0.15 0.001 110
execute if score fb fbColor matches 0 if score fb fbLength matches 5 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:flame ~ ~ ~ 0.15 1.7 0.15 0.001 120
execute if score fb fbColor matches 0 if score fb fbLength matches 6 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:flame ~ ~ ~ 0.15 2.0 0.15 0.001 130
execute if score fb fbColor matches 0 if score fb fbLength matches 7 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:flame ~ ~ ~ 0.15 2.2 0.15 0.001 140
execute if score fb fbColor matches 0 if score fb fbLength matches 8 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:flame ~ ~ ~ 0.15 2.4 0.15 0.001 160
execute if score fb fbColor matches 0 if score fb fbLength matches 9 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:flame ~ ~ ~ 0.15 2.7 0.15 0.001 180
execute if score fb fbColor matches 0 if score fb fbLength matches 10 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:flame ~ ~ ~ 0.15 3.0 0.15 0.001 200

# Burst (blue)
execute if score fb fbColor matches 1 if score fb fbLength matches 1 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 0.5 0.15 0.001 80
execute if score fb fbColor matches 1 if score fb fbLength matches 2 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 0.8 0.15 0.001 90
execute if score fb fbColor matches 1 if score fb fbLength matches 3 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 1.1 0.15 0.001 100
execute if score fb fbColor matches 1 if score fb fbLength matches 4 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 1.4 0.15 0.001 110
execute if score fb fbColor matches 1 if score fb fbLength matches 5 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 1.7 0.15 0.001 120
execute if score fb fbColor matches 1 if score fb fbLength matches 6 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 2.0 0.15 0.001 130
execute if score fb fbColor matches 1 if score fb fbLength matches 7 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 2.2 0.15 0.001 140
execute if score fb fbColor matches 1 if score fb fbLength matches 8 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 2.4 0.15 0.001 160
execute if score fb fbColor matches 1 if score fb fbLength matches 9 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 2.7 0.15 0.001 180
execute if score fb fbColor matches 1 if score fb fbLength matches 10 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 3.0 0.15 0.001 200

# Continuous (orange & blue)
execute if score fb fbColor matches 0 if score fb fbLength matches 1 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:flame ~ ~ ~ 0.15 0.5 0.15 0.001 80
execute if score fb fbColor matches 0 if score fb fbLength matches 2 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:flame ~ ~ ~ 0.15 0.8 0.15 0.001 90
execute if score fb fbColor matches 0 if score fb fbLength matches 3 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:flame ~ ~ ~ 0.15 1.1 0.15 0.001 100
execute if score fb fbColor matches 0 if score fb fbLength matches 4 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:flame ~ ~ ~ 0.15 1.4 0.15 0.001 110
execute if score fb fbColor matches 0 if score fb fbLength matches 5 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:flame ~ ~ ~ 0.15 1.7 0.15 0.001 120
execute if score fb fbColor matches 0 if score fb fbLength matches 6 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:flame ~ ~ ~ 0.15 2.0 0.15 0.001 130
execute if score fb fbColor matches 0 if score fb fbLength matches 7 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:flame ~ ~ ~ 0.15 2.2 0.15 0.001 140
execute if score fb fbColor matches 0 if score fb fbLength matches 8 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:flame ~ ~ ~ 0.15 2.4 0.15 0.001 160
execute if score fb fbColor matches 0 if score fb fbLength matches 9 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:flame ~ ~ ~ 0.15 2.7 0.15 0.001 180
execute if score fb fbColor matches 0 if score fb fbLength matches 10 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:flame ~ ~ ~ 0.15 3.0 0.15 0.001 200

execute if score fb fbColor matches 1 if score fb fbLength matches 1 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 0.5 0.15 0.001 80
execute if score fb fbColor matches 1 if score fb fbLength matches 2 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 0.8 0.15 0.001 90
execute if score fb fbColor matches 1 if score fb fbLength matches 3 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 1.1 0.15 0.001 100
execute if score fb fbColor matches 1 if score fb fbLength matches 4 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 1.4 0.15 0.001 110
execute if score fb fbColor matches 1 if score fb fbLength matches 5 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 1.7 0.15 0.001 120
execute if score fb fbColor matches 1 if score fb fbLength matches 6 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 2.0 0.15 0.001 130
execute if score fb fbColor matches 1 if score fb fbLength matches 7 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 2.2 0.15 0.001 140
execute if score fb fbColor matches 1 if score fb fbLength matches 8 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 2.4 0.15 0.001 160
execute if score fb fbColor matches 1 if score fb fbLength matches 9 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 2.7 0.15 0.001 180
execute if score fb fbColor matches 1 if score fb fbLength matches 10 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.15 3.0 0.15 0.001 200

# Smoke
execute if score fb fbSmoke matches 1 as @e[type=minecraft:marker,tag=flameblazer] at @s run particle minecraft:campfire_signal_smoke ~ ~1.2 ~ 0.1 1.6 0.1 0 4
execute if score fb fbSmoke matches 1 as @e[type=minecraft:marker,tag=flameblazer_cont] at @s run particle minecraft:campfire_signal_smoke ~ ~1.2 ~ 0.1 1.6 0.1 0 4

# ===== MOVEMENT & LIFETIME =====
# Burst jets move upward by speed and then auto-kill based on duration
execute if score fb fbSpeed matches 1 as @e[type=minecraft:marker,tag=flameblazer] run tp @s ~ ~0.20 ~
execute if score fb fbSpeed matches 2 as @e[type=minecraft:marker,tag=flameblazer] run tp @s ~ ~0.35 ~
execute if score fb fbSpeed matches 3 as @e[type=minecraft:marker,tag=flameblazer] run tp @s ~ ~0.50 ~
execute if score fb fbSpeed matches 4 as @e[type=minecraft:marker,tag=flameblazer] run tp @s ~ ~0.60 ~
execute if score fb fbSpeed matches 5 as @e[type=minecraft:marker,tag=flameblazer] run tp @s ~ ~0.80 ~

execute as @e[type=minecraft:marker,tag=flameblazer] run scoreboard players add @s flameLife 1
execute if score fb fbDuration matches 1 as @e[type=minecraft:marker,tag=flameblazer,scores={flameLife=20..}] run kill @s
execute if score fb fbDuration matches 2 as @e[type=minecraft:marker,tag=flameblazer,scores={flameLife=40..}] run kill @s
execute if score fb fbDuration matches 3 as @e[type=minecraft:marker,tag=flameblazer,scores={flameLife=60..}] run kill @s
execute if score fb fbDuration matches 4 as @e[type=minecraft:marker,tag=flameblazer,scores={flameLife=80..}] run kill @s
execute if score fb fbDuration matches 5 as @e[type=minecraft:marker,tag=flameblazer,scores={flameLife=100..}] run kill @s

# Continuous jets: fixed height, no movement, persist until toggled off
