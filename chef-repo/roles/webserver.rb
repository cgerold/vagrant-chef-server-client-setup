name "webserver"
description "Base role for a webserver"

run_list(
	"recipe[apache2]",
	"recipe[mysql]"
)

default_attributes(
	"apache" => {
		"listen_ports" => ["80"]
	}
)