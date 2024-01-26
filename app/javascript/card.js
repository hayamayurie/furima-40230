const pay = () => {
  const payjp = Payjp('pk_test_a8185a394ef45531eb62fef9')
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    console.log("フォーム送信時にイベント発火")
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);