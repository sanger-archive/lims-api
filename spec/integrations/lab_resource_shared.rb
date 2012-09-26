
def connect_db(env)
  config = YAML.load_file(File.join('config','database.yml'))
  Sequel.connect(config[env.to_s])
end

shared_examples_for "creating a resource" do
  include_context "use generated uuid"
  it "creates a new plate" do
    post("/#{model}", parameters.to_json).body.should match_json(expected_json)
  end
  it "reads the created plate" do
    post("/#{model}", parameters.to_json)
    get("/#{uuid}").body.should match_json(expected_json)
  end
end

def set_uuid(session, object, uuid)
  session << object
  ur = session.new_uuid_resource_for(object)
  ur.send(:uuid=, uuid)
end
