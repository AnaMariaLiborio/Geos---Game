
extends Control

@onready var title = $MenuContainer/Title
@onready var subtitle = $MenuContainer/Subtitle

@onready var iniciar_button = $MenuContainer/IniciarButton
@onready var tutorial_button = $MenuContainer/TutorialButton
@onready var dupla_button = $MenuContainer/DuplaButton


func _ready() -> void:
    iniciar_button.pressed.connect(_on_iniciar_pressed)
    tutorial_button.pressed.connect(_on_tutorial_pressed)
    dupla_button.pressed.connect(_on_dupla_pressed)


# Inicia a primeira fase do jogo.
func _on_iniciar_pressed() -> void:
    get_tree().change_scene_to_file(
        "res://scenes/Main.tscn"
    )


# Abre a tela de tutorial.
func _on_tutorial_pressed() -> void:
    get_tree().change_scene_to_file(
        "res://scenes/Tutorial.tscn"
    )


# Opção de jogo em dupla.
func _on_dupla_pressed() -> void:
    subtitle.text = "Modo dupla: em desenvolvimento!"
