require 'sqlite3'
require 'singleton'

class QuestionDatabase < SQLite3::Database
  include Singleton
    def self.all
      DBConnect.instance.execute('SELECT * from questions').map{|data| Question.new(data)}
    end

    def initialize
    super('test.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Question
  def self.find_by_id(id)
    info =  DBConnect.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    Question.new(info)
  end

  def initialize(info)
      @id       = info['id']
      @title    = info['title']
      @body     = info['body']
      @author_id= info['author_id']
      # p @info
    end

  def update

    DBConnect.instance.execute(<<-SQL, @title, @body, @author_id, @id)
    UPDATE
      questions
    SET
      title = '?', body = '?', author_id = ?
    WHERE
      id = ?
    SQL
  end

  def insert
    title, body, author_id = @questions[idx]
    DBConnect.instance.execute(<<-SQL, @title, @body, @author_id)
    INSERT INTO
      questions(title, body, author_id
    VALUES
      (?, ?, ?)
    SQL
  end
end

qdb =  QuestionDatabase.all



# class User
#   attr_accessor :id, :fname, :lname
#     def self.all
#       DBConnect.instance.execute('SELECT * from users').map{|data| User.new(data)}
#     end

#     def self.find_by_id(id)
#       DBConnect.instance.execute(<<-SQL, id)
#         SELECT
#           *
#         FROM
#           users
#         WHERE
#           id = ?
#       SQL
#     end

#     def initialize(info)
#       @id     = info['id']
#       @fname  = info['fname']
#       @lname  = info['lname']
#       # p @info
#     end

#     def update
#       DBConnect.instance.execute(<<-SQL, @fname, @fname)
#       UPDATE
#         users
#       SET
#         fname = '?', lname = '?'
#       WHERE
#         id = #{@id}
#       SQL
#     end

#     def insert
#       DBConnect.instance.execute(<<-SQL, @fname, @lname)
#       INSERT INTO
#         users(fname, lname)
#       VALUES
#         (?, ?)
#       SQL
#     end
# end
