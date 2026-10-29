
extends Node2D

var collected_items: Dictionary = {}
var required_items: Dictionary = {
    "Ferro": 1,
    "Níquel": 1
}


func _ready() -> void:
    $Player.scan_message.connect(_on_scan_message)
    $Player.material_collected.connect(_on_material_collected)

    $Exit.body_entered.connect(_on_exit_body_entered)

    $HUD/ScanPanel/ScanLabel.text = (
        "GEOS SCAN\nAproxime-se de um material e pressione Z."
    )

    update_inventory()


func _on_scan_message(message: String) -> void:
    $HUD/ScanPanel/ScanLabel.text = message


func _on_material_collected(item_name: String) -> void:
    collected_items[item_name] = (
        collected_items.get(item_name, 0) + 1
    )

    update_inventory()


func update_inventory() -> void:
    var inventory_text := "MATERIAIS COLETADOS\n"

    for item_name in collected_items:
        inventory_text += (
            item_name + ": "
            + str(collected_items[item_name]) + "\n"
        )

    $HUD/InventoryLabel.text = inventory_text

    var objective_complete := true

    for item_name in required_items:
        if collected_items.get(item_name, 0) < required_items[item_name]:
            objective_complete = false

    if objective_complete:
        $HUD/ObjectiveLabel.text = (
            "OBJETIVO: Ferro e niquel coletados! "
            + "Encontre a saida."
        )
    else:
        $HUD/ObjectiveLabel.text = (
            "OBJETIVO: Colete 1 ferro e 1 niquel."
        )


func _on_exit_body_entered(body: Node2D) -> void:
    if body != $Player:
        return

    var objective_complete := true

    for item_name in required_items:
        if collected_items.get(item_name, 0) < required_items[item_name]:
            objective_complete = false

    if objective_complete:
        $HUD/ObjectiveLabel.text = (
            "FASE CONCLUIDA! Capsula pronta para o reparo."
        )
        $HUD/ScanPanel/ScanLabel.text = (
            "GEOS: Amostras registradas. "
            + "Prepare-se para explorar o manto!"
        )
    else:
        $HUD/ScanPanel/ScanLabel.text = (
            "Ainda faltam materiais para completar a missao."
        )

