name "node1"
description "Role for node1"

run_list(
	"role[webserver]"
)

default_attributes(
	"apache" => {
		"server_name" => "node1.dev",
		"docroot" => "/var/www/node1"
	}
)