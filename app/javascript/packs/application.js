// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "bootstrap";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

const handleBoardsVisibility = (visibility) => {
  const visibilityList = ["public", "private"];
  visibilityList.map((option) => {
    if (option == visibility) {
      $(`#${option}`).addClass("fw-bold");
      $(`.${option}-boards`).css("display", "flex");
    } else {
      $(`#${option}`).removeClass("fw-bold");
      $(`.${option}-boards`).css("display", "none");
    }
  });
};

$(document).on("turbolinks:load", function () {
  $("#public").click(function () {
    handleBoardsVisibility("public");
  });
  $("#private").click(function () {
    handleBoardsVisibility("private");
  });
  handleSectionActive();
});

const handleSectionActive = () => {
  const location =
    (window.location.pathname + "/").match(/(?<=\/)(.*?)(?=\/)/)[0];
  const sectionList = ["plans", "boards"];
  sectionList.map((item) => {
    if (item == location) {
      $(`#${item}`).removeClass("link-dark");
      $(`#${item}`).addClass("active");
    } else {
      $(`#${item}`).removeClass("active");
      $(`#${item}`).addClass("link-dark");
    }
  });
};
