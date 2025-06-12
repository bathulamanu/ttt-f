async function sayHello() {
  const name = document.getElementById("name").value;
  const res = await fetch(`http://localhost:5050/api/hello?name=${name}`);
  const data = await res.json();
  document.getElementById("greeting").innerText = data.message;
}
