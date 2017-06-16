# **RUBY**

## 02/24<br>
### git
1. mkdir hello
2. cd hello
3. git init //初始git
4. touch index.html
5. git status //檔案狀態
6. git config --list //設定黨 list
7. git config --global user.name  ‘yourself’
8. git config --global user.email ‘yourself’
9. git add index.html // 推入 staging area
10. git add --all or . // 所有檔案推入 staging area
11. git commit -m ‘comment’
12.git log
13.git log -p Filename
14. git blame Filename //檔案逐行log

## 03/03
1. git branch //看分支
2. git branch branchName //新建分支
3. git checkout //選分支
4. git checkout . //回上一版
5. git merge beanchName //合併
7. git branch -d branchName // 刪除分支
8. git checkout -b dog //有dog 分支就切換 沒有則建立
9. conflict
10. git tag  tagName commitID //貼標籤
11. git reset //取消 commit
12. git reset HEAD^ //倒退一版 新版東西推回add之前
13. git reset HEAD^ --hard //新版東西會直接刪除
14. git reset HEAD~100 //倒退100(可替換)步
15. git rebase -i commitID //修改歷史資料
16. pick → r 修改
17. pick → s 合併commit
18. pick → e 編輯
19. git push -f //以我為主(蓋板)  ##別用

### 4/21
> UJS

### gitHub
1. git remote add origin  https://github.com/RickyJian/projectName.git   //將專案從本地端推進gitHub
2. git push -u origin master//將專案從本地端推進gitHub

## 0310
### Codeanywhere
1. ruby get master
2. rvm install 2.3 // 2.3 : version
3. rvm ues 2.3.3 --default // 預設版本
4. gem install rails //安裝 rails Frmework
5. rails -v // 查rails 版本
6. cd projectName
7. rails server -b 0.0.0.0 (or) rails s -b 0.0.0.0
8. rails generate (or) g scaffold Book
    >+ *db table* table name 為 Book 但 url 為 .../books
    >+ title :string //String ==> varchar
    >+ content:text //text ==> text
    >+ price:integer

9. rails db:migrate // 建立 db table
10.  rails d scaffold Book //刪除

## 0331
1. ruby get master
2. rvm install 2.4
3. rvm use 2.4.1 --default
4. gem install rails
5. rails -v
6. rails new myVote // myVote project name
7. cd myVote // myVote project name
8. rails routes //  看底層路徑
9. rails server -b 0.0.0.0

### (Controller) candidates_controller.rb
```
class CandidatesController < ApplicationController
  def index

  end
end
```

### (View) index.html.erb

```
<h1>
  hello!!
</h1>

<%= [1,2,3,4,5,6].sample %>
```
## 0407
1. cd myVote
2. rails routes
3. rails g migration add_candidates
4. rails db:migrate // db做migrate

### (View) index.html.erb
```
<h1>Candidate List</h1>

<%= link_to "add candidate" , new_candidate_path %>
 //超連結用

```
### (Controller) candidates_controller.rb
```
class CandidatesController < ApplicationController
  def index

  end
  def new

  end
end
```

### (View) new.html.erb
```
<h1>
  New Candidate
</h1>

```

```
class AddCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :party
      t.integer :age
      t.text :politics
      t.integer :votes , default: 0
      timestamps // 自動增加 update 以及 createDate
    end
  end
end
```
## 0414
1. rails console
2. Candidate.find_by(id: 1)

### (Model) candidate.rb

```
  validates :name, presence: true  ##驗證欄位 name
```
###
```
def create
     #clean_params = params.required("candidate").permit(:name , :party , :age , :politics)  # 允許欄位從前端傳到端
     @candidate = Candidate.new(candidate_params)
     if @candidate.save
        redirect_to candidates_path
     else
       render 'new'  #導頁
        #redirect_to new_candidate_path
     end
  end
```

### (View) new.html.erb
```
<h1>Candidate List</h1>

<%= link_to "add candidate" , new_candidate_path %>
<ul>
  <% @candidates.each do |candidate| %>
  <li><%= candidate.name %></li>
  <li><%= link_to candidate.name, candidate_path(candidate.id) %></li>  
  <li><%= link_to candidate.name, candidate %></li>
  # 兩種皆可
  <li><%= link_to "delete" , candidate , method: "delete" %></li>
  <% end %>

</ul>
```

### (Controller) CandidatesController

```
def show
  @candidate = Candidate.find_by(id: params[:id])
end

def destroy
  @candidate = Candidate.find_by(id: params[:id])  #找資料
  @candidate.destroy  # 刪除
  redirect_to candidates_path  # 回到原本頁面
end
```

## 0420

### (View) show.html.erb

```
<h1>
  <%= @candidate.name %>
</h1>

age： <%= @candidate.age %>

<br />

<%= link_to "back" , candidate_path %>
```

### (Controller) CandidatesController

```
  def destroy 
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy
    flash[:notice] = "deleted!"   ##刪除後提醒使用者
    redirect_to candidates_path
  end

```

或

```
  def destroy 
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy
    redirect_to candidates_path , notice: "deleted!"
  end
```

### (View) application.html.erb

```
<%= flash[:notice] %>  ##將後台的資訊顯示在前台
```

### (View) index.html.erb

````
<h1>Candidate List</h1>

<%= link_to "add candidate" , new_candidate_path %>
<ul>
  <% @candidates.each do |candidate| %>
  <li>
      <%= link_to candidate.name, candidate %> 
      <%= link_to "edit", edit_candidate_path(candidate) %> ##編輯
      <%= link_to "delete" , candidate , method: "delete" , data: {confirm: 'delete?!' }  %>
  </li>
  
  <% end %>
  
</ul>

````

### (Controller) CandidatesController

```
  def edit
    @candidate = Candidate.find_by(id: params[:id])    
    
  end
```

### final 

#### (Controller) CandidatesController

```Ruby
class CandidatesController < ApplicationController
  
  before_action :find_candidate , only: [:show ,:edit ,:update , :destroy]  
  def show
    
  end
  def index
      @candidates = Candidate.all
  end 
  def new 
     @candidate = Candidate.new
  end
  
  def show 
    @candidate = Candidate.find_by(id: params[:id])
  end
  def create
  
     @candidate = Candidate.new(candidate_params)
     if @candidate.save
        redirect_to candidates_path , notice: "success!"
     else
       render 'new'
        #redirect_to new_candidate_path
     end
  end
  
  def edit
  #  @candidate = Candidate.find_by(id: params[:id])      
  #  redirect_to candidates_path , notice: "no data!" if  @candidate.nil? ##沒有直導回原頁面
  end
  
  def update
   # @candidate = Candidate.find_by(id: params[:id])      
   # redirect_to candidates_path , notice: "no data!" if  @candidate.nil? ##沒有直導回原頁面
     if @candidate.update (candidate_params) 
        redirect_to candidates_path , notice: "updated!"
     else
       render 'edit'
        #redirect_to new_candidate_path
     end
  end
  
  def destroy 
  #  @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy
    redirect_to candidates_path , notice: "deleted!"
  end
  def candidate_params 
  params.required("candidate").permit(:name , :party , :age , :politics)  # 允許欄位從前端傳到端
  end
  
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])      
    redirect_to candidates_path , notice: "no data!" if  @candidate.nil? ##沒有直導回原頁面
  end
end
```
#### (View) _form.html.erb

```
<%= form_for candidate do  |f| %> ##由後端傳路 candidate
name:  <%= f.text_field :name %></br>
age:  <%= f.text_field :age %></br>
party:  <%= f.text_field :party %></br>
politics:  <%= f.text_area :politics %></br>
<%= f.submit %></br>
<% end %>
```

#### (View) edit.html.erb

```
<h1>
  Edit Candidate
</h1>

<%= render 'form' , candidate: @candidate %> ##將@candidate 變數 傳路 candidate
```

#### (View) index.html.erb

```
<h1>Candidate List</h1>

<%= link_to "add candidate" , new_candidate_path %>

<table>
  <thead>
    <tr>
      <td>Name</td>
      <td>Age</td>
      <td>Politics</td>
      <td></td>
    </tr>
  </thead>
</table>

<tbody>
<% @candidates.each do |candidate| %>
  <tr>
  <td>  <%= link_to candidate.name, candidate %> </td>
    <td> <%= candidate.age %></td>
    <td> <%= candidate.politics %></td>
    <td>
      <%= link_to "edit" , edit_candidate_path(candidate) %>
      <%= link_to "delete" , candidate , method: "delete" ,data: { confirm: 'delete' } %>
    </td>
    
  </tr>
<% end %>
</tbody>
```

#### (View) new.html.erb

```
<h1>
  New Candidate
</h1>

<%= form_for @candidate do  |f| %>
name:  <%= f.text_field :name %></br>
age:  <%= f.text_field :age %></br>
party:  <%= f.text_field :party %></br>
politics:  <%= f.text_area :politics %></br>
<%= f.submit %></br>
<% end %>
```
#### (View) show.html.erb

```
<h1>
  <%= @candidate.name %>
</h1>

age： <%= @candidate.age %>
  
<br />
  
<%= link_to "back" , candidate_path %>
```

### 6/02


#### Gemfile



table name | type 
---------|----------
 A1 | B1 
 A2 | B2 
 A3 | B3 

* simple
* boostrap