function check() {
  const posts = document.querySelectorAll(".post"); //発火させたい場所
  posts.forEach(function (post) { //要素1つ1つに対してクリックした時に作動する処理を、Eachを使って記述
    if (post.getAttribute("data-load") != null) { //重複したイベント発火を避ける記述
      return null;
    }
    post.setAttribute("data-load", "true");
    post.addEventListener("click", () => { //イベントリスナーでクリックの指定
      const postId = post.getAttribute("data-id"); //ここでクリックされたメモのIDを取得。index.html.erbで定義したカスタムデータのdata-idを活用
      const XHR = new XMLHttpRequest(); //オブジェクトを作成・これで変数XHRからXMLHttpRequestのメソッドを使用できる
      XHR.open("GET", `/posts/${postId}`, true); //XHRのopenメソッドを使用。どのようなリクエストをするのかを指定するメソッド。第一引数にはHTTPメソッド、第二引数にはパス、第三引数には非同期通信であるかを記述
      //ここまでがリクエストに関する記述
      XHR.responseType = "json"; //レスポンスの形式を指定
      XHR.send(); //リクエストを送信するメソッド

      //checked.jsにレスポンスがあったときの処理
      XHR.onload = () => {
        if (XHR.status != 200) { //エラーが起きた時の分岐
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }
        const item = XHR.response.post;
        if (item.checked === true) {
          post.setAttribute("data-check", "true");
        } else if (item.checked === false) {
          post.removeAttribute("data-check");
        }
      };

    });
  });
}
setInterval(check, 1000); //一定の時間ごとに、自動でcheckを実行する記述。1秒に1回check関数が実行される