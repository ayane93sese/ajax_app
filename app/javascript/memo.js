function memo() { //memoという関数を定義
  const submit =document.getElementById("submit"); //「投稿する」ボタンの情報を取得
  submit.addEventListener("click", (e) => { //投稿するボタンをクリックしたときに実行される関数を定義
    const formData = new FormData(document.getElementById("form")); //フォームに入力された値を取得
    const XHR = new XMLHttpRequest(); //XMLHttpRequestのオブジェクトを生成
    XHR.open("POST", "/posts", true); //RQの内容を引数へ記述(HTTPメソッド,パス,非同期通信)
    XHR.responseType = "json"; //返却するデータをJSONに指定
    XHR.send(formData); //フォームの情報を送信
    XHR.onload = () => { //memo.jsにレスポンスがあった場合の記述
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.post; //レスポンスとして返却されたメモのレコードを取得
      const list = document.getElementById("list"); //HTMLを描画する場所の親要素のlistを取得
      const formText = document.getElementById("content"); //送信後に入力フォームの文字列を削除するために、入力フォームの情報を取得
      const HTML = `
        <div class="post" data-id=${item.id}>
          <div class="post-date">
            投稿日時：${item.created_at}
          </div>
          <div class="post-content">
          ${item.content}
          </div>
        </div>`; //メモとして描画する部分のHTMLを定義
      list.insertAdjacentHTML("afterend", HTML); //listという要素に対して、insertAdjacentHTMLでHTMLを追加
      formText.value = ""; //入力したあとのフォームの文字を空の文字列に上書きする記述
    };
    e.preventDefault(); //クリックに標準設定されてるイベントを阻止する記述
  });
}
window.addEventListener("load", memo);