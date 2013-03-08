#! /usr/bin/env sh -v
R='spec/requests/apiary'
c=0
mkdir -p $R
c=$((c+1))
cat > $R/$((c))_main.json.erb <<EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
HOST: http://s2-api.sanger.ac.uk

--- S2 Lims-API ---
---
Welcome to our API documentation. 

S2 API provides a JSON RESTful interface. The path to the root URL \`/\` only is needed to interact with the API.
All the other actions are embedded in every JSON response.
Please note that all URLs are to be considered unstable. As a consequence, you should only refer to the actions
elements returned in the response.

Please find below the different actions available in the JSON:

* \`create\` creates a new resource using a HTTP POST request
* \`read\`, \`first\` and \`last\` actions are used for pagination through HTTP GET requests
* \`update\` action update a resource using a HTTP PUT request
* \`delete\` action delete a resource using a HTTP DELETE request

In top of the above actions, more specific actions are available to interact between multiple resources.
These actions use generally HTTP POST request and are listed under the root JSON response (for example \`/actions/tube_rack_transfer\`).

Please note you will generally find two different URLs to create a new resource, which produce an identical result:
\`/resources\` or \`/actions/create_resource\`.
---
EOD
%>
<%= h.to_json %>
EOF

c=$((c+1))
cat > $R/$((c))_root.json.erb <<EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
--
Root
--

The root JSON lists all the resources available through the API and all the actions which can be performed. 
A resource responds to all the actions listed under its \`actions\` elements.
Consider this URL and the JSON response like the entry point for S2 API. All the other interactions through the 
API can be performed browsing this JSON response.
GET /
> Accept: application/json
< 200
< Content-Type: application/json
{"tubes": {
    "actions": {
        "create": "/tubes",
        "read": "/tubes",
        "first": "/tubes/page=1",
        "last": "/tubes/page=-1"
    }
},
"tube_racks": {
    "actions": {
        "create": "/tube_racks",
        "read": "/tube_racks",
        "first": "/tube_racks/page=1",
        "last": "/tube_racks/page=-1"
    }
},
"create_tubes": {
    "actions": {
        "create": "/actions/create_tube"
    }
},
"create_tube_racks": {
    "actions": {
        "create": "/actions/create_tube_rack"
    }
},
"tube_rack_moves": {
    "actions": {
        "create": "/actions/tube_rack_move"
    }
},
"tube_rack_transfers": {
    "actions": {
        "create": "/actions/tube_rack_transfer"
    }
}}
EOD
%>
<%= h.to_json %>
EOF

C="$R/tube_resource"
mkdir -p $C
cc=$((cc+1))
cat > $C/$((cc))_list_actions_for_a_tube_resource.json.erb <<EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**List actions for a tube resource.**

* \`create\` creates a new tube via HTTP POST request
* \`read\` currently returns the list of actions for a tube resource via HTTP GET request
* \`first\` lists the first tube resources in a page browsing system
* \`last\` lists the last tube resources in a page browsing system
GET /tubes
> Accept: application/json
< 200
< Content-Type: application/json
{ "tubes": {
    "actions": {
        "create": "/tubes",
        "read": "/tubes",
        "first": "/tubes/page=1",
        "last": "/tubes/page=-1"
    }
} }
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_create_an_new_empty_tube.json.erb <<EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Create an new empty tube.**

POST /tubes
> Accept: application/json
{ "tube": {}}
< 200
< Content-Type: application/json
{ "tube": {
    "actions": {
        "read": "/11111111-2222-3333-4444-555555555555",
        "create": "/11111111-2222-3333-4444-555555555555",
        "update": "/11111111-2222-3333-4444-555555555555",
        "delete": "/11111111-2222-3333-4444-555555555555"
    },
    "uuid": "11111111-2222-3333-4444-555555555555",
    "type": null,
    "max_volume": null,
    "aliquots": []
}}                                                     
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_create_a_new_tube_with_samples.json.erb <<EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Create a new tube with samples.** It takes in parameters an array of aliquots, each aliquot is 
identified with the following attributes:

* \`type\` the actual type of the tube
* \`max_volume\` the max volume a tube can hold
* \`sample_uuid\` uuid of a sample
* \`type\` aliquot type
* \`aliquot_quantity\` volume (ul) if liquid, mass (mg) if solid
POST /tubes
> Accept: application/json
{ "tube": { 
    "type": "Eppendorf",
    "max_volume": 2,
    "aliquots": [
        { "sample_uuid": "11111111-2222-3333-4444-666666666666", "type": "NA", "quantity": 5 }
    ] 
}}
< 200
< Content-Type: application/json
{ "tube": {
    "actions": {
        "read": "/11111111-2222-3333-4444-555555555555",
        "create": "/11111111-2222-3333-4444-555555555555",
        "update": "/11111111-2222-3333-4444-555555555555",
        "delete": "/11111111-2222-3333-4444-555555555555"
    },
    "uuid": "11111111-2222-3333-4444-555555555555",
    "type": "Eppendorf",
    "max_volume": 2,
    "aliquots": [
        { "sample": {
            "actions": {
                "read": "/11111111-2222-3333-4444-666666666666",
                "create": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666"
            },
            "uuid": "11111111-2222-3333-4444-666666666666",
            "name": "sample 1"
        },
        "quantity": 5,
        "type": "NA",
        "unit": "mole"
        }
    ]
}}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_update_a_tube.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Update a tube.** All the aliquots in the tube will be updated with 
\`aliquot_type\` and \`aliquot_quantity\`.

* \`type\` the actual type of the tube
* \`max_volume\` the max volume a tube can hold
* \`aliquot_type\`
* \`aliquot_quantity\` volume (ul) if liquid, mass (mg) if solid
PUT /11111111-2222-3333-4444-555555555555
> Accept: application/json
{ "aliquot_type": "DNA", "aliquot_quantity": 10, "type": "Eppendorf", "max_volume": 2 }
< 200
< Content-Type: application/json
{
    "tube": {
        "actions": {
            "read": "/11111111-2222-3333-4444-555555555555",
            "create": "/11111111-2222-3333-4444-555555555555",
            "update": "/11111111-2222-3333-4444-555555555555",
            "delete": "/11111111-2222-3333-4444-555555555555"
        },
        "uuid": "11111111-2222-3333-4444-555555555555",
        "type": "Eppendorf",
        "max_volume": 2,
        "aliquots": [
            { "sample": {
                "actions": {
                    "read": "/11111111-2222-3333-4444-666666666666",
                    "create": "/11111111-2222-3333-4444-666666666666",
                    "update": "/11111111-2222-3333-4444-666666666666",
                    "delete": "/11111111-2222-3333-4444-666666666666"
                },
                "uuid": "11111111-2222-3333-4444-666666666666",
                "name": "sample 1"
            },
            "quantity": 10,
            "type": "DNA",
            "unit": "mole"
            }
        ]
    }
}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_transfer_the_content_from_one_tube_to_multiple_tubes.apierb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Transfer the content from one tube to multiple tubes**.

* \`source_uuid\` source tube uuid
* \`target_uuid\` target tube uuid
* \`amount\` amount taken from source tube and transfered in target tube
* \`fraction\` fraction (between 0 and 1) of each aliquot from source tube to be transfered in target tube (use amount **or** fraction)
* \`aliquot_type\` set a new type for all aliquots in the target tube

The example below shows how to make a transfer from one tube to multiple tubes:

* from tube \`11111111-2222-3333-4444-555555555555\` to tube \`11111111-2222-3333-4444-666666666666\` 
and tube \`11111111-2222-3333-4444-777777777777\`

**Note you can replace tube uuids with spin column uuids in order to make a transfer from one tube to 
a target tube and a target spin columns**
POST /actions/transfer_tubes_to_tubes
> Accept: application/json
{ "transfer_tubes_to_tubes": { 
    "transfers": [
        {
            "source_uuid": "11111111-2222-3333-4444-555555555555", 
            "target_uuid": "11111111-2222-3333-4444-666666666666",
            "amount": 5,
            "aliquot_type": "DNA"
        },
        {
            "source_uuid": "11111111-2222-3333-4444-555555555555", 
            "target_uuid": "11111111-2222-3333-4444-777777777777",
            "amount": 5,
            "aliquot_type": "RNA"
        }
    ]}
}
< 200
< Content-Type: application/json
{ "transfer_tubes_to_tubes": {
    "actions": {},
    "user": "user 1",
    "application": "application 1",
    "result": {
        "sources": [
            { "tube": {
                "actions": {
                    "read": "/11111111-2222-3333-4444-555555555555",
                    "create": "/11111111-2222-3333-4444-555555555555",
                    "update": "/11111111-2222-3333-4444-555555555555",
                    "delete": "/11111111-2222-3333-4444-555555555555"
                },
                "uuid": "11111111-2222-3333-4444-555555555555",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    { "sample": {
                        "actions": {
                            "read": "/11111111-2222-3333-0000-000000000000",
                            "create": "/11111111-2222-3333-0000-000000000000",
                            "update": "/11111111-2222-3333-0000-000000000000",
                            "delete": "/11111111-2222-3333-0000-000000000000"
                        },
                        "uuid": "11111111-2222-3333-0000-000000000000",
                        "name": "sample 1"
                    },
                    "quantity": 10,
                    "type": "NA",
                    "unit": "mole"
                    }
                ]
            }}
        ],
        "targets": [
            { "tube": {
                "actions": {
                    "read": "/11111111-2222-3333-4444-666666666666",
                    "create": "/11111111-2222-3333-4444-666666666666",
                    "update": "/11111111-2222-3333-4444-666666666666",
                    "delete": "/11111111-2222-3333-4444-666666666666"
                },
                "uuid": "11111111-2222-3333-4444-666666666666",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    { "sample": {
                        "actions": {
                            "read": "/11111111-2222-3333-0000-000000000000",
                            "create": "/11111111-2222-3333-0000-000000000000",
                            "update": "/11111111-2222-3333-0000-000000000000",
                            "delete": "/11111111-2222-3333-0000-000000000000"
                        },
                        "uuid": "11111111-2222-3333-0000-000000000000",
                        "name": "sample 1"
                    },
                    "quantity": 5,
                    "type": "DNA",
                    "unit": "mole"
                    }
                ]
            }},
            { "tube": {
                "actions": {
                    "read": "/11111111-2222-3333-4444-777777777777",
                    "create": "/11111111-2222-3333-4444-777777777777",
                    "update": "/11111111-2222-3333-4444-777777777777",
                    "delete": "/11111111-2222-3333-4444-777777777777"
                },
                "uuid": "11111111-2222-3333-4444-777777777777",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    { "sample": {
                        "actions": {
                            "read": "/11111111-2222-3333-0000-000000000000",
                            "create": "/11111111-2222-3333-0000-000000000000",
                            "update": "/11111111-2222-3333-0000-000000000000",
                            "delete": "/11111111-2222-3333-0000-000000000000"
                        },
                        "uuid": "11111111-2222-3333-0000-000000000000",
                        "name": "sample 1"
                    },
                    "quantity": 5,
                    "type": "RNA",
                    "unit": "mole"
                    }
                ]
            }}
        ],
    },
    "transfers": [
        {
            "source_uuid": "11111111-2222-3333-4444-555555555555", 
            "target_uuid": "11111111-2222-3333-4444-666666666666",
            "amount": 5,
            "aliquot_type": "DNA"
        },
        {
            "source_uuid": "11111111-2222-3333-4444-555555555555", 
            "target_uuid": "11111111-2222-3333-4444-777777777777",
            "amount": 5,
            "aliquot_type": "RNA"
        }
    ]
}}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_tranfer_the_content_from_multiples_tubes_to_multiples_tubes.apierb.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Transfer the content from multiple tubes to multiple tubes**. 

* \`source_uuid\` source tube uuid
* \`target_uuid\` target tube uuid
* \`amount\` amount taken from source tube and transfered in target tube
* \`fraction\` fraction (between 0 and 1) of each aliquot from source tube to be transfered in target tube (use amount **or** fraction)
* \`aliquot_type\` set a new type for all aliquots in the target tube

The example below shows how to make a tubes to tubes transfer in one action:

* from tube \`11111111-2222-3333-4444-555555555555\` to tube \`11111111-2222-3333-4444-666666666666\` 
* from tube \`11111111-2222-3333-4444-777777777777\` to tube \`11111111-2222-3333-4444-888888888888\`

**Note you can replace tube uuids with spin column uuids in order to make tubes to spin columns transfer
and spin columns to tubes transfer.**
POST /actions/transfer_tubes_to_tubes
> Accept: application/json
{ "transfer_tubes_to_tubes": { 
    "transfers": [
        {
            "source_uuid": "11111111-2222-3333-4444-555555555555", 
            "target_uuid": "11111111-2222-3333-4444-666666666666",
            "amount": 5,
            "aliquot_type": "DNA"
        },
        {
            "source_uuid": "11111111-2222-3333-4444-777777777777", 
            "target_uuid": "11111111-2222-3333-4444-888888888888",
            "amount": 5,
            "aliquot_type": "RNA"
        }
    ]}
}
< 200
< Content-Type: application/json
{ "transfer_tubes_to_tubes": {
    "actions": {},
    "user": "user 1",
    "application": "application 1",
    "result": {
        "sources": [
            { "tube": {
                "actions": {
                    "read": "/11111111-2222-3333-4444-555555555555",
                    "create": "/11111111-2222-3333-4444-555555555555",
                    "update": "/11111111-2222-3333-4444-555555555555",
                    "delete": "/11111111-2222-3333-4444-555555555555"
                },
                "uuid": "11111111-2222-3333-4444-555555555555",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    { "sample": {
                        "actions": {
                            "read": "/11111111-2222-3333-0000-000000000000",
                            "create": "/11111111-2222-3333-0000-000000000000",
                            "update": "/11111111-2222-3333-0000-000000000000",
                            "delete": "/11111111-2222-3333-0000-000000000000"
                        },
                        "uuid": "11111111-2222-3333-0000-000000000000",
                        "name": "sample 1"
                    },
                    "quantity": 5,
                    "type": "DNA",
                    "unit": "mole"
                    }
                ]
            }},
            { "tube": {
                "actions": {
                    "read": "/11111111-2222-3333-4444-666666666666",
                    "create": "/11111111-2222-3333-4444-666666666666",
                    "update": "/11111111-2222-3333-4444-666666666666",
                    "delete": "/11111111-2222-3333-4444-666666666666"
                },
                "uuid": "11111111-2222-3333-4444-666666666666",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    { "sample": {
                        "actions": {
                            "read": "/11111111-2222-3333-0000-000000111111",
                            "create": "/11111111-2222-3333-0000-000000111111",
                            "update": "/11111111-2222-3333-0000-000000111111",
                            "delete": "/11111111-2222-3333-0000-000000111111"
                        },
                        "uuid": "11111111-2222-3333-0000-000000111111",
                        "name": "sample 1"
                    },
                    "quantity": 5,
                    "type": "DNA",
                    "unit": "mole"
                    }
                ]
            }}
        ],
        "targets": [
            { "tube": {
                "actions": {
                    "read": "/11111111-2222-3333-4444-777777777777",
                    "create": "/11111111-2222-3333-4444-777777777777",
                    "update": "/11111111-2222-3333-4444-777777777777",
                    "delete": "/11111111-2222-3333-4444-777777777777"
                },
                "uuid": "11111111-2222-3333-4444-777777777777",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    { "sample": {
                        "actions": {
                            "read": "/11111111-2222-3333-0000-000000000000",
                            "create": "/11111111-2222-3333-0000-000000000000",
                            "update": "/11111111-2222-3333-0000-000000000000",
                            "delete": "/11111111-2222-3333-0000-000000000000"
                        },
                        "uuid": "11111111-2222-3333-0000-000000000000",
                        "name": "sample 1"
                    },
                    "quantity": 5,
                    "type": "DNA",
                    "unit": "mole"
                    }
                ]
            }},   
            { "tube": {
                "actions": {
                    "read": "/11111111-2222-3333-4444-888888888888",
                    "create": "/11111111-2222-3333-4444-888888888888",
                    "update": "/11111111-2222-3333-4444-888888888888",
                    "delete": "/11111111-2222-3333-4444-888888888888"
                },
                "uuid": "11111111-2222-3333-4444-888888888888",
                "type": null,
                "max_volume": null,
                "aliquots": [
                    { "sample": {
                        "actions": {
                            "read": "/11111111-2222-3333-0000-000000111111",
                            "create": "/11111111-2222-3333-0000-000000111111",
                            "update": "/11111111-2222-3333-0000-000000111111",
                            "delete": "/11111111-2222-3333-0000-000000111111"
                        },
                        "uuid": "11111111-2222-3333-0000-000000111111",
                        "name": "sample 1"
                    },
                    "quantity": 5,
                    "type": "DNA",
                    "unit": "mole"
                    }
                ]
            }}
        ]
    },
    "transfers": [
        {
            "source_uuid": "11111111-2222-3333-4444-555555555555", 
            "target_uuid": "11111111-2222-3333-4444-666666666666",
            "amount": 5,
            "aliquot_type": "DNA"
        },
        {
            "source_uuid": "11111111-2222-3333-4444-777777777777", 
            "target_uuid": "11111111-2222-3333-4444-888888888888",
            "amount": 5,
            "aliquot_type": "RNA"
        }
    ]
}}
EOD
%>
<%= h.to_json %>
EOF

C="$R/tube_rack_resource"
mkdir -p $C
cc=0
cc=$((cc+1))
cat > $C/$((cc))_list_actions_for_tube_rack_resource.json.erb << EOF 
<%
require 'json'
h={}
h[:doc]=<<EOD
**List actions for tube rack resource.**

* \`create\` creates a new tube rack via HTTP POST request
* \`read\` currently returns the list of actions for a tube rack resource via HTTP GET request
* \`first\` lists the first tube rack resources in a page browsing system
* \`last\` lists the last tube rack resources in a page browsing system
GET /tube_racks
> Accept: application/json
< 200
< Content-Type: application/json
{ "tube_racks": {
    "actions": {
        "create": "/tube_racks",
        "read": "/tube_racks",
        "first": "/tube_racks/page=1",
        "last": "/tube_racks/page=-1"
    }
} }
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_create_a_new_empty_tube_rack.json.erb << EOF 
<%
require 'json'
h={}
h[:doc]=<<EOD
**Create a new empty tube rack.**

* \`number_of_rows\` number of rows in the rack
* \`number_of_columns\` number of columns in the rack
* \`tubes\` map tubes identified by their uuids to rack locations
POST /tube_racks
> Accept: application/json
{ "tube_rack": {
    "number_of_rows": 8,
    "number_of_columns": 12,
    "tubes": {}
}}
< 200
< Content-Type: application/json
{ "tube_rack": {
    "actions": {
        "create": "/11111111-2222-3333-4444-555555555555",
        "read": "/11111111-2222-3333-4444-555555555555",
        "update": "/11111111-2222-3333-4444-555555555555",
        "delete": "/11111111-2222-3333-4444-555555555555"
    },
    "uuid": "11111111-2222-3333-4444-555555555555",
    "number_of_rows": 8,
    "number_of_columns": 12,
    "tubes": {}
}}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_create_a_new_tube_rack_and_add_it_multipe_tubes.json.erb << EOF 
<%
require 'json'
h={}
h[:doc]=<<EOD
**Create a new tube rack and add it multiple tubes.**

* \`number_of_rows\` number of rows in the rack
* \`number_of_columns\` number of columns in the rack
* \`tubes\` map tubes identified by their uuids to rack locations
POST /tube_racks
> Accept: application/json
{ "tube_rack": {
    "number_of_rows": 8,
    "number_of_columns": 12,
    "tubes": {
        "A1": "11111111-2222-3333-4444-555555555555",
        "E5": "11111111-2222-3333-4444-666666666666"
    }
} }
< 200
< Content-Type: application/json
{ "tube_rack": {
    "actions": {
        "create": "/11111111-2222-3333-4444-777777777777",
        "read": "/11111111-2222-3333-4444-777777777777",
        "update": "/11111111-2222-3333-4444-777777777777",
        "delete": "/11111111-2222-3333-4444-777777777777"
    },
    "uuid": "11111111-2222-3333-4444-777777777777",
    "number_of_rows": 8,
    "number_of_columns": 12,
    "tubes": {
        "A1": {
            "actions": {
                "create": "/11111111-2222-3333-4444-555555555555",
                "read": "/11111111-2222-3333-4444-555555555555",
                "update": "/11111111-2222-3333-4444-555555555555",
                "delete": "/11111111-2222-3333-4444-555555555555"
            },
            "uuid": "11111111-2222-3333-4444-555555555555",
            "type": null,
            "max_volume": null,
            "aliquots": [
                {
                    "sample": {
                        "actions": {
                            "read": "/11111111-2222-3333-0000-000000000000",
                            "create": "/11111111-2222-3333-0000-000000000000",
                            "update": "/11111111-2222-3333-0000-000000000000",
                            "delete": "/11111111-2222-3333-0000-000000000000"
                        },
                        "uuid": "11111111-2222-3333-0000-000000000000",
                        "name": "sample 1"
                    },
                    "quantity": 5,
                    "type": "NA",
                    "unit": "mole"
                }
            ]
        },
        "E5": {
            "actions": {
                "read": "/11111111-2222-3333-4444-666666666666",
                "create": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666"
            },
            "uuid": "11111111-2222-3333-4444-666666666666",
            "type": null,
            "max_volume": null,
            "aliquots": [
                {
                    "sample": {
                        "actions": {
                            "read": "/11111111-2222-3333-0000-000000111111",
                            "create": "/11111111-2222-3333-0000-000000111111",
                            "update": "/11111111-2222-3333-0000-000000111111",
                            "delete": "/11111111-2222-3333-0000-000000111111"
                        },
                        "uuid": "11111111-2222-3333-0000-000000111111",
                        "name": "sample 2"
                    },
                    "quantity": 10,
                    "type": "RNA",
                    "unit": "mole"
                }
            ]
        }
    }
}}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_update_a_tube_rack.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Update a tube rack.**
All aliquots in each tube of the tube rack will be updated with 
\`aliquot_type\` and \`aliquot_quantity\`.

* \`aliquot_type\`
* \`aliquot_quantity\` volume (ul) if liquid, mass (mg) if solid
PUT /11111111-2222-3333-4444-777777777777
> Accept: application/json
{ "aliquot_type": "DNA", "aliquot_quantity": 10 }
< 200
< Content-Type: application/json
{ "tube_rack": {
    "actions": {
        "create": "/11111111-2222-3333-4444-777777777777",
        "read": "/11111111-2222-3333-4444-777777777777",
        "update": "/11111111-2222-3333-4444-777777777777",
        "delete": "/11111111-2222-3333-4444-777777777777"
    },
    "uuid": "11111111-2222-3333-4444-777777777777",
    "number_of_rows": 8,
    "number_of_columns": 12,
    "tubes": {
        "A1": {
            "actions": {
                "create": "/11111111-2222-3333-4444-555555555555",
                "read": "/11111111-2222-3333-4444-555555555555",
                "update": "/11111111-2222-3333-4444-555555555555",
                "delete": "/11111111-2222-3333-4444-555555555555"
            },
            "uuid": "11111111-2222-3333-4444-555555555555",
            "type": null,
            "max_volume": null,
            "aliquots": [
                {
                    "sample": {
                        "actions": {
                            "read": "/11111111-2222-3333-0000-000000000000",
                            "create": "/11111111-2222-3333-0000-000000000000",
                            "update": "/11111111-2222-3333-0000-000000000000",
                            "delete": "/11111111-2222-3333-0000-000000000000"
                        },
                        "uuid": "11111111-2222-3333-0000-000000000000",
                        "name": "sample 1"
                    },
                    "quantity": 10,
                    "type": "DNA",
                    "unit": "mole"
                }
            ]
        },
        "E5": {
            "actions": {
                "read": "/11111111-2222-3333-4444-666666666666",
                "create": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666"
            },
            "uuid": "11111111-2222-3333-4444-666666666666",
            "type": null,
            "max_volume": null,
            "aliquots": [
                {
                    "sample": {
                        "actions": {
                            "read": "/11111111-2222-3333-0000-000000111111",
                            "create": "/11111111-2222-3333-0000-000000111111",
                            "update": "/11111111-2222-3333-0000-000000111111",
                            "delete": "/11111111-2222-3333-0000-000000111111"
                        },
                        "uuid": "11111111-2222-3333-0000-000000111111",
                        "name": "sample 2"
                    },
                    "quantity": 10,
                    "type": "DNA",
                    "unit": "mole"
                }
            ]
        }
    }
}}

**Transfer tubes content from a source tube rack to a target tube rack according to a transfer map.** 
As it is a content transfer between tubes in tube racks, targeted locations mentionned in the transfer map 
need to contain tubes.

* \`source_uuid\` uuid of the source tube rack
* \`target_uuid\` uuid of the target tube rack
* \`transfer_map\` map locations in the source tube rack to other locations in the target tube rack

In the example below, the content of the tube in B5 in the tube rack \`11111111-2222-3333-4444-555555555555\` is
tranfered into the tube in C3 in the tube rack \`11111111-2222-3333-4444-666666666666\`.

POST /actions/tube_rack_transfer
> Accept: application/json
{ "tube_rack_transfer": {
    "source_uuid": "11111111-2222-3333-4444-555555555555",
    "target_uuid": "11111111-2222-3333-4444-666666666666",
    "transfer_map": { "B5": "C3" }
}}
< 200
< Content-Type: application/json
{ "tube_rack_transfer": {
    "actions": {},
    "user": "user",
    "application": "application",
    "result": {
        "tube_rack": {
            "actions": {
                "read": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666",
                "create": "/11111111-2222-3333-4444-666666666666"
            },
            "uuid": "11111111-2222-3333-4444-666666666666",
            "number_of_rows": 8,
            "number_of_columns": 12,
            "tubes": {
                "C3": {
                    "actions": {
                        "read": "/11111111-2222-3333-4444-777777777777",
                        "create": "/11111111-2222-3333-4444-777777777777",
                        "update": "/11111111-2222-3333-4444-777777777777",
                        "delete": "/11111111-2222-3333-4444-777777777777"
                    },
                    "uuid": "11111111-2222-3333-4444-777777777777",
                    "type": null,
                    "max_volume": null,
                    "aliquots": [ 
                        {"sample": {
                            "actions": {
                                "read": "/11111111-2222-3333-4444-000000000000",
                                "update": "/11111111-2222-3333-4444-000000000000",
                                "delete": "/11111111-2222-3333-4444-000000000000",
                                "create": "/11111111-2222-3333-4444-000000000000" 
                            },
                            "uuid": "11111111-2222-3333-4444-000000000000",
                            "name": "sample 1"
                        },
                        "quantity": 10,
                        "type": "sample",
                        "unit": "mole"
                        } 
                    ]
                }
            }        
        }
    },
    "source": {
        "tube_rack": {
            "actions": {
                "read": "/11111111-2222-3333-4444-555555555555",
                "update": "/11111111-2222-3333-4444-555555555555",
                "delete": "/11111111-2222-3333-4444-555555555555",
                "create": "/11111111-2222-3333-4444-555555555555"
            },
        "uuid": "11111111-2222-3333-4444-555555555555",
        "number_of_rows": 8,
        "number_of_columns": 12,
        "tubes": {
                "B5": {
                    "actions": {
                        "read": "/11111111-2222-3333-4444-777777777777",
                        "create": "/11111111-2222-3333-4444-777777777777",
                        "update": "/11111111-2222-3333-4444-777777777777",
                        "delete": "/11111111-2222-3333-4444-777777777777"
                    },
                    "uuid": "11111111-2222-3333-4444-777777777777",
                    "type": null,
                    "max_volume": null,
                    "aliquots": [ 
                        {"sample": {
                            "actions": {
                                "read": "/11111111-2222-3333-4444-000000000000",
                                "update": "/11111111-2222-3333-4444-000000000000",
                                "delete": "/11111111-2222-3333-4444-000000000000",
                                "create": "/11111111-2222-3333-4444-000000000000" 
                            },
                            "uuid": "11111111-2222-3333-4444-000000000000",
                            "name": "sample 1"
                        },
                        "quantity": 0,
                        "type": "sample",
                        "unit": "mole"
                        } 
                    ]
                }
            }        
        }
    },
    "target": {
        "tube_rack": {
            "actions": {
                "read": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666",
                "create": "/11111111-2222-3333-4444-666666666666"
            },
        "uuid": "11111111-2222-3333-4444-666666666666",
        "number_of_rows": 8,
        "number_of_columns": 12,
        "tubes": {
                "C3": {
                    "actions": {
                        "read": "/11111111-2222-3333-4444-777777777777",
                        "create": "/11111111-2222-3333-4444-777777777777",
                        "update": "/11111111-2222-3333-4444-777777777777",
                        "delete": "/11111111-2222-3333-4444-777777777777"
                    },
                    "uuid": "11111111-2222-3333-4444-777777777777",
                    "type": null,
                    "max_volume": null,
                    "aliquots": [ 
                        {"sample": {
                            "actions": {
                                "read": "/11111111-2222-3333-4444-000000000000",
                                "update": "/11111111-2222-3333-4444-000000000000",
                                "delete": "/11111111-2222-3333-4444-000000000000",
                                "create": "/11111111-2222-3333-4444-000000000000" 
                            },
                            "uuid": "11111111-2222-3333-4444-000000000000",
                            "name": "sample 1"
                        },
                        "quantity": 10,
                        "type": "sample",
                        "unit": "mole"
                        } 
                    ]
                }
            }
        }
    },
    "transfer_map": { "B5": "C3" }
}}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_physically_move_tubes_from_a_source_tube_rack.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Physically move tubes from a source tube rack to a target tube rack according to a move map.**
As it physically moves tubes, targeted locations mentionned in the move map need to be empty.

* \`source_uuid\` uuid of the source tube rack
* \`target_uuid\` uuid of the target tube rack
* \`move_map\` map locations in the source tube rack to other locations in the target tube rack

In the example below, the tube in B5 in the tube rack \`11111111-2222-3333-4444-555555555555\` is moved 
into the location C3 in the tube rack \`11111111-2222-3333-4444-666666666666\`.

POST /actions/tube_rack_move
> Accept: application/json
{ "tube_rack_move": {
    "source_uuid": "11111111-2222-3333-4444-555555555555",
    "target_uuid": "11111111-2222-3333-4444-666666666666",
    "move_map": { "B5": "C3" }
}}
< 200
< Content-Type: application/json
{ "tube_rack_transfer": {
    "actions": {},
    "user": "user",
    "application": "application",
    "result": {
        "tube_rack": {
            "actions": {
                "read": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666",
                "create": "/11111111-2222-3333-4444-666666666666"
            },
            "uuid": "11111111-2222-3333-4444-666666666666",
            "number_of_rows": 8,
            "number_of_columns": 12,
            "tubes": {
                "C3": {
                    "actions": {
                        "read": "/11111111-2222-3333-4444-777777777777",
                        "create": "/11111111-2222-3333-4444-777777777777",
                        "update": "/11111111-2222-3333-4444-777777777777",
                        "delete": "/11111111-2222-3333-4444-777777777777"
                    },
                    "uuid": "11111111-2222-3333-4444-777777777777",
                    "type": null,
                    "max_volume": null,
                    "aliquots": [ 
                        {"sample": {
                            "actions": {
                                "read": "/11111111-2222-3333-4444-000000000000",
                                "update": "/11111111-2222-3333-4444-000000000000",
                                "delete": "/11111111-2222-3333-4444-000000000000",
                                "create": "/11111111-2222-3333-4444-000000000000" 
                            },
                            "uuid": "11111111-2222-3333-4444-000000000000",
                            "name": "sample 1"
                        },
                        "quantity": 10,
                        "type": "sample",
                        "unit": "mole"
                        } 
                    ]
                }
            }        
        }
    },
    "source": {
        "tube_rack": {
            "actions": {
                "read": "/11111111-2222-3333-4444-555555555555",
                "update": "/11111111-2222-3333-4444-555555555555",
                "delete": "/11111111-2222-3333-4444-555555555555",
                "create": "/11111111-2222-3333-4444-555555555555"
            },
        "uuid": "11111111-2222-3333-4444-555555555555",
        "number_of_rows": 8,
        "number_of_columns": 12,
        "tubes": {}        
        }
    },
    "target": {
        "tube_rack": {
            "actions": {
                "read": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666",
                "create": "/11111111-2222-3333-4444-666666666666"
            },
            "uuid": "11111111-2222-3333-4444-666666666666",
            "number_of_rows": 8,
            "number_of_columns": 12,
            "tubes": {
                "C3": {
                    "actions": {
                        "read": "/11111111-2222-3333-4444-777777777777",
                        "create": "/11111111-2222-3333-4444-777777777777",
                        "update": "/11111111-2222-3333-4444-777777777777",
                        "delete": "/11111111-2222-3333-4444-777777777777"
                    },
                    "uuid": "11111111-2222-3333-4444-777777777777",
                    "type": null,
                    "max_volume": null,
                    "aliquots": [ 
                        {"sample": {
                            "actions": {
                                "read": "/11111111-2222-3333-4444-000000000000",
                                "update": "/11111111-2222-3333-4444-000000000000",
                                "delete": "/11111111-2222-3333-4444-000000000000",
                                "create": "/11111111-2222-3333-4444-000000000000" 
                            },
                            "uuid": "11111111-2222-3333-4444-000000000000",
                            "name": "sample 1"
                        },
                        "quantity": 10,
                        "type": "sample",
                        "unit": "mole"
                        } 
                    ]
                }
            }
        }
    },
    "move_map": { "B5": "C3" }
}}
EOD
%>
<%= h.to_json %>
EOF

C="$R/spin_column_resource"
mkdir -p $C
cc=0
cc=$((cc+1))
cat > $C/$((cc))_list_actions_for_spin_column_resource.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**List actions for spin column resource.**

* \`create\` creates a new spin column via HTTP POST request
* \`read\` returns the list of actions for a spin column resource via HTTP GET request
* \`first\` lists the first spin columns resources in a page browsing system
* \`last\` lists the last spin columns resources in a page browsing system
GET /spin_columns
> Accept: application/json
< 200
< Content-Type: application/json
{ "spin_columns": {
    "actions": {
        "create": "/spin_columns",
        "read": "/spin_columns",
        "first": "/spin_columns/page=1",
        "last": "/spin_columns/page=-1"
    }
} }
EOD
%>
<%= h.to_json %>
EOF


cc=$((cc+1))
cat > $C/$((cc))_create_a_new_empty_spin_column.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Create a new empty spin column.**
POST /spin_columns
> Accept: application/json
{ "spin_column": {} }
< 200
< Content-Type: application/json
{ "spin_columns": {
    "actions": {
        "read": "/11111111-2222-3333-4444-555555555555",
        "create": "/11111111-2222-3333-4444-555555555555",
        "update": "/11111111-2222-3333-4444-555555555555",
        "delete": "/11111111-2222-3333-4444-555555555555"
    },
    "uuid": "11111111-2222-3333-4444-555555555555",
    "aliquots": []
}}
EOD
%>
<%= h.to_json %>
EOF

C="$R/plate_resource"
mkdir -p $C
cc=0
cc=$((cc+1))
cat > $C/$((cc))_list_actions_for_tube_rack_resource.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**List actions for tube rack resource.**

* \`create\` creates a new plate via HTTP POST request
* \`read\` returns the list of actions for a plate resource via HTTP GET request
* \`first\` lists the first plate resources in a page browsing system
* \`last\` lists the last plate resources in a page browsing system
GET /plates
> Accept: application/json
< 200
< Content-Type: application/json
{ "plates": {
    "actions": {
        "create": "/plates",
        "read": "/plates",
        "first": "/plates/page=1",
        "last": "/plates/page=-1"
    }
} }
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_create_a_new_empty_plate.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Create a new empty plate.**

* \`number_of_rows\` number of rows in the plate
* \`number_of_columns\` number of columns in the plate
* \`type\` actual type of the plate
* \`wells_description\` map aliquots to well locations
POST /plates
> Accept: application/json
{ "plate": {
    "number_of_rows": 8,
    "number_of_columns": 12,
    "type": "plate type",
    "wells_description": {}
}}
< 200
< Content-Type: application/json
{ "plate": {
    "actions": {
        "read": "/11111111-2222-3333-4444-555555555555",
        "update": "/11111111-2222-3333-4444-555555555555",
        "delete": "/11111111-2222-3333-4444-555555555555",
        "create": "/11111111-2222-3333-4444-555555555555"
    },
    "uuid": "11111111-2222-3333-4444-555555555555",
    "number_of_rows": 8,
    "number_of_columns": 12,
    "type": "plate type",
    "wells": { 
        "A1": [], "A2": [], "A3": [], "A4": [], "A5": [], "A6": [], "A7": [], "A8": [], "A9": [], "A10": [], "A11": [], "A12": [],
        "B1": [], "B2": [], "B3": [], "B4": [], "B5": [], "B6": [], "B7": [],"B8": [],"B9": [],"B10": [],"B11": [],"B12": [],
        "C1": [], "C2": [], "C3": [], "C4": [], "C5": [], "C6": [], "C7": [],"C8": [],"C9": [],"C10": [],"C11": [],"C12": [],
        "D1": [], "D2": [], "D3": [], "D4": [], "D5": [], "D6": [], "D7": [],"D8": [],"D9": [],"D10": [],"D11": [],"D12": [],
        "E1": [], "E2": [], "E3": [], "E4": [], "E5": [], "E6": [], "E7": [],"E8": [],"E9": [],"E10": [],"E11": [],"E12": [],
        "F1": [], "F2": [], "F3": [], "F4": [], "F5": [], "F6": [], "F7": [],"F8": [],"F9": [],"F10": [],"F11": [],"F12": [],
        "G1": [], "G2": [], "G3": [], "G4": [], "G5": [], "G6": [], "G7": [],"G8": [],"G9": [],"G10": [],"G11": [],"G12": [],
        "H1": [], "H2": [], "H3": [], "H4": [], "H5": [], "H6": [], "H7": [],"H8": [],"H9": [],"H10": [],"H11": [],"H12": []}
}}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_create_a_new_plate_with_samples.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Create a new plate with samples.**

* \`number_of_rows\` number of rows in the plate
* \`number_of_columns\` number of columns in the plate
* \`type\` actual type of the plate
* \`wells_description\` map aliquots to well locations
POST /plates
> Accept: application/json
{ "plate": {
    "number_of_rows": 8,
    "number_of_columns": 12,
    "type": "plate type",
    "wells_description": { 
        "C5": [{ "sample": "11111111-2222-3333-4444-666666666666", "type": "DNA", "quantity": 10 }]
} }
< 200
< Content-Type: application/json
{ "plate": {
    "actions": {
        "read": "/11111111-2222-3333-4444-555555555555",
        "update": "/11111111-2222-3333-4444-555555555555",
        "delete": "/11111111-2222-3333-4444-555555555555",
        "create": "/11111111-2222-3333-4444-555555555555"
    },
    "uuid": "11111111-2222-3333-4444-555555555555",
    "number_of_rows": 8,
    "number_of_columns": 12,
    "type": "plate type",
    "wells": { 
        "A1": [], "A2": [], "A3": [], "A4": [], "A5": [], "A6": [], "A7": [], "A8": [], "A9": [], "A10": [], "A11": [], "A12": [],
        "B1": [], "B2": [], "B3": [], "B4": [], "B5": [], "B6": [], "B7": [],"B8": [],"B9": [],"B10": [],"B11": [],"B12": [],
        "C1": [], "C2": [], "C3": [], "C4": [], 
        "C5": [ { "sample": {
            "actions": { 
                "read": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666",
                "create": "/11111111-2222-3333-4444-666666666666" 
            },
            "uuid": "11111111-2222-3333-4444-666666666666",
            "name": "sample 1"},
            "quantity": 10,
            "type": "DNA",
            "unit": "mole"
        } ],
        "C6": [],"C7": [],"C8": [],"C9": [],"C10": [],"C11": [],"C12": [],
        "D1": [], "D2": [], "D3": [], "D4": [], "D5": [], "D6": [], "D7": [],"D8": [],"D9": [],"D10": [],"D11": [],"D12": [],
        "E1": [], "E2": [], "E3": [], "E4": [], "E5": [], "E6": [], "E7": [],"E8": [],"E9": [],"E10": [],"E11": [],"E12": [],
        "F1": [], "F2": [], "F3": [], "F4": [], "F5": [], "F6": [], "F7": [],"F8": [],"F9": [],"F10": [],"F11": [],"F12": [],
        "G1": [], "G2": [], "G3": [], "G4": [], "G5": [], "G6": [], "G7": [],"G8": [],"G9": [],"G10": [],"G11": [],"G12": [],
        "H1": [], "H2": [], "H3": [], "H4": [], "H5": [], "H6": [], "H7": [],"H8": [],"H9": [],"H10": [],"H11": [],"H12": []}
}}
EOD
%>
<%= h.to_json %>
EOF


cc=$((cc+1))
cat > $C/$((cc))_update_a_plate.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Update a plate.**
All the aliquots in each well of the plate will be updated with \`aliquot_type\` and \`aliquot_quantity\`.

* \`type\` new type of the plate
* \`aliquot_type\` new type of aliquots
* \`aliquot_quantity\` new quantity of aliquots. volume (ul) if liquid, mass (mg) if solid.

PUT /11111111-2222-3333-4444-555555555555
> Accept: applicatin/json
{ "type": "new plate type", "aliquot_type": "RNA", "aliquot_quantity": 10 }
< 200
< Content-Type: application/json
{ "plate": {
    "actions": {
        "read": "/11111111-2222-3333-4444-555555555555",
        "update": "/11111111-2222-3333-4444-555555555555",
        "delete": "/11111111-2222-3333-4444-555555555555",
        "create": "/11111111-2222-3333-4444-555555555555"
    },
    "uuid": "11111111-2222-3333-4444-555555555555",
    "number_of_rows": 8,
    "number_of_columns": 12,
    "type": "new plate type",
    "wells": { 
        "A1": [], "A2": [], "A3": [], "A4": [], "A5": [], "A6": [], "A7": [], "A8": [], "A9": [], "A10": [], "A11": [], "A12": [],
        "B1": [], "B2": [], "B3": [], "B4": [], "B5": [], "B6": [], "B7": [],"B8": [],"B9": [],"B10": [],"B11": [],"B12": [],
        "C1": [], "C2": [], "C3": [], "C4": [], 
        "C5": [ { "sample": {
            "actions": { 
                "read": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666",
                "create": "/11111111-2222-3333-4444-666666666666" 
            },
            "uuid": "11111111-2222-3333-4444-666666666666",
            "name": "sample 1"},
            "quantity": 10,
            "type": "RNA",
            "unit": "mole"
        } ],
        "C6": [],"C7": [],"C8": [],"C9": [],"C10": [],"C11": [],"C12": [],
        "D1": [], "D2": [], "D3": [], "D4": [], "D5": [], "D6": [], "D7": [],"D8": [],"D9": [],"D10": [],"D11": [],"D12": [],
        "E1": [], "E2": [], "E3": [], "E4": [], "E5": [], "E6": [], "E7": [],"E8": [],"E9": [],"E10": [],"E11": [],"E12": [],
        "F1": [], "F2": [], "F3": [], "F4": [], "F5": [], "F6": [], "F7": [],"F8": [],"F9": [],"F10": [],"F11": [],"F12": [],
        "G1": [], "G2": [], "G3": [], "G4": [], "G5": [], "G6": [], "G7": [],"G8": [],"G9": [],"G10": [],"G11": [],"G12": [],
        "H1": [], "H2": [], "H3": [], "H4": [], "H5": [], "H6": [], "H7": [],"H8": [],"H9": [],"H10": [],"H11": [],"H12": []}
}}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_transfer_content_from_a_source_plate_to_a_target_plate.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Transfer content from a source plate to a target plate.**

* \`source_uuid\` uuid of the source plate
* \`target_uuid\` uuid of the target plate
* \`transfer_map\` map locations in the source plate to other locations in the target plate
* \`aliquot_type\` set a new type for all aliquots in the target plate

POST /actions/plate_transfer
> Accept: application/json
{ "plate_transfer": {
    "source_uuid": "11111111-2222-3333-4444-555555555555",
    "target_uuid": "11111111-2222-3333-4444-666666666666",
    "transfer_map": { "C5": "B2"},
    "aliquot_type": "new type"
}}
< 200
< Content-Type: application/json
{ "plate_transfer": {
    "actions": {},
    "user": "user",
    "application": "application",
    "result": {
        "plate": {
            "actions": {
                "read": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666",
                "create": "/11111111-2222-3333-4444-666666666666"
            },
            "uuid": "11111111-2222-3333-4444-666666666666",
            "number_of_rows": 8,
            "number_of_columns": 12,
            "type": "target plate type",
            "wells": {
                "A1": [], "A2": [], "A3": [], "A4": [], "A5": [], "A6": [], "A7": [], "A8": [], "A9": [], "A10": [], "A11": [], "A12": [], 
                "B1": [], 
                "B2": [ { 
                    "sample": {
                        "actions": { 
                            "read": "/11111111-2222-3333-4444-777777777777",
                            "update": "/11111111-2222-3333-4444-777777777777",
                            "delete": "/11111111-2222-3333-4444-777777777777",
                            "create": "/11111111-2222-3333-4444-777777777777"
                        },
                    "uuid": "11111111-2222-3333-4444-777777777777",
                    "name": "sample 1"},
                    "quantity": 10,
                    "type": "new type",
                    "unit": "mole"
                } ], 
                "B3": [], "B4": [], "B5": [], "B6": [], "B7": [], "B8": [], "B9": [], "B10": [], "B11": [], "B12": [], 
                "C1": [], "C2": [], "C3": [], "C4": [], "C5": [], "C6": [], "C7": [], "C8": [], "C9": [], "C10": [], "C11": [], "C12": [], 
                "D1": [], "D2": [], "D3": [], "D4": [], "D5": [], "D6": [], "D7": [], "D8": [], "D9": [], "D10": [], "D11": [], "D12": [], 
                "E1": [], "E2": [], "E3": [], "E4": [], "E5": [], "E6": [], "E7": [], "E8": [], "E9": [], "E10": [], "E11": [], "E12": [], 
                "F1": [], "F2": [], "F3": [], "F4": [], "F5": [], "F6": [], "F7": [], "F8": [], "F9": [], "F10": [], "F11": [], "F12": [], 
                "G1": [], "G2": [], "G3": [], "G4": [], "G5": [], "G6": [], "G7": [], "G8": [], "G9": [], "G10": [], "G11": [], "G12": [], 
                "H1": [], "H2": [], "H3": [], "H4": [], "H5": [], "H6": [], "H7": [], "H8": [], "H9": [], "H10": [], "H11": [], "H12": []
            }    
        }
    },
    "source": {
        "plate": {
            "actions": {
                "read": "/11111111-2222-3333-4444-555555555555",
                "update": "/11111111-2222-3333-4444-555555555555",
                "delete": "/11111111-2222-3333-4444-555555555555",
                "create": "/11111111-2222-3333-4444-555555555555"
            },
        "uuid": "11111111-2222-3333-4444-555555555555",
        "number_of_rows": 8,
        "number_of_columns": 12,
        "type": "source plate type",
        "wells": {
                "A1": [], "A2": [], "A3": [], "A4": [], "A5": [], "A6": [], "A7": [], "A8": [], "A9": [], "A10": [], "A11": [], "A12": [], 
                "B1": [], "B2": [], "B3": [], "B4": [], "B5": [], "B6": [], "B7": [], "B8": [], "B9": [], "B10": [], "B11": [], "B12": [], 
                "C1": [], "C2": [], "C3": [], "C4": [], 
                "C5": [ { 
                    "sample": {
                        "actions": { 
                            "read": "/11111111-2222-3333-4444-777777777777",
                            "update": "/11111111-2222-3333-4444-777777777777",
                            "delete": "/11111111-2222-3333-4444-777777777777",
                            "create": "/11111111-2222-3333-4444-777777777777"
                        },
                    "uuid": "11111111-2222-3333-4444-777777777777",
                    "name": "sample 1"},
                    "quantity": 0,
                    "type": "new type",
                    "unit": "mole"
                } ], 
                "C6": [], "C7": [], "C8": [], "C9": [], "C10": [], "C11": [], "C12": [], 
                "D1": [], "D2": [], "D3": [], "D4": [], "D5": [], "D6": [], "D7": [], "D8": [], "D9": [], "D10": [], "D11": [], "D12": [], 
                "E1": [], "E2": [], "E3": [], "E4": [], "E5": [], "E6": [], "E7": [], "E8": [], "E9": [], "E10": [], "E11": [], "E12": [], 
                "F1": [], "F2": [], "F3": [], "F4": [], "F5": [], "F6": [], "F7": [], "F8": [], "F9": [], "F10": [], "F11": [], "F12": [], 
                "G1": [], "G2": [], "G3": [], "G4": [], "G5": [], "G6": [], "G7": [], "G8": [], "G9": [], "G10": [], "G11": [], "G12": [], 
                "H1": [], "H2": [], "H3": [], "H4": [], "H5": [], "H6": [], "H7": [], "H8": [], "H9": [], "H10": [], "H11": [], "H12": []
            }         
        }
    },
    "target": {
        "plate": {
            "actions": {
                "read": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666",
                "create": "/11111111-2222-3333-4444-666666666666"
            },
        "uuid": "11111111-2222-3333-4444-666666666666",
        "number_of_rows": 8,
        "number_of_columns": 12,
        "type": "target plate type",
        "wells": {
                "A1": [], "A2": [], "A3": [], "A4": [], "A5": [], "A6": [], "A7": [], "A8": [], "A9": [], "A10": [], "A11": [], "A12": [], 
                "B1": [], 
                "B2": [ { 
                    "sample": {
                        "actions": { 
                            "read": "/11111111-2222-3333-4444-777777777777",
                            "update": "/11111111-2222-3333-4444-777777777777",
                            "delete": "/11111111-2222-3333-4444-777777777777",
                            "create": "/11111111-2222-3333-4444-777777777777"
                        },
                    "uuid": "11111111-2222-3333-4444-777777777777",
                    "name": "sample 1"},
                    "quantity": 10,
                    "type": "new type",
                    "unit": "mole"
                } ], 
                "B3": [], "B4": [], "B5": [], "B6": [], "B7": [], "B8": [], "B9": [], "B10": [], "B11": [], "B12": [], 
                "C1": [], "C2": [], "C3": [], "C4": [], "C5": [], "C6": [], "C7": [], "C8": [], "C9": [], "C10": [], "C11": [], "C12": [], 
                "D1": [], "D2": [], "D3": [], "D4": [], "D5": [], "D6": [], "D7": [], "D8": [], "D9": [], "D10": [], "D11": [], "D12": [], 
                "E1": [], "E2": [], "E3": [], "E4": [], "E5": [], "E6": [], "E7": [], "E8": [], "E9": [], "E10": [], "E11": [], "E12": [], 
                "F1": [], "F2": [], "F3": [], "F4": [], "F5": [], "F6": [], "F7": [], "F8": [], "F9": [], "F10": [], "F11": [], "F12": [], 
                "G1": [], "G2": [], "G3": [], "G4": [], "G5": [], "G6": [], "G7": [], "G8": [], "G9": [], "G10": [], "G11": [], "G12": [], 
                "H1": [], "H2": [], "H3": [], "H4": [], "H5": [], "H6": [], "H7": [], "H8": [], "H9": [], "H10": [], "H11": [], "H12": []
            }
        }
    },
    "transfer_map": { "C5": "B2" }
}}
EOD
%>
<%= h.to_json %>
EOF

C="$R/gel_plate_resource"
mkdir -p $C
cc=0

cc=$((cc+1))
cat > $C/$((cc))_list_actions_for_gel_resource.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**List actions for gel resource.**

* \`create\` creates a new gel plate via HTTP POST request
* \`read\` returns the list of actions for a gel plate resource via HTTP GET request
* \`first\` lists the first gel plates resources in a page browsing system
* \`last\` lists the last gel plates resources in a page browsing system
GET /gels
> Accept: application/json
< 200
< Content-Type: application/json
{ "gels": {
    "actions": {
        "create": "/gels",
        "read": "/gels",
        "first": "/gels/page=1",
        "last": "/gels/page=-1"
    }
} }
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_create_a_new_empty_gel_plate.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Create a new empty gel plate.**

* \`number_of_rows\` number of rows in the rack
* \`number_of_columns\` number of columns in the rack
* \`windows_description\` map aliquots to window locations
POST /gels
> Accept: application/json
{ "gel": {
    "number_of_rows": 8,
    "number_of_columns": 12,
    "windows_description": {}
}}
< 200
< Content-Type: application/json
{ "gel": {
    "actions": {
        "read": "/11111111-2222-3333-4444-555555555555",
        "update": "/11111111-2222-3333-4444-555555555555",
        "delete": "/11111111-2222-3333-4444-555555555555",
        "create": "/11111111-2222-3333-4444-555555555555"
    },
    "uuid": "11111111-2222-3333-4444-555555555555",
    "number_of_rows": 8,
    "number_of_columns": 12,
    "windows": { 
        "A1": [], "A2": [], "A3": [], "A4": [], "A5": [], "A6": [], "A7": [], "A8": [], "A9": [], "A10": [], "A11": [], "A12": [],
        "B1": [], "B2": [], "B3": [], "B4": [], "B5": [], "B6": [], "B7": [], "B8": [], "B9": [], "B10": [], "B11": [], "B12": [],
        "C1": [], "C2": [], "C3": [], "C4": [], "C5": [], "C6": [], "C7": [], "C8": [], "C9": [], "C10": [], "C11": [], "C12": [],
        "D1": [], "D2": [], "D3": [], "D4": [], "D5": [], "D6": [], "D7": [], "D8": [], "D9": [], "D10": [], "D11": [], "D12": [],
        "E1": [], "E2": [], "E3": [], "E4": [], "E5": [], "E6": [], "E7": [], "E8": [], "E9": [], "E10": [], "E11": [], "E12": [],
        "F1": [], "F2": [], "F3": [], "F4": [], "F5": [], "F6": [], "F7": [], "F8": [], "F9": [], "F10": [], "F11": [], "F12": [],
        "G1": [], "G2": [], "G3": [], "G4": [], "G5": [], "G6": [], "G7": [], "G8": [], "G9": [], "G10": [], "G11": [], "G12": [],
        "H1": [], "H2": [], "H3": [], "H4": [], "H5": [], "H6": [], "H7": [], "H8": [], "H9": [], "H10": [], "H11": [], "H12": []}
}}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_create_a_new_gel_plate.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Create a new gel plate.**

* \`number_of_rows\` number of rows in the gel plate
* \`number_of_columns\` number of columns in the gel plate
* \`windows_description\` map tubes identified by their uuids to rack locations
POST /gels
> Accept: application/json
{ "gel": {
    "number_of_rows": 8,
    "number_of_columns": 12,
    "windows_description": { 
        "C5": [{ "sample": "11111111-2222-3333-4444-666666666666", "type": "DNA", "quantity": 10 }]
} }
< 200
< Content-Type: application/json
{ "gel": {
    "actions": {
        "read": "/11111111-2222-3333-4444-555555555555",
        "update": "/11111111-2222-3333-4444-555555555555",
        "delete": "/11111111-2222-3333-4444-555555555555",
        "create": "/11111111-2222-3333-4444-555555555555"
    },
    "uuid": "11111111-2222-3333-4444-555555555555",
    "number_of_rows": 8,
    "number_of_columns": 12,
    "windows": { 
        "A1": [], "A2": [], "A3": [], "A4": [], "A5": [], "A6": [], "A7": [], "A8": [], "A9": [], "A10": [], "A11": [], "A12": [],
        "B1": [], "B2": [], "B3": [], "B4": [], "B5": [], "B6": [], "B7": [],"B8": [],"B9": [],"B10": [],"B11": [],"B12": [],
        "C1": [], "C2": [], "C3": [], "C4": [], 
        "C5": [ { "sample": {
            "actions": { 
                "read": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666",
                "create": "/11111111-2222-3333-4444-666666666666" 
            },
            "uuid": "11111111-2222-3333-4444-666666666666",
            "name": "sample 1"},
            "quantity": 10,
            "type": "DNA",
            "unit": "mole"
        } ],
        "C6": [],"C7": [],"C8": [],"C9": [],"C10": [],"C11": [],"C12": [],
        "D1": [], "D2": [], "D3": [], "D4": [], "D5": [], "D6": [], "D7": [],"D8": [],"D9": [],"D10": [],"D11": [],"D12": [],
        "E1": [], "E2": [], "E3": [], "E4": [], "E5": [], "E6": [], "E7": [],"E8": [],"E9": [],"E10": [],"E11": [],"E12": [],
        "F1": [], "F2": [], "F3": [], "F4": [], "F5": [], "F6": [], "F7": [],"F8": [],"F9": [],"F10": [],"F11": [],"F12": [],
        "G1": [], "G2": [], "G3": [], "G4": [], "G5": [], "G6": [], "G7": [],"G8": [],"G9": [],"G10": [],"G11": [],"G12": [],
        "H1": [], "H2": [], "H3": [], "H4": [], "H5": [], "H6": [], "H7": [],"H8": [],"H9": [],"H10": [],"H11": [],"H12": []}
}}
EOD
%>
<%= h.to_json %>
EOF

C="$R/order_resource"
cc=0
mkdir -p $C
c=$((c+1))
cat > $R/$((c))_order_resource.json.erb <<EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
-- 
Order Resource 
--
An order stores all the information needed by a pipeline to achieve works. In particular, an order has a list of 
items which are used and a status. Items map a role to a resource (like a plate or a tube). A role informs how 
an item participates in the order. A status represents the progress of the order from an end-user point
of view. A status is meant to be used in order related application, not by the pipeline. Typically, when the
pipeline interacts with the order, its status should be \`in_progress\`. Here is the different status for an order: 

* \`draft\` this is the initial state on order creation
* \`pending\` after a \`build\` event. The order has been validated by the user and is ready to be used
* \`in_progress\` after a \`start\` event. The order has been started, it belongs to a pipeline and works are in progress
* \`completed\` after a \`complete\` event. The order has been fulfilled with success. The order cannot be modified.
* \`cancelled\` after a \`cancel\` event. The order has been cancelled by the user. The order cannot be modified.
* \`failed\` after a \`fail\` event. The order cannot be completed for some reason. The order cannot be modified.

On top of that, each item in an order gets a status which represent its progress. It can be one of the following: 

* \`pending\` which is the initial state of an item or after a \`reset\` event.
* \`in_progress\` after a \`start\` event. Some work are on-going using the item.
* \`done\` after a \`complete\` event. The item is available to be used in a new pipeline step.
* \`cancelled\` after a \`cancel\` event. The item has been cancelled by the user.
* \`failed\` after a \`fail\` event. The item cannot be done for some reason.

--
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_list_actions_for_order_resource.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**List actions for order resource.**

* \`create\` creates a new order via HTTP POST request
* \`read\` returns the list of actions for an order resource via HTTP GET request
* \`first\` lists the first order resources in a page browsing system
* \`last\` lists the last order resources in a page browsing system
GET /orders
> Accept: application/json
< 200
< Content-Type: application/json
{ "orders": {
    "actions": {
        "create": "/orders",
        "read": "/orders",
        "first": "/orders/page=1",
        "last": "/orders/page=-1"
    }
} }
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_create_a_new_order.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Create a new order.**

* \`study_uuid\` uuid of an existing study
* \`user_uuid\` uuid of the order's creator
* \`pipeline\` pipeline name
* \`cost_code\` 
* \`sources\` map a role to an array of resource uuids. All the items in sources get a \`done\` status on order creation
* \`targets\` map a role to an array of resource uuids. All the items in targets get a \`pending\` status on order creation
POST /orders
> Accept: application/json
{ "order": {
    "user_uuid": "11111111-2222-3333-4444-666666666666",
    "study_uuid": "11111111-2222-3333-4444-777777777777",
    "pipeline": "pipeline 1",
    "cost_code": "cost code 1",
    "sources": {
        "Stock Plate 1": ["11111111-2222-3333-0000-111111111111"]
    },
    "targets": {
        "Tube 1": ["11111111-2222-3333-0000-222222222222", "11111111-2222-3333-0000-333333333333"]
    }
} }
< 200
< Content-Type: application/json
{ "order": {
    "actions": {
        "create": "/11111111-2222-3333-4444-555555555555",
        "read": "/11111111-2222-3333-4444-555555555555",
        "update": "/11111111-2222-3333-4444-555555555555",
        "delete": "/11111111-2222-3333-4444-555555555555"
    },
    "uuid": "11111111-2222-3333-4444-555555555555",
    "creator": {
        "actions": {
                "create": "/11111111-2222-3333-4444-666666666666",
                "read": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666"
            },
        "uuid": "11111111-2222-3333-4444-666666666666"
    },
    "study": {
        "actions": {
            "create": "/11111111-2222-3333-4444-777777777777",
            "read": "/11111111-2222-3333-4444-777777777777",
            "update": "/11111111-2222-3333-4444-777777777777",
            "delete": "/11111111-2222-3333-4444-777777777777"
        },
        "uuid": "11111111-2222-3333-4444-777777777777"
    },
    "pipeline": "pipeline 1",
    "cost_code": "cost code 1",
    "status": "draft",
    "parameters": {},
    "state": {},
    "items": {
        "Stock Plate 1": [
            { "status": "done", "uuid": "11111111-2222-3333-0000-111111111111" }
        ],
        "Tube 1": [
            { "status": "pending", "uuid": "11111111-2222-3333-0000-222222222222" },
            { "status": "pending", "uuid": "11111111-2222-3333-0000-333333333333" }
        ]
    }
} }
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_update_an_order.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Update an order.**

* \`items\` maps a role to a resource uuid and its update parameters. The item gets the status associated to its \`event\` parameter.
* \`event\` updates the order status.
* \`pipeline\` updates the pipeline parameter
* \`study_uuid\` updates the study parameter
* \`creator_uuid\` updates the creator parameter
* \`cost_code\` updates the cost_code parameter
* \`parameters\` updates the parameters attribute
* \`state\` updates the state parameter
PUT /11111111-2222-3333-4444-555555555555
> Accept: application/json
{ "items": { 
    "New tube": {
        "11111111-0000-0000-0000-111111111111": { "event": "start" }
    }
},
"event": "build",
"pipeline": "pipeline 2",
"study_uuid": "11111111-2222-3333-4444-777777777777",
"user_uuid": "11111111-2222-3333-4444-666666666666",
"cost_code": "cost code 2",
"parameters": {"param_1": "custom parameter"},
"state": {"state_1": "information about order state"}
}
< 200
< Content-Type: application/json
{ "order": {
    "actions": {
        "create": "/11111111-2222-3333-4444-555555555555",
        "read": "/11111111-2222-3333-4444-555555555555",
        "update": "/11111111-2222-3333-4444-555555555555",
        "delete": "/11111111-2222-3333-4444-555555555555"
    },
    "uuid": "11111111-2222-3333-4444-555555555555",
    "creator": {
        "actions": {
                "create": "/11111111-2222-3333-4444-666666666666",
                "read": "/11111111-2222-3333-4444-666666666666",
                "update": "/11111111-2222-3333-4444-666666666666",
                "delete": "/11111111-2222-3333-4444-666666666666"
            },
        "uuid": "11111111-2222-3333-4444-666666666666"
    },
    "study": {
        "actions": {
            "create": "/11111111-2222-3333-4444-777777777777",
            "read": "/11111111-2222-3333-4444-777777777777",
            "update": "/11111111-2222-3333-4444-777777777777",
            "delete": "/11111111-2222-3333-4444-777777777777"
        },
        "uuid": "11111111-2222-3333-4444-777777777777"
    },
    "pipeline": "pipeline 2",
    "cost_code": "cost code 2",
    "status": "pending",
    "parameters": {"param_1": "custom parameter"},
    "state": {"state_1": "information about order state"},
    "items": {
        "Stock Plate 1": [
            { "status": "done", "uuid": "11111111-2222-3333-4444-888888888888" }
        ],
        "New Tube": [
            { "status": "in_progress", "uuid": "11111111-0000-0000-0000-111111111111" }
        ],
        "Tube 1": [
            { "status": "pending", "uuid": "11111111-2222-3333-4444-999999999999" }
        ]
    }
} }
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_assign_an_item_to_a_batch.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Assign an item to a batch**

This example can be combined with more complete order update using the above update example.

* \`items\` can take a \`batch_uuid\` attribute to assign an item to a batch

The example below update an order and assign the item \`11111111-2222-3333-4444-666666666666\` to the batch 
\`11111111-2222-3333-4444-777777777777\`. Note that an item can be assigned to a batch only through 
an update order action.
PUT /11111111-2222-3333-4444-555555555555
> Accept: application/json
{ "items": {
    "role1": {
        "11111111-2222-3333-4444-666666666666": {"batch_uuid": "11111111-2222-3333-4444-777777777777"}
    }
} }
< 200
< Content-Type: application/json
{
   "order":{
      "actions":{
         "read":"/11111111-2222-3333-4444-555555555555",
         "create":"/11111111-2222-3333-4444-555555555555",
         "update":"/11111111-2222-3333-4444-555555555555",
         "delete":"/11111111-2222-3333-4444-555555555555"
      },
      "uuid":"11111111-2222-3333-4444-555555555555",
      "pipeline":"P1",
      "status":"draft",
      "parameters":{},
      "state":{},
      "cost_code":"cost code",
      "creator":{
         "actions":{
            "read":"/11111111-1111-1111-1111-000000000000",
            "create":"/11111111-1111-1111-1111-000000000000",
            "update":"/11111111-1111-1111-1111-000000000000",
            "delete":"/11111111-1111-1111-1111-000000000000"
         },
         "uuid":"11111111-1111-1111-1111-000000000000"
      },
      "study":{
         "actions":{
            "read":"/11111111-1111-1111-1111-111111111111",
            "create":"/11111111-1111-1111-1111-111111111111",
            "update":"/11111111-1111-1111-1111-111111111111",
            "delete":"/11111111-1111-1111-1111-111111111111"
         },
         "uuid":"11111111-1111-1111-1111-111111111111"
      },
      "items":{
         "role1":[
            {
               "uuid":"11111111-2222-3333-4444-666666666666",
               "status":"done",
               "batch":{
                  "actions":{
                     "read":"/11111111-2222-3333-4444-777777777777",
                     "create":"/11111111-2222-3333-4444-777777777777",
                     "update":"/11111111-2222-3333-4444-777777777777",
                     "delete":"/11111111-2222-3333-4444-777777777777"
                  },
                  "uuid":"11111111-2222-3333-4444-777777777777",
                  "process":"manual extraction"
               }
            }
         ]
      }
   }
}
EOD
%>
<%= h.to_json %>
EOF

C="$R/batch_resource"
mkdir -p $C
cc=0

c=$((c+1))
cat > $R/$((c))_batch_resource << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
-- 
Batch Resource 
--
A batch groups order items together.
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_create_a_new_batch.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Create a new batch**

* \`process\` the process that the batch is going through
POST /batches
> Accept: application/json
{ "batch": {"process": "manual extraction"} }
< 200
< Content-Type: application/json
{
   "batch":{
      "actions":{
         "read":"/11111111-2222-3333-4444-555555555555",
         "create":"/11111111-2222-3333-4444-555555555555",
         "update":"/11111111-2222-3333-4444-555555555555",
         "delete":"/11111111-2222-3333-4444-555555555555"
      },
      "uuid":"11111111-2222-3333-4444-555555555555",
      "process":"manual extraction"
   }
}
EOD
%>
<%= h.to_json %>
EOF

C="$R/search"
mkdir -p $C
cc=0

cc=$((cc+1))
cat > $C/$((cc))_search_for_a_resource.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Search for a resource**

* \`description\` describe the search
* \`model\` searched model
* \`criteria\` set parameters for the search

The search below returns plates with ids 1 and 2.
You can search for a tube the same way as below if you know its id.

To actually get the search results, you need to access the first page of result 
thanks to the \`first\` action in the JSON response.
POST /searches
> Accept: application/json
{ "search": {
    "description": "search for a plate by ids",
    "model": "plate",
    "criteria": { "id": [1,2] }
}}
< 200
< Content-Type: application/json
{
    "search": {
        "actions": {
            "read": "/11111111-2222-3333-4444-555555555555",
            "first": "/11111111-2222-3333-4444-555555555555/page=1",
            "last": "/11111111-2222-3333-4444-555555555555/page=-1"
        },
        "uuid": "11111111-2222-3333-4444-555555555555"
    }
}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_search_for_an_order.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Search for an order**

* \`description\` describe the search
* \`model\` searched model
* \`criteria\` set parameters for the search. Here, it can be a combination of the following attributes:
    * \`pipeline\` 
    * \`items\` which itself can contain the parameters \`uuid\`, \`status\`, \`role\` and \`batch_uuid\`
    * \`status\`
    * \`cost_code\`

The search below looks for an order for the \`pipeline 1\` which has a status \`in_progress\`. On top of
that, the search looks for an order which contains an item which has the uuid 
\`11111111-2222-3333-4444-555555555555\` in the status \`done\` with the role \`role A\` and assigned to the
batch \`11111111-2222-3333-4444-666666666666\`.

You can specify arrays in the criteria as well. For example, if you need to get an order which 
contains items with role \`role A\` and \`role B\`, you could have the following criteria:
\`"criteria": { "item": { "role": ["role A", "role B"] } }\`

To actually get the search results, you need to access the first page of result 
thanks to the \`first\` action in the JSON response.
POST /searches
> Accept: application/json
{ "search": {
    "description": "search for an order",
    "model": "plate",
    "criteria": {
        "pipeline": "pipeline 1",
        "status": "in_progress",
        "item": {
            "uuid": "11111111-2222-3333-4444-555555555555",
            "status": "done",
            "role": "role A",
            "batch_uuid": "11111111-2222-3333-4444-666666666666"
        }
    }
}}
< 200
< Content-Type: application/json
{
    "search": {
        "actions": {
            "read": "/11111111-2222-3333-4444-555555555555",
            "first": "/11111111-2222-3333-4444-555555555555/page=1",
            "last": "/11111111-2222-3333-4444-555555555555/page=-1"
        },
        "uuid": "11111111-2222-3333-4444-555555555555"
    }
}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_search_for_a_resource_by_label.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Search for a resource by label**

* \`description\` describe the search
* \`model\` searched model
* \`criteria\` set parameters for the search. Here, it can be a combination of the following attributes:
    * \`position\`
    * \`type\`
    * \`value\`

The search below looks for a tube by its label which is a \`sanger-barcode\` with the position 
\`front barcode\` and the value \`ABC123456\`.

To actually get the search results, you need to access the first page of result 
thanks to the \`first\` action in the JSON response.
POST /searches
> Accept: application/json
{ "search": {
    "description": "search for a tube by label",
    "model": "tube",
    "criteria": {
        "label": {
            "position": "front barcode",
            "type": "sanger-barcode",
            "value": "ABC123456"
        }
    }
}}
< 200
< Content-Type: application/json
{
    "search": {
        "actions": {
            "read": "/11111111-2222-3333-4444-555555555555",
            "first": "/11111111-2222-3333-4444-555555555555/page=1",
            "last": "/11111111-2222-3333-4444-555555555555/page=-1"
        },
        "uuid": "11111111-2222-3333-4444-555555555555"
    }
}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_search_for_a_resource_by_order.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Search for a resource by order**

* \`description\` describe the search
* \`model\` search for resource instances of model
* \`criteria\` set parameters for the search. Here, it can be a combination of the following attributes:
    * \`pipeline\` 
    * \`items\` which itself can contain the parameters \`status\` and \`role\`
    * \`status\`
    * \`cost_code\`

The search below looks for a tube used in a order for the pipeline \`pipeline 1\` which has the status \`in_progress\`.
On top of that, the tube used in that order should have a role \`role A\` and a \`pending\` status.

To actually get the search results, you need to access the first page of result 
thanks to the \`first\` action in the JSON response.
POST /searches
> Accept: application/json
{ "search": {
    "description": "search for a tube by order",
    "model": "tube",
    "criteria": {
        "order": {
            "pipeline": "pipeline 1",
            "status": "in_progress",
            "item": {
                "role": "role A",
                "status": "pending"
            }
        }
    }
}}
< 200
< Content-Type: application/json
{
    "search": {
        "actions": {
            "read": "/11111111-2222-3333-4444-555555555555",
            "first": "/11111111-2222-3333-4444-555555555555/page=1",
            "last": "/11111111-2222-3333-4444-555555555555/page=-1"
        },
        "uuid": "11111111-2222-3333-4444-555555555555"
    }
}
EOD
%>
<%= h.to_json %>
EOF

cc=$((cc+1))
cat > $C/$((cc))_search_for_a_resource_by_batch.json.erb << EOF
<%
require 'json'
h={}
h[:doc]=<<EOD
**Search for a resource by batch**

* \`uuid\` uuid ot a batch

The search below looks for a plate which is assigned to the batch \`11111111-2222-3333-4444-666666666666\` 
through an order item.

To actually get the search results, you need to access the first page of result 
thanks to the \`first\` action in the JSON response.
POST /searches
> Accept: application/json
{ "search": {
    "description": "search for a plate by batch",
    "model": "plate",
    "criteria": {
        "batch": {"uuid": "11111111-2222-3333-4444-666666666666"}
    }
}}
< 200
< Content-Type: application/json
{
    "search": {
        "actions": {
            "read": "/11111111-2222-3333-4444-555555555555",
            "first": "/11111111-2222-3333-4444-555555555555/page=1",
            "last": "/11111111-2222-3333-4444-555555555555/page=-1"
        },
        "uuid": "11111111-2222-3333-4444-555555555555"
    }
}
EOD
%>
<%= h.to_json %>
