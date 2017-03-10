#**RUBY**

##02/24<br>
###git
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

##03/03
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


###gitHub
1. git remote add origin  https://github.com/RickyJian/projectName.git   //將專案從本地端推進gitHub
2. git push -u origin master//將專案從本地端推進gitHub

##0310
###Codeanywhere
1. ruby get master
2. rvm install 2.3 // 2.3 : version
3. rvm ues 2.3.3 --default // 預設版本
4. gem install rails //安裝 rails Frmework
5. rails -v // 查rails 版本
6. cd projectName
7. rails server -b 0.0.0.0 (or) rails s -b 0.0.0.0
8. rails generate (or) g scaffold Book
> *db table* table name 為 Book 但 url 為 .../books
>> + title :string //String ==> varchar
>> + content:text //text ==> text
>> + price:integer
>
9. rails db:migrate // 建立 db table
10.  rails d scaffold Book //刪除
