#> gui_maker:general/set_page_enderchest
#
# プレイヤーのエンダーチェストページを設定し、更新
# 引数にidが必要
# @user
# @private

# エンダーチェストの中身を消去
function gui_maker:enderchest/clear_all

# ページが存在しない場合
$execute unless data storage gui_maker: pages.enderchest.pages[{id:$(id)}] run tellraw @s {"color":"red","italic":false,"text":"指定されたページ$(id)は存在しません！"}
$execute unless data storage gui_maker: pages.enderchest.pages[{id:$(id)}] run return -1

# 存在すればページを変更
$scoreboard players set @s gui_maker.enderchest.page $(id)
function gui_maker:general/refresh_all