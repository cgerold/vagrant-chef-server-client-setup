name "node2"
description "Role for node1"

run_list(
	"role[webserver]"
)

override_attributes(
	"mysql" => {
		"server_root_password" => "node2",
	},
)