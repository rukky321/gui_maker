#> gui_maker:general/mode_change
#
# 編集モードと通常モードを切り替える
# @user
# @within gui_maker:use_editor_item/mode_change

execute if entity @s[tag=!gui_maker.edit] run tag @s add gui_maker.to_edit

tag @s[tag=gui_maker.to_edit] add gui_maker.edit
tag @s[tag=!gui_maker.to_edit] remove gui_maker.edit

execute if entity @s[tag=gui_maker.to_edit] run tellraw @s "編集モードに切り替えました"
execute if entity @s[tag=!gui_maker.to_edit] run tellraw @s "通常モードに切り替えました"

playsound ui.button.click master @s ~ ~ ~ 0.5 2 0.5

tag @s remove gui_maker.to_edit

#>
# @private
#define tag gui_maker.to_edit