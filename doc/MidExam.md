* rails server -b 0.0.0.0  
    > server 啟動

* rails new MidPrac
    > 新建專案

### routes

``` ruby

    resources :candidates

```

* generate model user name party age:integer politics:text votes:integer
    > 產生model

* rails db:migrate
    > 產生DB

### db migration

```ruby

  class CreateCandidates < ActiveRecord::Migration[5.0]
    def change
      create_table :candidates do |t|
        t.string :name
        t.string :party
        t.integer :age
        t.text :politics
        t.integer :votes, default: 0

        t.timestamps
      end
    end
  end

```

* rails generate controller users
    > 產生 controller




``` ruby
  class PostsController < ApplicationController
    def index
      @posts = Post.all    # 取得所有的 Post 資料
    end
  end

```

 * form_for
     > form_for 方法可以接一個 Model 物件參數，在這裡我們先傳一個名為 @candidate 的實體變數給它，待會在 Controller 再看看它是怎麼做出來的。

 * render
    > 當使用 redirect 方式之後，等於是再次進到 /candidates/new 網址，也就是再執行了一次 new 這個 action，所有剛剛填的資料都會隨著消失；但 render :new 並不是「轉址」，而是「我還是執行 create 這個 action，只是顯示的時候借用 new 的 view 來用」而已，不是重新執行 new 這個 action 喔，很多新手在一開始接觸 Rails 時以為 render :new 是執行 new 這個 action，這點要特別注意。

 * attr_reader、attr_writer 以及 attr_accessor。這三個方法分別會做出「讀取」、「設定」以及「讀取 + 設定」的方法出來

``` ruby

 class Cat
    attr_accessor :name

    def initialize(name, gender)
      @name = name
      @gender = gender
    end

    def say_hello
      puts "hello, my name is #{@name}"
    end
  end

```

`Route，檔案：config/routes.rb`

* model

``` ruby

class Candidate < ApplicationRecord
  validates :name, presence: true
  has_many :logs
  
  def display_name
    "#{name}(#{party})"
  end
  
  def vote 
    self.votes = self.votes + 1
    # increment(:votes)
    save
  end
end

```