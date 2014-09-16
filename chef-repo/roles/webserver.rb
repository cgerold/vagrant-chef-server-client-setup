name "webserver"
description "Base role for a webserver"

run_list(
	"recipe[apt]",
	"recipe[apache2]",
	"recipe[php]",
	"recipe[apache2::mod_php5]",
	"recipe[mysql::server]"
)

default_attributes(
	"apache" => {
		"listen_ports" => ["80"],
		"default_site_enabled" => true
	}
)