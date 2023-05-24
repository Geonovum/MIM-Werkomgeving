
// Check code how examples are managed from Logius/W3C 
// (https://github.com/Logius-standaarden/respec/blob/develop/src/core/examples.js)


// find html-elements with class="definition"

const nodeList = document.querySelectorAll(".definition");
for (let i = 0; i < nodeList.length; i++) {
  nodeList[i].style.backgroundColor = "red";
}