extends Node

signal input_disabled
signal input_enabled


signal disable_current_world_interactable

#signal camera_input_disabled
#signal camera_input_enabled

##Dialogue
#signal dialogue_spoke(dialogue: String, theme: Theme) ##Dialogue Component to UI
#signal letter_revealed ##For SFX Purposes
#signal dialogue_finished
#Journal
#signal paged_view_opened
#signal paged_view_closed
#signal paged_view_changed_page(forward : bool)
#signal page_component_changed_page(new_image : Texture2D,new_page_number : int)

signal change_mouse_mode(new_mouse_mode : Input.MouseMode)


#signal interaction_target_changed(interaction_component : InteractionComponent)

##Director
signal director_registered_actor(actor_name, actor)
