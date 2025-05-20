#> gui_maker:inventory_change
#
# @private

#インベントリGUIのトリガーをチェック
function gui_maker:inventory/check

# displayアイテムは一度削除
function gui_maker:clear_displayitem

#guiの更新
function gui_maker:general/refresh_all

#リセット処理
advancement revoke @s only gui_maker:inventory_change