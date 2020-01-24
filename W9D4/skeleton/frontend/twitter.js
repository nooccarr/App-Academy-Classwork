const FollowToggle = require("./follow_toggle");


$(() => {
  let followButtons = []; // just in case, store these in an array
  $(".follow-toggle").each( function(idx, ele) {
    let fB = new FollowToggle(ele);
    followButtons.push(fB);
  });

});