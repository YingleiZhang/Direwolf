class CreateFramework < ActiveRecord::Migration
  def change
    create_table :seekers do |t|
      t.references :user, :null=>false
      t.binary :resume, :limit => 10.megabyte
      t.string :resume_type
      t.integer :phone
    end

    create_table :admins do |t|
      t.references :user, :null=>false
    end

    create_table :employers do |t|
      t.references :user, :null=>false
    end

    create_table :jobs do |t|
      t.string :title, :null=>false
      t.references :employer, :null=>false
      t.references :category, :null=>false
    end

    create_table :categories do |t|
      t.string :name, :null=>false
    end

    create_table :statuses do |t|
      t.string :title, :null=>false
    end

    create_table :applications do |t|
      t.references :job, :null=>false
      t.references :employer, :null=>false
      t.references :seeker, :null=>false
      t.references :status, :null=>false
    end

    add_foreign_key(:seekers, :users)
    add_foreign_key(:admins, :users)
    add_foreign_key(:employers, :users)
    add_foreign_key(:jobs, :employers)
    add_foreign_key(:jobs, :categories)
    add_foreign_key(:applications, :jobs)
    add_foreign_key(:applications, :employers)
    add_foreign_key(:applications, :seekers)
    add_foreign_key(:applications, :statuses)

  end
end
