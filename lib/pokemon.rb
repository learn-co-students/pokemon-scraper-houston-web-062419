class Pokemon

    attr_accessor :id, :name, :type, :db, :hp

    @@all = []

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
        @@all << self
    end

    def self.all
        @@all
    end

    def self.save(name, type, db)
        db.execute('INSERT INTO pokemon (name, type) VALUES (?,?)', name, type)
    end

    def self.find(id, db)
        ar = db.execute('SELECT * FROM pokemon WHERE id = ?;', id)
        id = ar[0][0]
        name = ar[0][1]
        type = ar[0][2]
        hp = ar[0][3]

        p=Pokemon.new(id: id, name: name, type: type, db: db)
        p.hp = hp
        p
    end

    def alter_hp(hp, db)
        db.execute('UPDATE pokemon SET hp=? WHERE id=?', hp, id)
    end
end
