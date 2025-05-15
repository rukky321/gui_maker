#> gui_maker:general/set_trigger_function
#
# trigger_functionを設定
# @user
# @private

# 何かの間違いでコンテナが残っているとバグるので一応kill
execute as @e[tag=gui_maker.container,type=chest_minecart] run data modify entity @s Items set value []
kill @e[tag=gui_maker.container,type=chest_minecart]

data modify storage gui_maker: tmp.general/set_trigger_function.item set from entity @s SelectedItem

$data modify storage gui_maker: tmp.general/set_trigger_function.item.components.minecraft:custom_data.gui_maker.trigger_function set value "$(function)"
data modify storage gui_maker: tmp.general/set_trigger_function.item.Slot set value 0b

summon chest_minecart 0 -100 0 {NoGravity:1b,Invulnerable:1b,Tags:["gui_maker.container"]}
execute as @e[tag=gui_maker.container,type=chest_minecart] run data modify entity @s Items append from storage gui_maker: tmp.general/set_trigger_function.item
item replace entity @s weapon.mainhand from entity @e[tag=gui_maker.container,type=chest_minecart, limit=1] container.0

# コンテナをキル
execute as @e[tag=gui_maker.container,type=chest_minecart] run data modify entity @s Items set value []
kill @e[tag=gui_maker.container,type=chest_minecart]

# リセット
data remove storage gui_maker: tmp.general/set_trigger_function