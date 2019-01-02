require "rails_helper"

describe PeopleController do
  describe "#create" do
    context "when person is valid" do
      it "redirects to #show" do
        user = Person.new(first_name: "John")
        post :create, params: { person: { first_name: user.first_name } }
        expect(response).to redirect_to(person_path(1))
      end
    end

    context "when person is invalid" do
      it "renders the 'new' template" do
        user = Person.new(first_name: nil)
        post :create, params: { person: { first_name: user.first_name } }
        expect(response).to render_template(:new)
      end
    end
  end
end
