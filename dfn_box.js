
// Check code how examples are managed from Logius/W3C 
// (https://github.com/Logius-standaarden/respec/blob/develop/src/core/examples.js)


// find html-elements with class="definition"


// OPTION 1
// const nodeList = document.querySelectorAll(".definition");
// for (let i = 0; i < nodeList.length; i++) {
//   nodeList[i].style.backgroundColor = "red";
// }

// OPTION 2
// Wait until resources have loaded, including ReSpec
document.addEventListener("load", function () {
  document.respec.ready.then(function () {
    // Do things
    console.log("This is a TEST!!!")
    // const collection = document.getElementsByClassName("definition");

    // for (let i = 0; i < collection.length; i++) {
    //   collection[i].style.backgroundColor = "red";
    // };
  });
});