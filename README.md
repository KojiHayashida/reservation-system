# README

追加実装したい機能、足りていない機能

- 当日から過去の予約を不可能にしたい

修正案件

- リダイレクト先が分からない/おかしい（すべてdashboard、新規予約作成フォーム(reservation_controller.rb create)、利用者情報編集）
- バリデーションチェックを行った際にメッセージが出ない
- dashboard 予約一覧をきちんとした表に起こす
- dashborad/users/edit ユーザー情報の編集画面にて、パスワードの入力を行わずに、ユーザー情報を編集できるようにしたい。
- users_controller.rb L21~ createアクションを行う際に、名前、email、passwordの最低限の入力形式のバリデーションチェックをプログラムに組み込みたい→一応書いた　既存データが割と適当に文字を突っ込んであるため、動くかはまだチェックしてない
- \app\views\simple_calendar\_calendar.html.erb　L6 　NEXTで一週間送りにしたい
- 全体的にレイアウトをきれいに整えたい
- 日本語化！
