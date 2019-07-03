class Pokemon
    attr_accessor :id, :name, :type, :db, :hp

    def initialize(id:, name:, type:, db:, hp:60)

        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon(name,type) VALUES(?,?)", [name, type])
    end

    def self.find(id, db)
        pokemons = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        pokemon = pokemons[0]
        
        Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
        
    end


end
