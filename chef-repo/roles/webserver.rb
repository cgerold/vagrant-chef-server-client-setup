{
	"name": "webserver",
	"chef_type": "role",
	"json_class": "Chef::Role",
	"description": "Basisrolle für einen Webserver",
	"override_attributes": {},
	"run_list": [
		"recipe[apache2]",
		"recipe[mysql]"
	],
}