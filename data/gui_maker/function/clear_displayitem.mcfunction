#> gui_maker:enderchest/clear_displayitem
# チェスト内のどのアイテムがなくなったかを確認
# @within gui_maker:tick

# エンダーチェスト系アイテム
execute store success score $gui_maker.tmp gui_maker run clear @s *[minecraft:custom_data~{gui_maker:{display_only:1b}}]

# GUIを更新
execute if score $gui_maker.tmp gui_maker matches 1.. run function gui_maker:general/refresh_all

#リセット
scoreboard players reset $gui_maker.tmp gui_maker