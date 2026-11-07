
extends Control

@onready var iniciar_button = $MenuContainer/IniciarButton
@onready var tutorial_button = $MenuContainer/TutorialButton


func _ready() -> void:
    # Conecta os botões às suas funções.
    iniciar_button.pressed.connect(_on_iniciar_pressed)
    tutorial_button.pressed.connect(_on_tutorial_pressed)


# Inicia a primeira fase do jogo.
func _on_iniciar_pressed() -> void:
    get_tree().change_scene_to_file(
        "res://scenes/Main.tscn"
    )


# Abre o tutorial do jogo.
func _on_tutorial_pressed() -> void:
    get_tree().change_scene_to_file(
        "res://scenes/Tutorial.tscn"
    )
