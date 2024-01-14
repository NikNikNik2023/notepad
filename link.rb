class Link < Post
  def initialize
    super

    @url = ''
  end

  def read_from_console
    puts "Введите адрес ссылки:"
    @url = STDIN.gets.chomp

    puts "Напишите пару слов о том, куда ведёт ссылка"
    @text = STDIN.gets.chomp
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    [@url, @text, time_string]
  end

  def to_db_hash
    super.merge(
        "text" => @text,
        "url" => @url
    )
  end

  # Метод load_data у Ссылки считывает дополнительно url ссылки
  def load_data(data_hash)
    # Сперва дергаем родительский метод load_data для общих полей. Обратите
    # внимание, что вызов без параметров тут эквивалентен super(data_hash), так
    # как те же параметры будут переданы методы super автоматически.
    super

    # Теперь достаем из хэша специфичное только для ссылки значение url
    @url = data_hash['url']
  end

end