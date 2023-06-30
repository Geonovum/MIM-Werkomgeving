
// Check code how examples are managed from Logius/W3C 
// (https://github.com/Logius-standaarden/respec/blob/develop/src/core/examples.js)


// find html-elements with class="definition"


// OPTION 1
// const nodeList = document.querySelectorAll(".definition");
// for (let i = 0; i < nodeList.length; i++) {
//   nodeList[i].style.backgroundColor = "red";
// }

// console.log("THIS IS A TEST");

// OPTION 2

// Wait until resources have loaded, including ReSpec
document.addEventListener("load", function () {
  document.respec.ready.then(function () {
    console.log("hello");
    // Do things
  });
});

// OPTION 3
// Wait until resources have loaded, including ReSpec
// document.addEventListener("load", function () {
//   document.respec.ready.then(function () {
//     // Do things
//     const collection = document.getElementsByClassName("definition");

//     for (let i = 0; i < collection.length; i++) {
//       collection[i].style.backgroundColor = "red";
//     };
//   });
// });