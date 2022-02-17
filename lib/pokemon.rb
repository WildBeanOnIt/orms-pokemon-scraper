class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end


    def self.save
        sql = <<-SQL
            INSERT INTO pokemon (name, type, id) VALUES (?, ?, ?)
        SQL
    

        DB[:conn].execute(sql, self.name, self.type, self.id)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end
end