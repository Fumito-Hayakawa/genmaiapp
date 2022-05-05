require 'rails_helper'

RSpec.describe Procedure, type: :model do
  let!(:procedure) { create(:procedure) }

  it "有効な状態であること" do
    expect(procedure).to be_valid
  end
end
