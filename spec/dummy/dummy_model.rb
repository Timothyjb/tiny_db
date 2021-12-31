class DummyModel < TinyDb::FileModel
  TABLE_NAME = "dummy_models"
  ATTRIBUTES = [:id, :name]
  attr_accessor *ATTRIBUTES
end
