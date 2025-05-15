#> gui_maker:use_editor_item/add_trigger_tag
#  advancementから実行
# @private

# アイテム消費音を消す
stopsound @s * ambient.basalt_deltas.additions

# 実績削除
advancement revoke @s only gui_maker:use_editor_item/add_trigger_tag

# オフハンドにアイテムを持っていないなら関数の実行を終了
execute unless data entity @s equipment.offhand run return -1

# triggerタグを付与または消去
execute if data entity @s equipment.offhand.components.minecraft:custom_data.gui_maker{trigger_item:1b} run tag @s add gui_maker.remove_trigger_tag

execute if entity @s[tag=gui_maker.remove_trigger_tag] run item modify entity @s weapon.offhand gui_maker:set_trigger_0
execute if entity @s[tag=!gui_maker.remove_trigger_tag] run item modify entity @s weapon.offhand gui_maker:set_trigger_1

tellraw @s[tag=gui_maker.remove_trigger_tag] "オフハンドアイテムのtriggerタグを消去しました"
tellraw @s[tag=!gui_maker.remove_trigger_tag] "オフハンドアイテムにtriggerタグを付与しました"
tellraw @s[tag=!gui_maker.remove_trigger_tag] "以下のコマンドを実行してクリック時の操作を設定してください"
tellraw @s[tag=!gui_maker.remove_trigger_tag] "function gui_maker:general/add_trigger_function {function:<functionのパス>}"

# リセット
tag @s[tag=gui_maker.remove_trigger_tag] remove gui_maker.remove_trigger_tag

#>
# @private
#define tag gui_maker.remove_trigger_tag
