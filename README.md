
### インストール手順
1. Vagrant と VirtualBoxをインストールする
2. このリポジトリをクローン
3. cmd.exe などの端末で vagrant up
4. http://192.168.33.55にアクセスすると、CodeIgniter3デフォルトのwelcomePageを確認できます

### Rest APIを実装/利用する手順
1. public_html/application/controllers/api/ 以下にコントローラを作成
2. public_html/application/config/routes.php で、どのURIで受け付けるかと、呼び出すメソッドを指定
3. public_html/application/views/以下のビューファイルにあるscript記述個所から ajaxを使って呼び出す
