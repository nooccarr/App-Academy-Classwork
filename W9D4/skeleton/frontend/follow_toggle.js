const APIUtil = require("./api_util");

class FollowToggle {
  constructor(el) { // el: html element
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");

    this.render();
    // debugger
    this.$el.on("click", this.handleClick.bind(this, event));
  }

  render () {
    if (this.followState === "followed") {
      this.$el.text("Unfollow!");
    } else {
      this.$el.text("Follow!");
    }
  }

  handleClick (event) {
    // debugger
    event.preventDefault();
  
    if (this.followState === "followed") {
      APIUtil.unfollowUser(this.userId);
    } else {
      APIUtil.followUser(this.userId);
    }  
  
  }
}

// $.ajax().then(successCB,failCB);



module.exports = FollowToggle;