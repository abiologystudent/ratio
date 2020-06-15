class AddLabelData1Data2Data3OutcomeToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :label, :integer
    add_column :pages, :data1, :string
    add_column :pages, :data2, :string
    add_column :pages, :data3, :string
    add_column :pages, :outcome, :integer
  end
end
