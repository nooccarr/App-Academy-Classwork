const APIUtil = {
  unfollowUser: id => {
    $.ajax({
      method: "DELETE",
      url: `/users/${id}/follow`,
      dataType: "json",
      success: function () {
        this.followState = "unfollowed";
        this.render();
      }
    });
  },

  followUser: id => {
    $.ajax({
      method: "POST",
      url: `/users/${id}/follow`,
      dataType: "json",
      success: function (response) {
        this.followState = "followed";
        this.render();
      }
    });
  }
};

module.exports = APIUtil;