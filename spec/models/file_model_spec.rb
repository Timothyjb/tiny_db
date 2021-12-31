require 'spec_helper'
require 'dummy/dummy_model.rb'

RSpec.describe DummyModel, type: :model do

  after :all do
    File.write(TinyDb.configuration.db_file_path, "{}")
  end

  it "can save new record" do
    file = File.open(TinyDb.configuration.db_file_path)

    record = DummyModel.new
    record.name = "Timbo Baggins"
    record.save

    expect(DummyModel.table).to eq [{:id=>1, :name=>"Timbo Baggins"}]
  end

  it "can name after saving" do
    record = DummyModel.new
    record.name = "Timbo Baggins"
    record.save
    record.name = "Different Name"
    record.save

    expect(DummyModel.table).to eq [{:id=>1, :name=>"Timbo Baggins"}, {:id=>2, :name=>"Different Name"}]
  end

  it "find by save" do
    record = DummyModel.find_by(name: "Timbo Baggins")
    record.name = "Timbo"
    record.save

    expect(DummyModel.table).to eq [{:id=>1, :name=>"Timbo"}, {:id=>2, :name=>"Different Name"}]
  end

  it "find by and update" do
    record = DummyModel.find_by(name: "Timbo")
    record.update(name: "Timbo Baggins")

    expect(DummyModel.table).to eq [{:id=>1, :name=>"Timbo Baggins"}, {:id=>2, :name=>"Different Name"}]
  end

  it "can create" do
    DummyModel.create(name: "Dray")

    expect(DummyModel.table).to eq [{:id=>1, :name=>"Timbo Baggins"}, {:id=>2, :name=>"Different Name"}, {:id=>3, :name=>"Dray"}]
  end

  it "can update" do
    record = DummyModel.find_by(name: "Dray")
    record.update(name: "Dray C")

    expect(DummyModel.table).to eq [{:id=>1, :name=>"Timbo Baggins"}, {:id=>2, :name=>"Different Name"}, {:id=>3, :name=>"Dray C"}]
  end

  it "can destroy" do
    record = DummyModel.find_by(name: "Dray C")
    record.destroy

    expect(DummyModel.table).to eq [{:id=>1, :name=>"Timbo Baggins"}, {:id=>2, :name=>"Different Name"}]
  end

end
