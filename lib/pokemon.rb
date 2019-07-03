
require "pry"

class Pokemon

	attr_accessor :id, :name, :type, :db, :hp

	def initialize (id: , name: "Pikachu", type: "electric", db: @db )
		@db = db
		@id = id
		@name = name
		@type = type
	end

	def self.save(name, type, db)
		db.execute("insert into pokemon (name , type) values ( ?, ?);", name, type)
	end

	def self.find(id, db)
		ar  = db.execute("select * from pokemon where id = ?;", id);

		id = ar[0][0]
		name = ar[0][1]
		type = ar[0][2]
		hp = ar[0][3]

		#Pokemon.new(id: id, name: name, type: type, db: db )
		p = Pokemon.new(id: id, name: name, type: type, db: db )
		p.hp = hp
		p
	end

	def alter_hp (hp, db)
		p = Pokemon.find(@id, db)
		db.execute("update pokemon set hp=? where id = ?;", hp, p.id)

		#binding.pry

	end
end
