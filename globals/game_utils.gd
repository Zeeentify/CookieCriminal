class_name GameUtils extends Node


# GameUtils.gd
static func is_disabled(caller: Node) -> bool:
	var comp = caller.get_node_or_null("ComponentEnablerComponent")
	return comp != null and not comp.enabled
	
static func toggle_enabled(caller:Node, enabled := true) -> void:
	var comp : ComponentEnablerComponent = caller.get_node_or_null("ComponentEnablerComponent")
	if !comp: return
	comp.enabled = enabled
	return
