#> gui_maker:tick
#
# @within minecraft:tick

# エンダーチェスト系はここで処理
# guiアイテムのドロップを検知し、プレイヤごとに操作
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gui_maker:{trigger_item:1b}}}}}] run function gui_maker:check_dropitem

# エンダーチェスト内のアイテムのクリックを検知し実行(シフトクリックの処理もやってる)
execute as @a[tag=!gui_maker.edit] run function gui_maker:enderchest/check

# display専用アイテムの処理
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gui_maker:{display_only:1b}}}}}] on origin run function gui_maker:general/refresh_all
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gui_maker:{display_only:1b}}}}}]
execute as @a[tag=!gui_maker.edit] run function gui_maker:clear_displayitem

# その他の操作はプレイヤのadvancementから実行(アイテムの持ち上げ、移動)