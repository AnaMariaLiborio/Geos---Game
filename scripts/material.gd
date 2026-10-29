
extends Area2D

@export var item_name: String = "Ferro"
@export var useful_for_repair: bool = true
@export var makes_sense_in_core: bool = true
@export_multiline var scientific_info: String = ""
@export_multiline var repair_info: String = ""


func _ready() -> void:
    add_to_group("materials")


func interact(player: Node) -> void:
    # Monta o relatório científico do Scanner.
    var utility_text: String
    var location_text: String

    if useful_for_repair:
        utility_text = "SIM - " + repair_info
    else:
        utility_text = "NAO - Nao e necessario para o reparo."

    if makes_sense_in_core:
        location_text = "SIM - compativel com o ambiente."
    else:
        location_text = "NAO - material inesperado neste ambiente."

    var report := (
        "=== SCAN GEOS ===\n"
        + "Material: " + item_name + "\n"
        + "Reparo da capsula: " + utility_text + "\n"
        + "Presenca no nucleo: " + location_text + "\n"
        + "Informacao cientifica: " + scientific_info
    )

    player.scan_message.emit(report)

    # Registra o material no inventário.
    player.add_material(item_name)

    # Remove o objeto da fase após a coleta.
    queue_free()

