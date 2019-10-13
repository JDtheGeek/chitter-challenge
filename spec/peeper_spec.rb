require 'peeper'

describe Peeper do
  describe "creating a new peeper" do
    it "creates a new peeper object" do
      
      new_peeper = Peeper.create(
        username: "TestUser",
        email: "testing@email.test",
        password: "Password"
      )

      expect(new_peeper.username).to eq "TestUser"

    end
  end
end