class Pokemon

    attr_accessor :name, :type, :db, :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end


    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
    

        db.execute(sql, name, type)
        db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(idnum, db)
        result = db.execute("SELECT * FROM pokemon WHERE id = ?", idnum).flatten
        id = result[0]
        name = result[1]
        type = result[2]
        self.new(id: id, name: name, type: type, db: db)
        # result
    end
end