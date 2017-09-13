var msg = document.getElementById('msg');

if (document.createElement('input').webkitSpeech === undefined) {
  msg.innerHTML = "x-webkit-speech is <strong>not supported</strong> in your browser.";
} else {
  msg.innerHTML = "x-webkit-speech is <strong>supported</strong> in your browser.";
}
