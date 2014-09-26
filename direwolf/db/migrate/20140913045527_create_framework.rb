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
      t.text :description
      t.references :employer, :null=>false
      t.references :category, :null=>false
      t.datetime :expires_at
    end

    create_table :categories do |t|
      t.string :name, :null=>false
    end

    create_table :statuses do |t|
      t.string :title, :null=>false
    end

    create_table :job_applications do |t|
      t.references :job, :null=>false
      t.references :employer, :null=>false
      t.references :seeker, :null=>false
      t.references :status, :null=>false
      t.text :cover_letter
      t.timestamps
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
