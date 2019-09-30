class Communication
  attr_reader :greeting

  def initialize(greeting)
    @greeting = greeting
  end

  def greet
    puts @greeting if @greeting == "Hello"
  end
end

class WorkplaceCommunication < Communication
  attr_reader :place
  attr_reader :staff_name

  def initialize(**params)
    @greeting = params[:greeting]
    @place = params[:place]
    @staff_name = params[:staff_name]
  end

  def workplace?
    @place == "workplace"
  end

#職場ならBossとtanakaにだけ挨拶する。職場でないなら無視。
  def greet
    my_greeting =
    if self.workplace?
        case @staff_name
        when "Boss"
          "Hello,Boss"
        when "tanaka"
          @greeting
        else
          "（・・・誰？）"
        end
    else
      "「・・・・・」"
    end
    puts my_greeting
  end
end

class NoStringError < StandardError
  attr_reader :error_message
  attr_reader :error_params
  attr_reader :error_key
  attr_reader :error_value

  def initialize(params, key, value)
    @error_message = "文字列でない値が含まれています。"
    @error_params = params
    @error_key = key
    @error_value = value
  end
end

class  InvalidKeyError< StandardError
  attr_reader :error_message
  attr_reader :error_params
  attr_reader :error_key

  def initialize(params, key)
    @error_message = "無効なキーが含まれています。"
    @error_params = params
    @error_key = key
  end
end

#ハッシュの値が文字列ではなかった場合にNoStringErrorを発生させる
def check_value(params)
  params.each do |key, value|
    if value.class != String
      raise NoStringError.new(params, key, value)
    end
  end
end

#ハッシュのキーにworkplace_keysの要素以外が設定されていた場合にInvalidKeyErrorを発生させる
def check_key(params)
  workplace_greeting_keys = [:greeting, :place, :staff_name]
  params.each_key do |key|
    unless workplace_greeting_keys.include?(key)
      raise InvalidKeyError.new(params, key)
    end
  end
end

data = [
  { greeting: "Hello", place: "workplace", staff_name: "Boss"},
  { greeting: "Hi", place: "workplace", staff_name: "tanaka"},
  { greeting: "オッス！オラ悟空", place: "workplace", staff_name: "悟空"},
  { greeting: "Hello", place: "cafe", staff_name: "Boss"},
  { greeting: 1111},
  { task: "mail", place: "workplace" }
]

#dataの要素をチェックしてからWorkplaceCommunicationクラスのインスタンスを作成してgreetメソッドを実行。
data.each do |params|
  begin
    check_value(params)
    check_key(params)
    communication = WorkplaceCommunication.new(params)
    communication.greet
  rescue NoStringError => e
    puts "#{e.class}: #{e.error_message} => #{e.error_params}"
  rescue InvalidKeyError => e
    puts "#{e.class}: #{e.error_message} => 無効なキー：#{e.error_key}, ハッシュ：#{e.error_params}"
  end
end

=begin
以下は出力内容

Hello,Boss
Hi
（・・・誰？）
「・・・・・」
NoStringError: 文字列でない値が含まれています。 => {:greeting=>1111}
InvalidKeyError: 無効なキーが含まれています。 => 無効なキー：task, ハッシュ：{:task=>"mail", :place=>"workplace"}

= end